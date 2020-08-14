package com.booking.bookbed.tags;
import javax.servlet.http.HttpServletRequest;

import com.booking.bookbed.services.AboutService;

import org.springframework.web.servlet.tags.RequestContextAwareTag;
public class TemplateTag extends RequestContextAwareTag {

    private AboutService aboutService;
    @Override
    protected int doStartTagInternal() throws Exception {
        aboutService=  getRequestContext().getWebApplicationContext().getBean(AboutService.class);
    return 0;
    }

    @Override
    public void doFinally() {
        try {
            
             String jspPage = "../../tags/template/footer.jsp";
           HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
          request.getRequestDispatcher(jspPage);
          request.setAttribute("about", aboutService.findById(1));
     
            pageContext.include(jspPage);

            
        } catch ( Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    
}