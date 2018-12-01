package net.zibady.study.repository;

import net.zibady.study.domain.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by zibady on 11/28/18.
 */

// This will be AUTO IMPLEMENTED by Spring into a Bean called userRepository
// CRUD refers Create, Read, Update, Delete
//@Repository
public interface MessageRepository extends CrudRepository<Message, Long> {
    List<Message> findByTag (String tag);

}
