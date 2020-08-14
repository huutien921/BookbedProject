package com.booking.bookbed.controller.user;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import com.booking.bookbed.entities.Sale;
import com.booking.bookbed.services.PanelService;
import com.booking.bookbed.services.SaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = { "promotions" })
public class PromotionController {
	@Autowired
	private SaleService saleService;
	@Autowired
	private MessageSource messageSource;
	@Autowired
	private PanelService panelService;
	@RequestMapping(value = {"index", "" }, method = RequestMethod.GET)
	public String index(HttpServletRequest request, ModelMap map) {
		List<Sale> sales = saleService.findByLimitAndDate(true, 16, new Date());
		PagedListHolder pagedListHolder = new PagedListHolder<>(sales);
		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(8);
		map.put("title",messageSource.getMessage("nav.promotions", null, LocaleContextHolder.getLocale()));
		map.put("pagedListHolder", pagedListHolder);
		try {
			map.put("panel", panelService.findById(2));
		} catch (Exception e) {
			map.put("panel", null);
		}
	
		
		
		return "promotion.index";
	}
}
