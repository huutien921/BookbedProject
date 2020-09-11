package com.booking.bookbed.tags;


import javax.servlet.http.HttpServletRequest;

import com.booking.bookbed.services.HotelService;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import org.springframework.web.servlet.tags.RequestContextAwareTag;

public class HotelListTag extends RequestContextAwareTag {

  
    private HotelService hotelService;

    
    @Override
    protected int doStartTagInternal() throws Exception {
       
        
        hotelService=  getRequestContext().getWebApplicationContext().getBean(HotelService.class);
    return 0;
    }

    @Override
    public void doFinally() {
        try {
            
              String jspPage = "../../tags/hotel/list_hotel.jsp";
            HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            request.setAttribute("hotels", hotelService.findByUsername(authentication.getName()));
            request.getRequestDispatcher(jspPage);
            pageContext.include(jspPage);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    
}