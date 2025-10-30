package com.ecounity.ecounity;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;

@Import(TestcontainersConfiguration.class)
@SpringBootTest
class EcoUnityApplicationTests {

	@Test
	void contextLoads() {
	}

}
