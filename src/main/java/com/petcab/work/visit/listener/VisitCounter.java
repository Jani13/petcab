package com.petcab.work.visit.listener;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.petcab.work.visit.model.dao.VisitCountDao;
import com.petcab.work.visit.model.vo.VisitCountVo;

public class VisitCounter implements HttpSessionListener {
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		HttpSession session = arg0.getSession();
		
		WebApplicationContext wac = WebApplicationContextUtils.
									getRequiredWebApplicationContext(session.getServletContext());
		
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();

		VisitCountDao visitCountDao = (VisitCountDao)wac.getBean("visitCountDao");
		VisitCountVo vo = new VisitCountVo();
		
		vo.setVisitIp(req.getRemoteAddr());
		
		visitCountDao.insertVisitor(vo);
		
		System.out.println(vo);
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		//TODO
	}
}
