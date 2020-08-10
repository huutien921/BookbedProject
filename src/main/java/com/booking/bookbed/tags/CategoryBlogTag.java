package com.booking.bookbed.tags;

import javax.servlet.http.HttpServletRequest;

import com.booking.bookbed.services.BlogService;
import com.booking.bookbed.services.CategoryBlogService;

import org.springframework.web.servlet.tags.RequestContextAwareTag;

public class CategoryBlogTag extends RequestContextAwareTag {
    
    private CategoryBlogService categoryBlogService ;
    private BlogService blogService ;
    
    @Override
    protected int doStartTagInternal() throws Exception {
        categoryBlogService=  getRequestContext().getWebApplicationContext().getBean(CategoryBlogService.class);
        blogService=  getRequestContext().getWebApplicationContext().getBean(BlogService.class);
        
    return 0;
    }

    @Override
    public void doFinally() {
        try {
              String jspPage = "../../tags/blog/category.jsp";
            HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
            request.setAttribute("categories", categoryBlogService.findAllByStatus(true));
            request.setAttribute("blogs", blogService.findLimitByStatus(true, 3));
            request.getRequestDispatcher(jspPage);
            pageContext.include(jspPage);      
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    
}