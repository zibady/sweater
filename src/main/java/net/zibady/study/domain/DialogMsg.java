package net.zibady.study.domain;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "dialog_msg")
public class DialogMsg {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long Id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "dialog_id")
    private Dialog dialog;

    @Length(max = 2048, message = "Message to long (more than 2 kB)")
    private String text;

    private String file;

    private LocalDateTime createTime;

    public DialogMsg() {
    }

    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        Id = id;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public Dialog getDialog() {
        return dialog;
    }

    public void setDialog(Dialog dialog) {
        this.dialog = dialog;
    }
}
