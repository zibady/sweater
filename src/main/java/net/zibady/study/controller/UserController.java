package net.zibady.study.controller;


import net.zibady.study.domain.Role;
import net.zibady.study.domain.User;
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
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @Value("${upload.path}")
    private String uploadPath;

    @PreAuthorize("hasAuthority('ADMIN')") // described who has access
    @GetMapping
    public String userList(Model model) {
        model.addAttribute("users", userService.findAll());

        return "userList";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());

        return "userEdit";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping
    public String userChangeRole(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user
    ) {
        userService.saveUserRole(user, username, form);

        return "redirect:user";
    }

    @GetMapping("profile")
    //@AuthenticationPrincipal User user - get current active user from context ???
    public String getProfile(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("email", user.getEmail());

        return "profile";
    }

    @PostMapping("profile")
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
