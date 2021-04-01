package com.petcab.work.call;

import static org.assertj.core.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.petcab.work.call.model.vo.Call;

@ExtendWith(SpringExtension.class)
@ContextConfiguration( locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"} )
public class CallTest {
	
	@Autowired(required = false)
	private Call call;
	
	@Test
	void test() {
		
	}
	
	@Test
	void create() {
		assertThat(call).isNotNull();
	}
	
}
