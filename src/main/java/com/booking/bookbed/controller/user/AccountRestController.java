package com.booking.bookbed.controller.user;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.booking.bookbed.services.TypeCardService;
import com.booking.bookbed.entities.Account;
import com.booking.bookbed.modelviews.AccountView;
import com.booking.bookbed.entities.CreditCard;
import com.booking.bookbed.modelviews.CreditCardView;
import com.booking.bookbed.modelviews.PasswordView;
import com.booking.bookbed.helper.EmailHelper;
import com.booking.bookbed.helper.UploadFileHelper;
import com.booking.bookbed.helper.Utils;
import com.booking.bookbed.services.AccountService;
import com.booking.bookbed.services.CreditCardService;
import com.booking.bookbed.validations.AccountViewValidator;
import com.booking.bookbed.validations.CreditCardViewValidator;
import com.booking.bookbed.validations.PasswordViewValidator;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.util.MimeTypeUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("api/account")
public class AccountRestController {

    @Autowired
    private AccountViewValidator accountViewValidator;
    @Autowired
    private PasswordViewValidator passwordViewValidator ;
	@Autowired
	private TypeCardService typeCardService;
    @Autowired
    private EmailHelper emailHelper;
    @Autowired
    private AccountService accountService;
    @Autowired
    private UploadFileHelper uploadFileHelper ;
    @Autowired
    private CreditCardService creditCardService;
     @Autowired
    private CreditCardViewValidator creditCardViewValidator ;
    

