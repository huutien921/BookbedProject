package com.booking.bookbed;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableAsync
public class BookbedProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(BookbedProjectApplication.class, args);
	}

}
