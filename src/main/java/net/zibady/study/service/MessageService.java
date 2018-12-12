package net.zibady.study.service;

import net.zibady.study.domain.Message;
import net.zibady.study.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageService {
    @Autowired
    private MessageRepository messageRepository;

    public void saveMessage(Message message, String file) {
        message.setFilename(file);
        messageRepository.save(message);
    }

    public void updateMessage(Message message, Message newMessage, String file) {

        if (file != null && !file.isEmpty()) {
            message.setFilename(file);
        }
        message.setTag(newMessage.getTag());
        message.setText(newMessage.getText());

        messageRepository.save(message);
    }
}