package com.booking.bookbed.tags;

import javax.servlet.http.HttpServletRequest;


import com.booking.bookbed.services.AccountService;


import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
          
            request.setAttribute("account", accountService.findByUsername( authentication.getName()));
            request.getRequestDispatcher(jspPage);
            pageContext.include(jspPage);

            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    
}