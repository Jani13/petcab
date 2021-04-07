package com.petcab.work.call.model.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.transaction.annotation.Transactional;

@ExtendWith(SpringExtension.class)
@ContextConfiguration( locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
									"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"} ) 
class CallServiceTest {

	// mapper, service test만 가능
	
	@Autowired
	private CallService callService;
	
	@Test
	void create() {
		assertThat(callService).isNotNull();
	}
	
	@Test
	@Transactional(value="transactionManager")
	void testInsertCall() {
		
		fail("Not yet implemented");
	}

	@Test
	void testInsertEmgCall() {
		fail("Not yet implemented");
	}

	@Test
	void testUpdateCall() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectCall() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectEmgCall() {
		fail("Not yet implemented");
	}

	@Test
	void testDriverWaitCallList() {
		fail("Not yet implemented");
	}

	@Test
	void testDriverEndCallList() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectAllCall() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectGenCall() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectEmergCall() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectCancelledCall() {
		fail("Not yet implemented");
	}

	@Test
	void testUseCallUserId() {
		fail("Not yet implemented");
	}

	@Test
	void testEndCallUserId() {
		fail("Not yet implemented");
	}

}
