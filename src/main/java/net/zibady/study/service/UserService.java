package net.zibady.study.service;

import net.zibady.study.domain.Role;
import net.zibady.study.domain.User;
import net.zibady.study.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService{
    @Value("${site.address}")
    private String siteAddress;

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private MailSender mailSender;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepository.findByUsername(username);
    }

    public boolean registerUser(User user) {
        User userFromDb = userRepository.findByUsername(user.getUsername());

        if (userFromDb != null) {
            return false;
        }

        user.setActive(false);
        user.setRoles(Collections.singleton(Role.USER));
//        user.setSex(sex);

        user.setActivationCode(UUID.randomUUID().toString());
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        switch (user.getSex()) {
            case FEMALE: {
                user.setAvatarPhoto("/static/avatar_female.png");
            } break;
            case MALE: {
                user.setAvatarPhoto("/static/avatar_male.png");
            } break;
            default: {
                user.setSex("unknown");
                user.setAvatarPhoto("/static/avatar_male.png");
            } break;
        }

        userRepository.save(user);

        if (!StringUtils.isEmpty(user.getEmail())) {
            String text = String.format(
                    "Hello, %s!\n" +
                            "Welcome to Sweater.\n" +
                            "Please, visit next link %sactivate/%s",
                    user.getUsername(),
                    siteAddress,
                    user.getActivationCode()
            );
            mailSender.send(user.getEmail(), "Activation code", text);
        }

        return true;
    }

    public boolean activateUser(String code) {
        User user = userRepository.findByActivationCode(code);

        if (user == null) {
            return false;
        }
        user.setActivationCode(null);
        user.setActive(true);
        userRepository.save(user);

        return true;
    }

    public List<User> findAll() {
        return userRepository.findAll();
    }

    public void saveUserRole(User user, String username, Map<String, String> form) {
        user.setUsername(username);
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key: form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepository.save(user);
    }

    public void updateProfile(User user, Map<String, String> form) {
        String userEmail = user.getEmail();
        String email = form.get("email");
        String password = form.get("password");
        String sex = form.get("sex");
        String photo = form.get("photo");


        boolean isEmailChanged = (userEmail != null && !userEmail.equals(email) ||
                (email != null && !email.equals(userEmail)));
        if (isEmailChanged && !email.isEmpty()) {
            user.setEmail(email);
        }

        if (password != null && !password.isEmpty()) {
            user.setPassword(passwordEncoder.encode(password));
        }

        if (sex != null && !sex.isEmpty()) {
            user.setSex(sex);
        }

        if (photo != null) {
            user.setAvatarPhoto(photo);
        }

        userRepository.save(user);
    }
}
