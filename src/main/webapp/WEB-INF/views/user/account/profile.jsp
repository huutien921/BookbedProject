<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="tag" uri="tags" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<script>
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#img-product').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
    //get data from form change password
    function getDataFormPass(){
      dataForm ={
        oldPassword : $('#inputPasswordOld').val(),
        newPassword : $('#inputPasswordNew').val(),
        rePassword : $('#inputPasswordRe').val()
      }
      return dataForm;
    }
  function getDataForm() {
    dataForm = {
      fullname: $('#fullName').val() ,
      birthday: $('#birthday').val() ,
      address: $('#address').val(),
      gender: $("#formAccount input[name='gender']:checked").val(),
      identityCard: $('#identityCard').val(),

    }
    return dataForm;

  }

  $(document).ready(function () {
    //new password refresh message
    $('#inputPasswordNew').on('change',function(){
      $('#newPasswordErr').html("");
      $('#inputPasswordNew').css("border","")
    })
    $('#inputPasswordOld').on('change',function(){
  
      $('#inputPasswordOld').css("border","")
    })
    $('#inputPasswordRe').on('change',function(){
      var rePass = $('#inputPasswordRe').val();
      var newPass =  $('#inputPasswordNew').val();
      $('#inputPasswordRe').css("border","")
      if (rePass == newPass) {
        $('#checkOk').css("display","");   
      }else{
        $('#checkOk').css("display","none");
      }
    })
   //submit form code pass
   $('#submitCodePassword').on('click', function () {
      $('#loadCodePassword').css("display","");
      
      $.ajax({
        dataType: "json",
        contentType: "application/json",
        type: 'GET',
        url: '${pageContext.request.contextPath}/api/account/code/password',
        data: {
          code: $('#codeEmailPassword').val()
        },
        success: function (result) {
          $('#codeModalPassword').modal('hide');
       
          $('#message2Password').css('display','');
          setTimeout(function(){
     
     $('#message2Password').css('display','none');
    }, 10000);
  },
        error: function (err) {
          if(err.responseText == "TimeOut"){
            $('#loadCode').css("display","none");
            $('#messageCode').html('<spring:message code="account.confirm.mail.timeOut" />');
          }else{
            $('#loadCodePassword').css("display","none");
            $('#messageCodePassword').html('<spring:message code="account.confirm.mail.incorrect" />');

          }
        }

      });
      
    })
    //validation form change password
    function validationForm(){
      var oldPassword = $('#inputPasswordOld').val();
        var newPassword = $('#inputPasswordNew').val();
         var rePassword = $('#inputPasswordRe').val();
        var result = 0;
         switch ('')
		{
		    case oldPassword : {
           $('#inputPasswordOld').css("border","1px solid red");
           $('#oldPasswordErr').html('<spring:message code="account.password.required" />');
           result++;
		        
		    }
		    case newPassword : {
           $('#inputPasswordNew').css("border","1px solid red");
           $('#newPasswordErr').html('<spring:message code="account.password.required" />');
           result++;
		    }
		    case rePassword : {
           $('#inputPasswordRe').css("border","1px solid red");
           $('#rePasswordErr').html('<spring:message code="account.password.required" />');
           result++;
		    }
		   
		   
    }
    if (result > 0) {
      return false;
    }
    if (!newPassword.match(/^(?=.*[\d])(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*])[\w!@#$%^&*]{8,}$/)) {
      $('#newPasswordErr').html('<spring:message code="account.newPassword.matches" />');
      return false;
    }
    if (newPassword != rePassword) {
    
      $('#inputPasswordRe').css("border","1px solid red");
      $('#rePasswordErr').html('<spring:message code="account.rePassword.matches" />')
      return false;
    }
    return true ;
  }

    //submit form  change password
    $('#btChangePassword').on('click', function () {
   if (validationForm()) {
     
   
      var dataResult = JSON.stringify(getDataFormPass());
   
      $.ajax({
        dataType: "json",
        contentType: "application/json",
        type: 'POST',
        url: '${pageContext.request.contextPath}/api/account/password',
        data: dataResult,
        success: function (result) {
         
          $('#messageCodePassword').html("");
          $('#codeModalPassword').modal('show');
        },
        error: function (jqXHR) {
        
        var errs =  JSON.parse(jqXHR.responseText);
     if(jqXHR.status == 500){
       alert('<spring:message code="error.500" />')
     }
   
         for(var i = 0 ; i < errs.length ; i++){
          
           if(errs[i].field=="oldPassword"){
             if (errs[i].code == "incorrect") {
              $('#message2PasswordErr').css('display','');
          setTimeout(function(){
     
     $('#message2PasswordErr').css('display','none');
    }, 10000);
             } 
             
           }
           if(errs[i].field=="newPassword"){
            if (errs[i].code == "matches") {
              $('#newPasswordErr').html('<spring:message code="password.matches" />');
             } 
             
           }
           if(errs[i].field=="rePassword"){
            if (errs[i].code == "incorrect") {
              $('#rePasswordErr').html('<spring:message code="password.re.incorrect" />');
             } 
             
           }
          
         
         }
        }

      });

    }})
   // reset message Err
   $('#fullName').on('change',function(){
    $('#fullnameErr').html('');
   })
   $('#birthday').on('change',function(){
    $('#birthdayErr').html('');
    })
    $('#address').on('change',function(){
      $('#addressErr').html('');
    })
    $('#identityCard').on('change',function(){
      $('#identityCardErr').html('');
    })
    //submit form
    $('#btAccount').on('click', function () {
      
      var dataResult = JSON.stringify(getDataForm());
   
      $.ajax({
        dataType: "json",
        contentType: "application/json",
        type: 'POST',
        url: '${pageContext.request.contextPath}/api/account/profile',
        data: dataResult,
        success: function (result) {
         
          $('#messageCode').html("");
          $('#codeModal').modal('show');
        
        },
        error: function (jqXHR) {
        var errs =  JSON.parse(jqXHR.responseText);
     if(jqXHR.status == 500){
      alert('<spring:message code="error.500" />')
     }
     if(jqXHR.status == 502){
       var days = 29 - jqXHR.responseText;
       alert('<spring:message code="error.change.info.day" />'+days +'day');
     }
   
         for(var i = 0 ; i < errs.length ; i++){
          
           if(errs[i].field=="fullname"){
             if (errs[i].code == "required") {
              $('#fullnameErr').html('<spring:message code="account.fullname.required" />');
             } else if (errs[i].code =="length") {
              $('#fullnameErr').html('<spring:message code="account.fullname.length" />');
             }
             
           }
           if(errs[i].field=="birthday"){
            if (errs[i].code == "required") {
              $('#birthdayErr').html('<spring:message code="account.birthday.required" />');
             } else if (errs[i].code =="matches") {
              $('#birthdayErr').html('<spring:message code="account.birthday.matches" />');
             }
             
           }
           if(errs[i].field=="address"){
            if (errs[i].code == "required") {
              $('#addressErr').html('<spring:message code="account.address.required" />');
             } else if (errs[i].code =="length") {
              $('#addressErr').html('<spring:message code="account.address.length" />');
             }
             
           }
           if(errs[i].field=="identityCard"){
            if (errs[i].code == "required") {
              $('#identityCardErr').html('<spring:message code="account.identityCard.required" />');
             } else if (errs[i].code =="length") {
              $('#identityCardErr').html('<spring:message code="account.identityCard.length" />');
             }
             
           }
         
         }
        }

      });

    })
    //submit form code
    $('#submitCode').on('click', function () {
      $('#loadCode').css("display","");
      
      $.ajax({
        dataType: "json",
        contentType: "application/json",
        type: 'GET',
        url: '${pageContext.request.contextPath}/api/account/code',
        data: {
          code: $('#codeEmail').val()
        },
        success: function (result) {
          $('#codeModal').modal('hide');
          $('.pl-3 .name').html(result.fullname);
          $('#message2').css('display','');
          setTimeout(function(){
     
     $('#message2').css('display','none');
    }, 10000);
  },
        error: function (err) {
          if(err.responseText == "TimeOut"){
            $('#loadCode').css("display","none");
            $('#messageCode').html('<spring:message code="account.confirm.mail.timeOut" />');
          }else{
            $('#loadCode').css("display","none");
            $('#messageCode').html('<spring:message code="account.confirm.mail.incorrect" />');

          }
        }

      });
      
    })

    //date input bootstrap
    $('#birthday').datepicker({
      format: 'dd-mm-yyyy',
      endDate: new Date()
    });
   
    // image refresh
    $('#avatarInput').on('change', function () {
      var file = this.files[0];
     
      var fileType = file["type"];
      var validImageTypes = ["image/gif", "image/jpeg", "image/png"];
      if ($.inArray(fileType, validImageTypes) < 0) {
        alert('<spring:message code="error.image.type" />')
        $(this).val('');
      } else {
        readURL(this);
      
      }
    })
    //submit form avatar 
    $('#btChangeAvatar').on('click',function(){
    if ($('#avatarInput').val() == "") {
      alert('<spring:message code="error.image.required" />')
      return false;
    }
      var formData = new FormData();
      formData.append("file" , $('#avatarInput')[0].files[0]);
      $.ajax({
        dataType : 'text',
        type: "POST",
        url: '${pageContext.request.contextPath}/api/account/upload/avatar',
        data : formData,
        contentType: false, 
        processData: false,
        success: function (result) {
          var a = "url('/uploads/images/user/"+result+"')";
          $('#user-img2').css("background-image", a);
          $('#messageImage').css('display','');
          setTimeout(function(){
     
     $('#messageImage').css('display','none');
    }, 10000);
          img = new Image();
    var idLoad = "#loadImage";
    var idAvatar ="#user-img2";
    var bg = $(idAvatar).css('background-image');
    img.src = bg.replace('url(','').replace(')','').replace(/\"/gi, "");
    
      if (!img.complete) {
        $(idLoad).css('display','');
        $(idAvatar).css('display','none');
        
        var intervalLoad = setInterval(function(){
       var    url =img.src + "?timestamp=" + new Date().getTime();
          
          var a = "url('"+url+"')";
          $(idAvatar).css("background-image", a);
       
        if(img.complete){
        
          $(idLoad).css('display','none');
        $(idAvatar).css('display','');
				clearInterval(intervalLoad);
				}
     
        },5000);
      }else{
        $(idLoad).css('display','none');
      }
  },
        error: function (err) {
       alert('<spring:message code="error.image.failed" />')
        }

      });
    })

    //refresh image avatar

    
  })
function loadImage(result){


}
</script>

<!-- Modal -->
<div class="modal fade" id="codeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"><spring:message code="account.confirm.mail" /></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label"><spring:message code="account.confirm.mail.message" /></label>
            <i class="fa fa-spinner fa-spin fa-2x fa-fw" style="display: none;" id="loadCode"></i>
            <span id="messageCode" style="color: red;"></span>
            <input type="text" class="form-control" id="codeEmail">
          </div>

        </form>
      </div>
      <div class="modal-footer">
     
        <button type="button" class="btn btn-primary" id="submitCode"><spring:message code="button.confirm" /></button>
      </div>
    </div>
  </div>
</div>
<!-- modal end information -->
<!-- modal start change password -->
<div class="modal fade" id="codeModalPassword" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"><spring:message code="account.confirm.mail" /></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label"><spring:message code="account.confirm.mail.message" /></label>
            <i class="fa fa-spinner fa-spin fa-2x fa-fw" style="display: none;" id="loadCodePassword"></i>
            <span id="messageCodePassword" style="color: red;"></span>
            <input type="text" class="form-control" id="codeEmailPassword">
          </div>

        </form>
      </div>
      <div class="modal-footer">
     
        <button type="button" class="btn btn-primary" id="submitCodePassword"><spring:message code="button.confirm" /></button>
      </div>
    </div>
  </div>
</div>
<!-- modal end password -->


<section class="ftco-section ftco-no-pt ftco-no-pb">
  <div class="container">
    <div class="row">
      <tag:account />
      <div class="col-lg-8 order-md-last ftco-animate   fadeInUp ftco-animated">
        <ul class="nav nav-tabs" >
          <li class="nav-item">
            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#information" role="tab" aria-controls="home" aria-selected="true"><spring:message code="account.info" /></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#avatar" role="tab" aria-controls="contact" aria-selected="false"><spring:message code="account.avatar" /></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#password" role="tab" aria-controls="contact" aria-selected="false"><spring:message code="account.change.password" /></a>
          </li>
        </ul>
        <div class="tab-content" id="myTabContent">
          <div class="tab-pane fade show active" id="information" role="tabpanel" aria-labelledby="home-tab">
            <form id="formAccount" >
              <div id="message2" style="display: none;">
                <div class="alert alert-success alert-dismissible">
                  <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">&times;</button>
                 
                    <i class="icon fa fa-check"></i><spring:message code="message.success" />
      
                </div>
              </div>
      
             
              <div class="form-group">
                <label for="fullName"><spring:message code="account.fullname" /></label>
                <input type="text" class="form-control" value="${account.fullname}" id="fullName">
                <span style="color: red;" id="fullnameErr"></span>
               
              </div>
              <div class="form-group">
                <label for="birthday"><spring:message code="account.birthday" /></label>
                <input type="text" class="form-control" value="<fmt:formatDate pattern = 'dd-MM-yyyy' 
                value = '${account.birthday}' />" id="birthday">
                <span style="color: red;" id="birthdayErr"></span>
             
              </div>
             
              <div class="form-group">
                <label for="address"><spring:message code="account.address" /></label>
                <input type="text" class="form-control" value="${account.address}" id="address">
                <span style="color: red;" id="addressErr"></span>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="gender" id="male" ${account.gender=='Male'
                  ?'checked="checked"':'' } value="male">
                <label class="form-check-label" for="male"><spring:message code="account.gender.male" /> </label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="gender" checked="${account.gender}" ${account.gender == '
                  Female'?'checked="checked"':'' } id="female" value="male">
                <label class="form-check-label" for="female"><spring:message code="account.gender.female" /></label>
              </div>
              <div class="form-group" style="padding-top: 1em;">
                <label for="identityCard"><spring:message code="account.peopleID" /></label>
                <input type="text" value="${account.identitycard}" class="form-control" id="identityCard">
                <span style="color: red;" id="identityCardErr"></span>
              </div>
             
              <button type="button" id="btAccount" class="btn btn-primary"><spring:message code="button.update" /></button>
    
            </form>
          </div>
          <div class="tab-pane fade" id="avatar" role="tabpanel" aria-labelledby="contact-tab">


            <form action="fileUpload" method="post" enctype="multipart/form-data">
              <div id="messageImage" style="display: none;">
                <div class="alert alert-success alert-dismissible">
                  <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">&times;</button>
                 
                    <i class="icon fa fa-check"></i><spring:message code="message.success" />
      
                </div>
              </div>
              <div class="form-group">
               
                <br> <img style="width: 160px; height: auto; padding-bottom: 1em;"
                  src="${pageContext.request.contextPath}/uploads/images/user/${account.avatar}" id="img-product">
                <i class="fa fa-spinner fa-spin fa-2x fa-fw" style="display: none;" id="load"></i>
                <input type="file" class="form-control-file" id="avatarInput" name="file">
              </div>
              <button type="button" id="btChangeAvatar" class="btn btn-primary"><spring:message code="button.modal.save" /></button>
            </form>
          </div>
          <div class="tab-pane fade" id="password" role="tabpanel" aria-labelledby="contact-tab">

            <form>
              <div id="message2Password" style="display: none;">
                <div class="alert alert-success alert-dismissible">
                  <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">&times;</button>
                 
                    <i class="icon fa fa-check"></i><spring:message code="message.success" />
                </div>
              </div>
              <div id="message2PasswordErr" style="display: none; padding-top: 1em;">
                <div class="alert alert-warning alert-dismissible">
                  <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">&times;</button>
                 
                    <i class="icon fa fa-exclamation-triangle"></i><spring:message code="password.incorrect" />
      
                </div>
              </div>
           
              <label for="inputPasswordOld"><spring:message code="account.oldPassword" /></label>
              <input type="password" id="inputPasswordOld" class="form-control" aria-describedby="passwordHelpBlock">
              <span style="color: red;" id="oldPasswordErr"></span>
              <br>
              <label for="inputPasswordNew"><spring:message code="account.newPassword" /></label>
              <input type="password" id="inputPasswordNew" class="form-control" aria-describedby="passwordHelpBlock">
              <span style="color: red;" id="newPasswordErr"></span>
              <br>
              <label for="inputPasswordRe"><spring:message code="account.rePassword" /></label> <i class="fa fa-check" id="checkOk" style="display: none;" aria-hidden="true"></i>
              <input type="password" id="inputPasswordRe" class="form-control" aria-describedby="passwordHelpBlock">
              <span style="color: red;" id="rePasswordErr"></span>
         
              <div class="form-group row" style="padding-top: 2em;">
                <div class="col-sm-10">
                  <button type="button" id="btChangePassword" class="btn btn-primary"><spring:message code="button.update" /></button>
                </div>
              </div>
            </form>
          </div>
        </div>
       
      </div> <!-- .col-md-8 -->

    </div>
  </div>
</section>