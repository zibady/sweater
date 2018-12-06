package net.zibady.study.repository;

import net.zibady.study.domain.Message;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


// This will be AUTO IMPLEMENTED by Spring into a Bean called messageRepository
// CRUD refers Create, Read, Update, Delete
//@Repository
public interface MessageRepository extends JpaRepository<Message, Long> {
    List<Message> findByTag (String tag);

}
