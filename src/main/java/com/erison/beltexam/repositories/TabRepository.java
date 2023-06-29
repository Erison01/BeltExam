package com.erison.beltexam.repositories;

import com.erison.beltexam.models.Tab;
import com.erison.beltexam.models.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TabRepository extends CrudRepository<Tab,Long> {
    List<Tab>findAll();

    List<Tab>findAllByUserOrderByCreatedAtDesc(User user);

    Optional<Tab>findById(Long id);


    List<Tab>findAllByUserIsNull();
}
