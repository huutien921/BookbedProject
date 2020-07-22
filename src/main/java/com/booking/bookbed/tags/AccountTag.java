package com.booking.bookbed.tags;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.booking.bookbed.entities.Account;
import com.booking.bookbed.services.AccountService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

public class AccountTag extends RequestContextAwareTag {
    
    private AccountService accountService;
    

    
    @Override
    protected int doStartTagInternal() throws Exception {
         accountService=  getRequestContext().getWebApplicationContext().getBean(AccountService.class);

    return 0;
    }

    @Override
    public void doFinally() {
        try {
              String jspPage = "../../tags/account/index.jsp";
            HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
           
            request.setAttribute("account", accountService.findByUsername("tien_user"));
            request.getRequestDispatcher(jspPage);
            pageContext.include(jspPage);

            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    
}