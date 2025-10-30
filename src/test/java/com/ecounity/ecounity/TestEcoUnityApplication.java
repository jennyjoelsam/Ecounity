package com.ecounity.ecounity;

import org.springframework.boot.SpringApplication;

public class TestEcoUnityApplication {

	public static void main(String[] args) {
		SpringApplication.from(EcoUnityApplication::main).with(TestcontainersConfiguration.class).run(args);
	}

}
