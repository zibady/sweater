package net.zibady.study.domain;


import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "dialog")
public class Dialog {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "dialog") //todo .LEAZY
    private List<DialogMsg> messages;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "users_dialogs",
            joinColumns = { @JoinColumn(name = "dialog_id") },
            inverseJoinColumns = { @JoinColumn(name = "user_id") }
    )
    private Set<User> users;

    public Dialog() {
    }

    public Dialog(Set<User> users) {
        this.users = users;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<DialogMsg> getMessages() {
        return messages;
    }

    public void setMessages(List<DialogMsg> messages) {
        this.messages = messages;
    }

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

}
