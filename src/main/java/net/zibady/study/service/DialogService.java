package net.zibady.study.service;


import net.zibady.study.domain.Dialog;
import net.zibady.study.domain.DialogMsg;
import net.zibady.study.domain.User;
import net.zibady.study.repository.DialogMsgRepository;
import net.zibady.study.repository.DialogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Service
public class DialogService {
    @Autowired
    private DialogRepository dialogRepository;

    @Autowired
    private DialogMsgRepository dialogMsgRepository;

    public void createDialog(User currentUser, User user, Dialog dialog) {

        Set<User> users = new HashSet<>();
        users.add(currentUser);
        users.add(user);

        dialog.setUsers(users);

        dialogRepository.save(dialog);
    }


    public void addDialogMsg(Dialog dialog, User user, String text, String file) {
        DialogMsg msg = new DialogMsg();

        msg.setDialog(dialog);
        msg.setAuthor(user);
        msg.setText(text);
        msg.setCreateTime(LocalDateTime.now());
        if (file != null && !file.isEmpty()) {
            msg.setFile(file);
        }
        dialogMsgRepository.save(msg);
    }
}
