package com.erison.beltexam.services;

import com.erison.beltexam.models.Tab;
import com.erison.beltexam.models.User;
import com.erison.beltexam.repositories.TabRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TabService {

    @Autowired
    private TabRepository tabRepository;

   public List<Tab>allTabels (){
       return tabRepository.findAll();
   }


   public void save(Tab table){
       tabRepository.save(table);
   }

   public void update(Tab table){
       tabRepository.save(table);
   }
   public void delete(Tab table){
       tabRepository.delete(table);
   }
   public Tab findByID(Long id){
       Optional<Tab>theTables  = tabRepository.findById(id);
       if (theTables.isPresent()){
           return theTables.get();
       }else {
           return null;
       }
   }

    public List<Tab>allOrderdTables(User user){
    return tabRepository.findAllByUserOrderByCreatedAtDesc(user);
    }

    public List<Tab>UnnasignmentTables(){
       return tabRepository.findAllByUserIsNull();
    }
}