    @RequestMapping(value = "profile", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> editProfile(Authentication authentication ,HttpServletRequest request, @RequestBody @Valid AccountView accountView,
            BindingResult bindingResult, HttpSession httpSession) {

        try {
            if (httpSession.getAttribute("code") != null) {
                return new ResponseEntity<>(accountView, HttpStatus.OK);

            }
            accountViewValidator.validate(accountView, bindingResult);
            if (bindingResult.hasErrors()) {
                return new ResponseEntity<>(bindingResult.getAllErrors(), HttpStatus.BAD_REQUEST);
            }
            Account account = accountService.findByUsername(authentication.getName());
            if (account.getUpdated() != null) {
                Date now = new Date();
                long getDiff = now.getTime() - account.getUpdated().getTime();
                long getDayDiff = TimeUnit.MILLISECONDS.toDays(getDiff);
                if (getDayDiff < 30) {
                    return new ResponseEntity<>(getDayDiff, HttpStatus.BAD_GATEWAY);
                }
            }

            httpSession.setAttribute("accountInfo", accountView);
            String typeChange = "info";
            emailHelper.sendMailCode(httpSession, Utils.getBaseURL(request), account, typeChange);
            return new ResponseEntity<>(accountView, HttpStatus.OK);

        } catch (Exception e) {
            return new ResponseEntity<>(accountView, HttpStatus.BAD_REQUEST);
        }

    }

    @RequestMapping(value = "code", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> checkCode(Authentication authentication ,@RequestParam("code") String code, HttpSession httpSession) {
        try {
            if (httpSession.getAttribute("code") == null) {
                return new ResponseEntity<>("TimeOut", HttpStatus.BAD_REQUEST);
            } else {
                String code1 = (String) httpSession.getAttribute("code");
                System.out.println(code1);
                System.out.println(code);
                if (code1.trim() == code.trim() || code1.equals(code.trim())) {
                    if (httpSession.getAttribute("accountInfo") != null) {
                        AccountView accountView = (AccountView) httpSession.getAttribute("accountInfo");
                        Account account = accountService.findByUsername(authentication.getName());
                        account.setFullname(accountView.getFullname());
                        Date birthday = new SimpleDateFormat("dd-mm-yyyy").parse(accountView.getBirthday());
                        account.setBirthday(birthday);
                        account.setAddress(accountView.getAddress());
                        account.setGender(accountView.getGender());
                        account.setIdentitycard(accountView.getIdentityCard());
                        account.setUpdated(new Date());
                        accountService.save(account);
                        httpSession.removeAttribute("accountInfo");
                        httpSession.removeAttribute("code");
                        return new ResponseEntity<>(accountView, HttpStatus.OK);
                    } else {
                        return new ResponseEntity<>("NonSession", HttpStatus.BAD_REQUEST);
                    }

                } else {
                    return new ResponseEntity<>("Unequal", HttpStatus.BAD_REQUEST);
                }
            }
        } catch (Exception e) {
            return new ResponseEntity<>("Error", HttpStatus.BAD_REQUEST);
        }

    }
    @RequestMapping(value = "password", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> editPassword(Authentication authentication ,HttpServletRequest request, @RequestBody @Valid PasswordView passwordView,
            BindingResult bindingResult, HttpSession httpSession) {

        try {
            if (httpSession.getAttribute("code") != null) {
                return new ResponseEntity<>(passwordView, HttpStatus.OK);

            }
            passwordViewValidator.validate(passwordView, bindingResult);
            if (bindingResult.hasErrors()) {
                return new ResponseEntity<>(bindingResult.getAllErrors(), HttpStatus.BAD_REQUEST);
            }
            Account account = accountService.findByUsername(authentication.getName());
        

            httpSession.setAttribute("passwordView", passwordView);
            String typeChange = "password";
            emailHelper.sendMailCode(httpSession, Utils.getBaseURL(request), account, typeChange);
            return new ResponseEntity<>(passwordView, HttpStatus.OK);

        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

    }

    @RequestMapping(value = "code/password", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> checkCodePassword(Authentication authentication ,@RequestParam("code") String code, HttpSession httpSession) {
        try {
            if (httpSession.getAttribute("code") == null) {
                return new ResponseEntity<>("TimeOut", HttpStatus.BAD_REQUEST);
            } else {
                String code1 = (String) httpSession.getAttribute("code");
             
                if (code1.trim() == code.trim() || code1.equals(code.trim())) {
                    if (httpSession.getAttribute("passwordView") != null) {
                        PasswordView passwordView = (PasswordView) httpSession.getAttribute("passwordView");
                        Account account = accountService.findByUsername(authentication.getName());
                      account.setPassword(new BCrypt().hashpw(passwordView.getNewPassword(), BCrypt.gensalt()));
                        accountService.save(account);
                        httpSession.removeAttribute("passwordView");
                        httpSession.removeAttribute("code");
                        return new ResponseEntity<>(passwordView, HttpStatus.OK);
                    } else {
                        return new ResponseEntity<>("NonSession", HttpStatus.BAD_REQUEST);
                    }

                } else {
                    return new ResponseEntity<>("Unequal", HttpStatus.BAD_REQUEST);
                }
            }
        } catch (Exception e) {
            return new ResponseEntity<>("Error", HttpStatus.BAD_REQUEST);
        }

    }
       //change avatar
	   @RequestMapping(value = "/upload/avatar", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)

	   public ResponseEntity<Object> fileUpload(Authentication authentication ,@RequestParam("file") MultipartFile file) throws IOException {
        //   String[] typeImages = new String[]{"image/gif", "image/jpeg", "image/png"};
        try {
            List<String>  typeImages = new ArrayList<>();
            typeImages.add("image/gif");
             typeImages.add("image/jpeg");
             typeImages.add("image/png");
           
            if (!typeImages.contains(file.getContentType())) {
                return new ResponseEntity<>(file.getOriginalFilename(),HttpStatus.BAD_REQUEST);
            }else{
                String fileResult = uploadFileHelper.saveFile(file,"user");
                Account account = accountService.findByUsername(authentication.getName());
                account.setAvatar(fileResult);
             accountService.save(account);
               
                if (fileResult != null) {
                    return new ResponseEntity<>(fileResult,HttpStatus.OK);
                }else{
                    return new ResponseEntity<>(file.getOriginalFilename(),HttpStatus.BAD_REQUEST);
                }
            }
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
         
        } 

       }
       @RequestMapping(value = "credit/save", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
       public ResponseEntity<Object> creditSave(Authentication authentication ,@RequestBody @Valid CreditCardView creditCardView ,BindingResult bindingResult){
        try {
            creditCardViewValidator.validate(creditCardView, bindingResult);
            if (bindingResult.hasErrors()) {
                return new  ResponseEntity<>(bindingResult.getAllErrors(),HttpStatus.BAD_REQUEST);
            }
            CreditCard creditCard = new CreditCard();
            if (creditCardView.getIdCredit() != null) {
                creditCard.setId(Integer.parseInt(creditCardView.getIdCredit()));
            }
            creditCard.setAccount(accountService.findByUsername(authentication.getName()));
            creditCard.setNameCard(creditCardView.getNameOnCard());
            creditCard.setCardNumber(creditCardView.getCardNumber());
            creditCard.setExpiresOn(creditCardView.getExpireOn());
            creditCard.setTypeCard(typeCardService.findById(Integer.parseInt(creditCardView.getIdType())));
            creditCard.setStatus(true);
            creditCard.setDefault_(true);
            creditCardService.save(creditCard);
        return new  ResponseEntity<>(creditCardView,HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
        }
       }
       
}