package net.zibady.study.controller;


import net.zibady.study.domain.User;
import net.zibady.study.domain.enums.Role;
import net.zibady.study.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping
public class UserController {
    @Autowired
    private UserService userService;

    @Value("${upload.path}")
    private String uploadPath;

    @PreAuthorize("hasAuthority('ADMIN')") // described who has access
    @GetMapping("/control")
    public String controlPanel(Model model) {
        model.addAttribute("users", userService.findAll());

        return "controlPanel";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/user/{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());

        return "userEdit";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/user/{user}")
    public String userChangeRole(
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user
    ) {
        userService.saveUserRole(user, form);

        return "redirect:/control";
    }

    @GetMapping("/users")
    public String userList(Model model) {
        model.addAttribute("users", userService.findAll());

        return "userList";
    }

    @GetMapping("/user/profile")
    //@AuthenticationPrincipal User user - get current active user from context ???
    public String getProfile(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("email", user.getEmail());
        model.addAttribute("sex", user.getSex().toString());

        return "profile";
    }

    @PostMapping("/user/profile")
    public String updateProfile(
            @RequestParam("password") String password,
            @RequestParam("password2") String password2,
            @RequestParam("file") MultipartFile file,
            @RequestParam Map<String, String> form,
            @AuthenticationPrincipal User user,
            Model model
    ) throws IOException {
        if ((password != null && !password.equals(password2)) ||
            (password2 != null && !password2.equals(password))) {

            model.addAttribute("passwordError", "Passwords are different!");

            return "profile";
        }
        form.put("photo", ControllerUtils.getNewFile(file, uploadPath));
        userService.updateProfile(user, form);

        return "redirect:profile";

    }

}
