package com.booking.bookbed.helper;

import java.text.SimpleDateFormat;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.TimeUnit;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.booking.bookbed.entities.Account;
import com.booking.bookbed.entities.OrderDetail;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

@Component
public class EmailHelper {
    @Autowired
    public JavaMailSender javaMailSender;
    @Autowired
   private UploadFileHelper upLoadFileHelper;
   @Async
   public void sendMailCode(HttpSession httpSession, String request, Account account , String typeChange) throws MessagingException {
       int code  = Utils.getRandomIntegerBetweenRange(1000, 9999);
       
         httpSession.setAttribute("code", String.valueOf(code));
         String contentMail = upLoadFileHelper.readFileMail("template_confirmEmail.html");
         contentMail = contentMail.replace("${logo}", request+ "/resources/user/logos/bookbed_logo.png");
         contentMail = contentMail.replace("${homePage}", request);  
         contentMail = contentMail.replace("${username}",account.getUsername());
         String subFront = "" ;
         if(typeChange.equalsIgnoreCase("info")){
            contentMail = contentMail.replace("${typeChange}","change information");
            subFront = " BookBed - Change account information -" ;
         }else if(typeChange.equalsIgnoreCase("password")){
            contentMail = contentMail.replace("${typeChange}","change password");
            subFront = " BookBed - Change password -";
         }
        
         contentMail = contentMail.replace("${codeMail}",String.valueOf(code));
         contentMail = contentMail.replace("${contact}",request+ "/contact");
         //after 2 min remove code
        
           CompletableFuture.delayedExecutor(120, TimeUnit.SECONDS).execute(() -> {
            
              if(httpSession.getAttribute("code") != null){httpSession.removeAttribute("code");
            }            
          });
        
        String sub = subFront  + account.getUsername();
         sendMail(account.getEmail(),null,contentMail , sub);
       
       
   }
  @Async
    public void sendMail(String email,String pathFile , String content , String sub)throws MessagingException {
        MimeMessage message = javaMailSender.createMimeMessage();
        
        MimeMessageHelper helper = new MimeMessageHelper(message,true,"UTF-8");
         
        helper.setTo(email);
        helper.setSubject(sub);
        helper.setText(content, true);
        javaMailSender.send(message);
    }
    @Async
    public void sendMailBooking(OrderDetail orderDetailResult , String path , String  template , String subInput) throws MessagingException {
        String contentMail = upLoadFileHelper.readFileMail(template);
        contentMail = contentMail.replace("${logo}", path+ "/resources/user/logos/bookbed_logo.png");
        contentMail = contentMail.replace("${homePage}", path);
        contentMail = contentMail.replace("${username}",orderDetailResult.getOrders().getAccount().getUsername());
        contentMail = contentMail.replace("${nameStay}", orderDetailResult.getOrders().getAccount().getFullname());
        contentMail = contentMail.replace("${hotelName}",orderDetailResult.getRoom().getHotel().getName());
        contentMail = contentMail.replace("${statusOrder}", path + "/user/account/statusOrder" );
        contentMail = contentMail.replace("${nameStay}",orderDetailResult.getNamestaying());
        contentMail = contentMail.replace("${note}",orderDetailResult.getNote());
        String checkIn = new SimpleDateFormat("dd/MM/yyyy").format(orderDetailResult.getCheckInDate());
        String checkOut = new SimpleDateFormat("dd/MM/yyyy").format(orderDetailResult.getCheckOutDate());
        contentMail = contentMail.replace("${checkIn}",checkIn);
        contentMail = contentMail.replace("${checkOut}", checkOut);
        contentMail = contentMail.replace("${roomName}",orderDetailResult.getRoom().getName());
        contentMail = contentMail.replace("${rooms}", orderDetailResult.getQuantity().toString());
        contentMail = contentMail.replace("${roomType}",orderDetailResult.getRoom().getRoomType().getName());
        String payBackForm = "<a href='"+path+"/user/account/statusOrder?href=mail-pay'><img src='https://www.paypalobjects.com/webstatic/en_US/i/buttons/checkout-logo-small.png' ></a>";
        if (orderDetailResult.getOrders().getName().equalsIgnoreCase("payathotel")) {
            contentMail = contentMail.replace("${payStatus}","Unpaid");
            contentMail = contentMail.replace("${price}","<p>Total price : "+String.valueOf(orderDetailResult.getOrders().getTotalPrice())+"</p>" + payBackForm);
     
        }else{
            contentMail = contentMail.replace("${payStatus}","Paid");
            contentMail = contentMail.replace("${price}","<p>Total price : "+String.valueOf(orderDetailResult.getOrders().getTotalPrice())+"</p>");
     
        }
        
           contentMail = contentMail.replace("${contact}",path + "/contact");
        
        String sub = subInput + orderDetailResult.getRoom().getHotel().getName() + "-" + orderDetailResult.getOrders().getAccount().getUsername();
        sendMail(orderDetailResult.getOrders().getAccount().getEmail(),null,contentMail , sub);

    }


}