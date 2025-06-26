package com.swarup.repudation_service;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class RepudationServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(RepudationServiceApplication.class, args);
	}

}
