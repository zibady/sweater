package net.zibady.study.service;

import net.zibady.study.domain.Role;
import net.zibady.study.domain.User;
import net.zibady.study.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Collections;
import java.util.UUID;

@Service
public class UserService implements UserDetailsService{
    @Value("${site.address}")
    private String siteAddress;

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private MailSender mailSender;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepository.findByUsername(username);
    }

    public boolean registerUser(User user) {
        User userFromDb = userRepository.findByUsername(user.getUsername());

        if (userFromDb != null) {
            return false;
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());

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
        userRepository.save(user);

        return true;
    }
}
