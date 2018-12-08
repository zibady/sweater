package net.zibady.study.controller;


import net.zibady.study.domain.Role;
import net.zibady.study.domain.User;
import net.zibady.study.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @PreAuthorize("hasAuthority('ADMIN')") // вказується хто має доступ
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
    public String userSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user
    ) {
        userService.saveUser(user, username, form);

        return "redirect:user";
    }

    @GetMapping("profile")
    public String getProfile(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("email", user.getEmail());

        return "profile";
    }

    @PostMapping("profile")
    public String updateProfile(
            @RequestParam(name = "password2") String password2,
            @AuthenticationPrincipal User current, //- get current active user*/
            @Valid User user, //Spring will automatically create user???
            BindingResult bindingResult,
            Model model
    ) {
        if (user.getPassword() != null && !user.getPassword().equals(password2)) {
            model.addAttribute("passwordError", "Passwords are different!");
        }

        if (bindingResult.hasErrors() || model.containsAttribute("passwordError")) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);

            return "profile";
        }

        userService.updateProfile(current, password2, user.getEmail());

        return "profile";

    }
}
