package com.booking.bookbed.helper;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.stream.Stream;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

@Component("uploadFileHelper")
public class UploadFileHelper implements ServletContextAware {
	private ServletContext servletContext;
	

	// method save file
	public String saveFile(MultipartFile file, String folder) {

		if (file.isEmpty()) {
			return null;
		} else {

			try {
				
				// them thoi gian sau ten file de ko bi trung ten
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("ddMMyyyyHHmmss");
				String fileName = simpleDateFormat.format(new Date()) + file.getOriginalFilename();

				byte[] bytes = file.getBytes();
				Path path = Paths.get(servletContext.getRealPath("/uploads/images/" +folder +"/" + fileName));
				Files.write(path, bytes);
				return fileName;
			} catch (Exception e) {
				return null;
			}
		}
	}
	// method delete file
	public boolean deleteFile(String name) {
		try {
			Path path = Paths.get(servletContext.getRealPath("/uploads/images/rooms/" + name));
			Files.delete(path);
			return true;
		} catch (Exception e) {
			return false;
		}

	}
	public String readFileMail(String fileName){
try {

	Path path = Paths.get(servletContext.getRealPath("/uploads/mail/" + fileName));
	StringBuilder stringBuilder = new StringBuilder();
	Stream stream = Files.lines( path, StandardCharsets.UTF_8);
	stream.forEach(s -> stringBuilder.append(s).append("\n"));
	return stringBuilder.toString()  ;
} catch (Exception e) {
	return null;
}

	} 

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;

	}
}
