package net.zibady.study.controller;

import net.zibady.study.domain.Dialog;
import net.zibady.study.domain.DialogMsg;
import net.zibady.study.domain.User;
import net.zibady.study.service.DialogService;
import net.zibady.study.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/user/dialogs")
public class DialogController {
    @Autowired
    private UserService userService;
    @Autowired
    private DialogService dialogService;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping
    public String getDialogs(
            @AuthenticationPrincipal User currentUser,
            @RequestParam(name = "user", required = false) User user,
            @RequestParam(name = "cr", required = false) boolean create,
            Dialog dialog,
            Model model
    ) {
        if (create && dialog.getId() == null) {
            dialogService.createDialog(currentUser, user, dialog);
        }
            List<Dialog> dialogs = currentUser.getDialogs();
            model.addAttribute("dialogs", dialogs);
            model.addAttribute("users", userService.findAll());

        return  "userDialogs"; //REDIRECT?
    }

    @GetMapping("/{dialog}")
    public String dialog(
            @AuthenticationPrincipal User user,
            @PathVariable Dialog dialog,
            Model model
    ) {
        Set<User> users = dialog.getUsers();
        List<DialogMsg> messages = dialog.getMessages();

        model.addAttribute("users", users);
        model.addAttribute("messages", messages);

        return "dialog";
    }

    @PostMapping("/{dialog}")
    public String addMessageToDialog(
            @AuthenticationPrincipal User user,
            @RequestParam(name = "file", required = false) MultipartFile file,
            @RequestParam String text,
            @PathVariable Dialog dialog,
            Model model
    ) throws IOException {

        dialogService.addDialogMsg(dialog, user, text, ControllerUtils.getNewFile(file, uploadPath));

        Set<User> users = dialog.getUsers();
        List<DialogMsg> messages = dialog.getMessages();

        model.addAttribute("users", users);
        model.addAttribute("messages", messages);

        return "dialog";
    }



}
