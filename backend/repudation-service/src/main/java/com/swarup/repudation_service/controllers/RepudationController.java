package com.swarup.repudation_service.controllers;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/repudation")
public class RepudationController {

    @GetMapping("/update")
    public ResponseEntity<?>  updateUserReputation(){

    }
}
