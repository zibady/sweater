package net.zibady.study.controller;

import net.zibady.study.domain.Message;
import net.zibady.study.domain.User;
import net.zibady.study.repository.MessageRepository;
import net.zibady.study.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collector;
import java.util.stream.Collectors;


@Controller
@RequestMapping(path="/")
public class MainController {
    @Autowired
    private MessageRepository messageRepository;

    @Autowired
    private MessageService messageService;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping
    public String greeting() {
        return "greeting";
    }

     @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {

        Iterable<Message> messages;

         if (filter != null && !filter.isEmpty()) {
             messages = messageRepository.findByTag(filter);
         } else {
             messages = messageRepository.findAll();
         }

        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);
        return "main";
    }

   @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @Valid Message message,
            BindingResult bindingResult,
            @RequestParam("file") MultipartFile file,
            Model model
   ) throws IOException {

       if (bindingResult.hasErrors()) {
           Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);

           model.mergeAttributes(errorsMap);
           model.addAttribute("message", message);

       } else {
           message.setAuthor(user);
           messageService.saveMessage(message, ControllerUtils.getNewFile(file, uploadPath));

           model.addAttribute("message", null);

       }

       Iterable<Message> messages = messageRepository.findAll();

       model.addAttribute("messages", messages);

        return "main";
   }

}
