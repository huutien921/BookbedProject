package com.booking.bookbed.tags;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.booking.bookbed.services.AccountService;
import com.booking.bookbed.services.HotelService;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

public class HotelTag extends RequestContextAwareTag {

  
    private HotelService hotelService;
    
    @Override
    protected int doStartTagInternal() throws Exception {
       
        hotelService=  getRequestContext().getWebApplicationContext().getBean(HotelService.class);
    return 0;
    }

    @Override
    public void doFinally() {
        try {
            
              String jspPage = "../../tags/hotel/card_info.jsp";
            HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
         Map<String, String> pathVariables = (Map<String, String>) request
            .getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);
            Integer id = Integer.valueOf(pathVariables.get("id"));
            request.setAttribute("hotel", hotelService.findById(id));
            request.getRequestDispatcher(jspPage);
            pageContext.include(jspPage);

            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    
}