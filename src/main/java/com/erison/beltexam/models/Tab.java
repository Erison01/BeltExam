package com.erison.beltexam.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Entity
@Table(name="tables")
public class Tab {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Size(min = 2,message = "At least 2 characters")
   private String name;

    @NotBlank
    private String notes;

    @NotNull
    @Range(min = 1,max = 10,message = "Number of Guest must be between 1 and 10 ")
    private int numOfGuests;



    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    public Tab(){}

    public Tab(Long id, String name, String notes, int numOfGuests,User user) {
        this.id = id;
        this.name = name;
        this.notes = notes;
        this.numOfGuests = numOfGuests;
        this.user = user;

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public int getNumOfGuests() {
        return numOfGuests;
    }

    public void setNumOfGuests(int numOfGuests) {
        this.numOfGuests = numOfGuests;
    }

    public User getUser() {
        return user;
    }

    public Date getCreatedAt(){
        return createdAt;
    }

    public void setUser(User user) {
        this.user = user;
    }
    @PrePersist
    public void createOn(){
        this.createdAt = new Date();
    }

    @PreUpdate
    public void updateOn(){
        this.updatedAt = new Date();
    }
}
