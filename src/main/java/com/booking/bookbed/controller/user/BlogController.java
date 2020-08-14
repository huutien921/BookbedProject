package com.booking.bookbed.controller.user;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import com.booking.bookbed.entities.Blog;
import com.booking.bookbed.entities.CategoryBlog;
import com.booking.bookbed.services.BlogService;
import com.booking.bookbed.services.CategoryBlogService;
import com.booking.bookbed.services.PanelService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
@RequestMapping(value = {"blog"})
public class BlogController {
	@Autowired
	private BlogService blogService;
	@Autowired
	private CategoryBlogService categoryBlogService;
	@Autowired
	private MessageSource messageSource;
	@Autowired
	private PanelService panelService;
	@RequestMapping(value = {"index",""} , method = RequestMethod.GET)
	public String index(HttpServletRequest request , ModelMap map ) {
		List<Blog> blogs = blogService.findAllByStatus(true);
		PagedListHolder pagedListHolder = new PagedListHolder<>(blogs);
		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(8);
		map.put("pagedListHolder",pagedListHolder );
		map.put("title",messageSource.getMessage("nav.blog", null, LocaleContextHolder.getLocale()));
		try {
			map.put("panel", panelService.findById(3));
		} catch (Exception e) {
			map.put("panel", null);
		}
		return "blog.index";
	}
	@RequestMapping(value = "detail/{id}" , method = RequestMethod.GET)
	public String detail(@PathVariable("id") int id ,ModelMap map ) {
		if (id==1) {
			return "redirect:/blog/about-us";
		}
		map.put("blog", blogService.findById(id));
		map.put("about", blogService.findById(1));
		map.put("title",messageSource.getMessage("nav.blog", null, LocaleContextHolder.getLocale()));
		return "blog.detail";
	}
	@RequestMapping(value = "about-us" , method = RequestMethod.GET)
	public String about(ModelMap map ) {
		map.put("blog", blogService.findById(1));
		map.put("title",blogService.findById(1).getTitle());
		return "blog.detail";
	}
	@RequestMapping(value = "category/{id}" , method = RequestMethod.GET)
	public String category(HttpServletRequest request,@PathVariable("id") int id,ModelMap map ) {
		CategoryBlog categoryBlog =categoryBlogService.findById(id);
		List<Blog> blogs = categoryBlog.getBlogs();
		PagedListHolder pagedListHolder = new PagedListHolder<>(blogs);
		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(3);
		map.put("pagedListHolder",pagedListHolder );
		map.put("category", categoryBlog);
		map.put("title",messageSource.getMessage("blog.category", null, LocaleContextHolder.getLocale()));
		return "blog.category";
	}
}
