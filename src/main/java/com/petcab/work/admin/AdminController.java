package com.petcab.work.admin;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String adminMain() {

		return "admin/adminMain";
	}
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String infoMain() {

		return "admin/adminUserInfoMain";
	}
	@RequestMapping(value = "/info/driver", method = RequestMethod.GET)
	public String infoDriver() {

		return "admin/adminUserInfoDriver";
	}

	@RequestMapping(value = "/info/user", method = RequestMethod.GET)
	public String infoUser() {

		return "admin/adminUserInfoUser";
	}
	@RequestMapping(value = "/info/partner", method = RequestMethod.GET)
	public String infoCompany() {

		return "admin/adminUserInfoPartner";
	}
	@RequestMapping(value = "/call/normal", method = RequestMethod.GET)
	public String callNormal() {

		return "admin/adminCallinfo";
	}@RequestMapping(value = "/call/emergency", method = RequestMethod.GET)
	public String callEmergency() {

		return "admin/adminCallEminfo";
	}@RequestMapping(value = "/call/cancel", method = RequestMethod.GET)
	public String callCancel() {

		return "admin/adminCallCancel";
	}
	
	@RequestMapping(value = "/pay", method = RequestMethod.GET)
	public String payReview() {

		return "admin/adminPayReview";
	}@RequestMapping(value = "/apply", method = RequestMethod.GET)
	public String apply() {

		return "admin/adminApply";
	}@RequestMapping(value = "/apply/driver", method = RequestMethod.GET)
	public String applyDriver() {

		return "admin/adminApplyDriver";
	}@RequestMapping(value = "/apply/partner", method = RequestMethod.GET)
	public String applyPartner() {

		return "admin/adminApplyPartner";
	}

}
