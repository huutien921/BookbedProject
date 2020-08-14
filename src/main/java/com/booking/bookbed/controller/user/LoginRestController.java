package com.booking.bookbed.controller.user;

import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.booking.bookbed.entities.Account;
import com.booking.bookbed.entities.Role;
import com.booking.bookbed.entities.RoleAccount;
import com.booking.bookbed.entities.VerificationToken;
import com.booking.bookbed.helper.EmailHelper;
import com.booking.bookbed.helper.Utils;
import com.booking.bookbed.modelviews.AccountRegister;
import com.booking.bookbed.modelviews.PasswordRecovery;
import com.booking.bookbed.services.AccountService;
import com.booking.bookbed.services.RoleAccountService;
import com.booking.bookbed.services.VerificationTokenService;
import com.booking.bookbed.validations.AccountRegisterValidator;
import com.booking.bookbed.validations.PasswordRecoveryValidator;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.util.MimeTypeUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/login")
public class LoginRestController {
    @Autowired
    private AccountService accountService;
    @Autowired
    private RoleAccountService roleAccountService;
    @Autowired
    private AccountRegisterValidator accountRegisterValidator;
    @Autowired
    private VerificationTokenService verificationTokenService;
    @Autowired
    private EmailHelper emailHelper;
    @Autowired
    private PasswordRecoveryValidator passwordRecoveryValidator;
    private String regexEmail = "^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";
    private String regexUsername = "^[a-zA-Z0-9._-]{3,32}$";

    @RequestMapping(value = "check/email", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> checkEmail(@RequestParam("email") String email, HttpSession httpSession) {
        try {
            if (!email.matches(regexEmail)) {
                return new ResponseEntity<>("matches", HttpStatus.BAD_REQUEST);
            }
            httpSession.removeAttribute("email");

            if (accountService.findByEmail(email) == null) {
                httpSession.setAttribute("email", email);
                return new ResponseEntity<>("Ok", HttpStatus.OK);
            } else {
                return new ResponseEntity<>("exist", HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return new ResponseEntity<>("Error", HttpStatus.BAD_REQUEST);
        }

    }

    @RequestMapping(value = "check/username", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> checkUsername(@RequestParam("username") String username, HttpSession httpSession) {
        try {
            if (!username.matches(regexUsername)) {
                return new ResponseEntity<>("matches", HttpStatus.BAD_REQUEST);
            }

            if (accountService.findByUsername(username) == null) {
                return new ResponseEntity<>("Ok", HttpStatus.OK);
            } else {
                return new ResponseEntity<>("exist", HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            return new ResponseEntity<>("Error", HttpStatus.BAD_REQUEST);
        }

    }

    // save account new
    @RequestMapping(value = "register", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> register(HttpServletRequest request,
            @RequestBody @Valid AccountRegister accountRegister, BindingResult bindingResult, HttpSession httpSession) {

        try {
            if (httpSession.getAttribute("email") == null) {
                throw new Exception("error_line_82");

            }
            String email = (String) httpSession.getAttribute("email");
            accountRegister.setEmail(email);
            accountRegisterValidator.validate(accountRegister, bindingResult);
            if (bindingResult.hasErrors()) {
                return new ResponseEntity<>(bindingResult.getAllErrors(), HttpStatus.BAD_REQUEST);
            }
            Account account = new Account();
            account.setUsername(accountRegister.getUsername());
            account.setPassword(BCrypt.hashpw(accountRegister.getPassword(), BCrypt.gensalt()));
            account.setEmail(accountRegister.getEmail());
            account.setCreated(new Date());
            account.setAvatar("default.png");
            account.setPoint((double) 0);
            Account accountResult = accountService.save(account);
            if (accountResult != null) {
                RoleAccount roleAccount = new RoleAccount(accountResult, new Role(4), true);
                roleAccountService.save(roleAccount);
                accountRegister.setPassword("");
                accountRegister.setRePassword("");
                VerificationToken verificationToken = new VerificationToken();
                String tokenString = UUID.randomUUID().toString();
                verificationToken.setAccount(accountResult);
                verificationToken.setToken(tokenString);
                Calendar cal = Calendar.getInstance();
                cal.set(Calendar.HOUR_OF_DAY, 24);
                Date expireDate = cal.getTime();
                verificationToken.setExpiryDate(expireDate);
                VerificationToken tokenResult = verificationTokenService.save(verificationToken);
                emailHelper.sendMailToken(tokenString, Utils.getBaseURL(request), "template_confirmToken.html",
                        tokenResult.getAccount().getEmail());
                return new ResponseEntity<>(accountRegister, HttpStatus.OK);
            } else {
                throw new Exception("error_line_104");
            }
        } catch (Exception e) {
            return new ResponseEntity<>(e, HttpStatus.BAD_REQUEST);
        }
    }
    @RequestMapping(value = "check/email/recovery", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> checkEmailRecovery(HttpServletRequest request, @RequestParam("email") String email) {
        try {
            if (!email.matches(regexEmail)) {
                return new ResponseEntity<>("matches", HttpStatus.BAD_REQUEST);
            }
            Account account = accountService.findByEmail(email);
            if (account != null) {
                VerificationToken verificationToken = new VerificationToken();
                String tokenString = UUID.randomUUID().toString();
                verificationToken.setAccount(account);
                verificationToken.setToken(tokenString);
                Calendar cal = Calendar.getInstance();
                cal.set(Calendar.HOUR_OF_DAY, 24);
                Date expireDate = cal.getTime();
                verificationToken.setExpiryDate(expireDate);
                VerificationToken tokenResult = verificationTokenService.save(verificationToken);
                emailHelper.sendMailRecovery(tokenString, Utils.getBaseURL(request), "template_confirmRecovery.html",
                        tokenResult.getAccount().getEmail());
                return new ResponseEntity<>(email, HttpStatus.OK);
            } else {
                return new ResponseEntity<>("not_found", HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            return new ResponseEntity<>("Error", HttpStatus.BAD_REQUEST);
        }

    }
    // save account new
    @RequestMapping(value = "recovery", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> recovery(HttpServletRequest request,
            @RequestBody @Valid PasswordRecovery passwordRecovery, BindingResult bindingResult,
            HttpSession httpSession) {
        try {
            passwordRecoveryValidator.validate(passwordRecovery, bindingResult);
            if (bindingResult.hasErrors()) {
                return new ResponseEntity<>(bindingResult.getAllErrors(), HttpStatus.BAD_REQUEST);
            }
            VerificationToken tokenConfirm = verificationTokenService.findByToken(passwordRecovery.getToken());
            if (tokenConfirm == null) {
                return new ResponseEntity<>(passwordRecovery, HttpStatus.BAD_REQUEST);
            }
            Date dateNow = new Date();
            if ((tokenConfirm.getExpiryDate().getTime() - dateNow.getTime()) <= 0) {
                return new ResponseEntity<>(passwordRecovery, HttpStatus.BAD_REQUEST);
            }
            Account accountResult = tokenConfirm.getAccount();
            accountResult.setPassword(new BCryptPasswordEncoder().encode(passwordRecovery.getNewPassword()));
            accountService.save(accountResult);
            tokenConfirm.setStatus(true);
            verificationTokenService.save(tokenConfirm);
            return new ResponseEntity<>(passwordRecovery, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(passwordRecovery, HttpStatus.BAD_REQUEST);
        }

    }

}
