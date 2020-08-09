<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="tag" uri="tags" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<script>
  $(document).ready(function () {
    //only alow input number type
    $('#cardNumber').bind('keypress', function (e) {
      var keyCode = (e.which) ? e.which : event.keyCode
      return !(keyCode > 31 && (keyCode < 48 || keyCode > 57));
    });
    //yearExpires 
    var currenYear = new Date().getFullYear();
    var s = '';
    for (var i = currenYear; i < currenYear + 50; i++) {
      s += "<option value='" + i + "'> " + i + "</option>";
    }
    $('#yearExpires').append(s);
    // refresh form
    $('#nameOnCard').on('change', function () {
      $('#nameOnCard').css("border", "")
      $('#loadCreditCard').css("display", "none");
    })
    $('#cardNumber').on('change', function () {
      $('#cardNumber').css("border", "")
      $('#cardNumberErr').html("")
      $('#loadCreditCard').css("display", "none");
    })
    $('#monthExpires , #yearExpires').on('change', function () {
      $('#cardExpiresErr').html("")
      $('#loadCreditCard').css("display", "none");
    })

    //submit form
    $("#btSaveCard").on("click", function () {
      $('#loadCreditCard').css("display", "");
      if (validationForm()) {


        $.ajax({
          dataType: "json",
          contentType: "application/json",
          type: 'POST',
          url: '${pageContext.request.contextPath}/api/account/credit/save',
          data: JSON.stringify(getDataForm()),
          success: function (result) {
            $('#loadCreditCard').css("display", "none");
            $('#exampleModal').modal('hide');
            $('#messageSuccessCredit').css('display', '');
            setTimeout(function () {

              $('#messageSuccessCredit').css('display', 'none');
              location.reload()
            }, 3000);

          },
          error: function (err) {
            $('#loadCreditCard').css("display", "none");
            $('#exampleModal').modal('hide');
            $('#messageErrorCredit').css('display', '');
            setTimeout(function () {

              $('#messageErrorCredit').css('display', 'none');
            }, 10000);
          }

        });

      }

    })
    //reset ExampleModal
    $("#btExampleModal").on("click", function () {
      $("#typeCard").val("1");
      $("#nameOnCard").val("");
      $("#cardNumber").val("");
      $("#monthExpires").val("01");
      $("#yearExpires").val(currenYear);
      $("#idCredit").val("");
    })
    //edit credit card
    $(".edit").on("click", function () {
      var $row = $(this).closest('tr');
      var $columns = $row.find('td');
      var idType = $columns.eq(0).find('input.type').val();
      var idCredit = $columns.eq(0).find('input.id').val();
      var nameOnCard = $columns.eq(1).find('input').val();
      var expireOn = $columns.eq(2).find('input').val();
      var cardNumber = $columns.eq(3).find('input').val();
      var expireOns = expireOn.split("/");
      $("#typeCard").val(idType);
      $("#nameOnCard").val(nameOnCard);
      $("#cardNumber").val(cardNumber);
      $("#monthExpires").val(expireOns[0]);
      $("#yearExpires").val(expireOns[1]);
      $("#idCredit").val(idCredit);

      $('#exampleModal').modal('show');

    })
  })
  //validation form 
  function validationForm() {
    var idType = $("#typeCard").val();
    var nameOnCard = $("#nameOnCard").val();
    var cardNumber = $("#cardNumber").val();
    var expireOn = $("#monthExpires").val() + "/" + $("#yearExpires").val();
    switch ('') {
      case nameOnCard: {
        $('#nameOnCard').css("border", "1px solid red");
        return false;
      }
      case cardNumber: {
        $('#cardNumber').css("border", "1px solid red");
        return false;
      }
      case expireOn: {
        $('#expireOn').css("border", "1px solid red");
        return false;
      }


    }
    if (cardNumber.length < 13 || cardNumber.length > 17) {
      $('#cardNumberErr').html('<spring:message code="account.surplus.error.cardNumber" />');
      $('#cardNumber').css("border", "1px solid red");
      return false;
    }
    if (!expireOn.match(/^(0[1-9]|10|11|12)[\/]20[0-9]{2}$/)) {
      $('#cardExpiresErr').html('<spring:message code="account.surplus.error.expired" />');
      return false;
    }
    return true
  }
  //get value form
  function getDataForm() {
    creditCardView = {
      idCredit: $("#idCredit").val() == "" ? null : $("#idCredit").val(),
      idType: $("#typeCard").val(),
      nameOnCard: $("#nameOnCard").val(),
      cardNumber: $("#cardNumber").val(),
      expireOn: $("#monthExpires").val() + "/" + $("#yearExpires").val(),
    }
    return creditCardView;
  }

</script>
<!-- modal -->

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">
          <spring:message code="account.surplus.addCreditCard" />
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <form>
          <input type="hidden" id="idCredit">
          <div class="form-group ">
            <label for="typeCard">
              <spring:message code="account.surplus.typeCreditCard" /></label>
            <select class="form-control" id="typeCard">

              <c:forEach var="cardType" items="${typeCards}">
                <option value="${cardType.id}">${cardType.name}</option>

              </c:forEach>
            </select>
          </div>
          <div class="form-group">
            <label for="nameOnCard" class="col-form-label">
              <spring:message code="account.surplus.nameOnCard" /></label>
            <input type="text" class="form-control" id="nameOnCard">
          </div>
          <div class="form-group">
            <label for="cardNumber" class="col-form-label">
              <spring:message code="account.surplus.cardNumber" /></label>
            <p style="color: red;" id="cardNumberErr"></p>
            <input type="text" class="form-control" id="cardNumber">
          </div>
          <p>
            <spring:message code="account.surplus.expired" />
          </p>
          <p style="color: red;" id="cardExpiresErr"></p>
          <div class="form-row">

            <div class="col">
              <select class="form-control" id="monthExpires">
                <option value="01">1</option>
                <option value="02">2</option>
                <option value="03">3</option>
                <option value="04">4</option>
                <option value="05">5</option>
                <option value="06">6</option>
                <option value="07">7</option>
                <option value="08">8</option>
                <option value="09">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
              </select>
            </div>
            <div class="col">
              <select class="form-control" id="yearExpires">

              </select>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">
          <spring:message code="button.modal.close" /></button>
        <button type="button" class="btn btn-primary" id="btSaveCard">
          <i class="fa fa-spinner fa-spin fa-1x fa-fw" style="display: none;" id="loadCreditCard"></i>
          <spring:message code="button.modal.save" />
        </button>
      </div>
    </div>
  </div>
</div>
<!-- end modal -->
<section class="ftco-section ftco-no-pt ftco-no-pb">
  <div class="container">
    <div class="row">
      <tag:account />
      <div class="col-lg-8 order-md-last ftco-animate   fadeInUp ftco-animated bg-light  py-md-5 ">
        <div id="messageSuccessCredit" style="display: none;">
          <div class="alert alert-success alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>

            <i class="icon fa fa-check"></i><spring:message code="message.success" />
          </div>
        </div>
        <div id="messageErrorCredit" style="display: none; padding-top: 1em;">
          <div class="alert alert-warning alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>

            <i class="icon fa fa-exclamation-triangle"></i><spring:message code="message.error" />

          </div>
        </div>
        <div class="sidebar-box ftco-animate fadeInUp ftco-animated ">
          <p style="color: black; font-size: large;"><i class="fas fa-money-check-alt"></i> <spring:message code="account.surplus.surplus" /> : <span
              style="color: blue;font-weight: bold;"> $ ${account.point}</span> </p>
        </div>
        <div class="sidebar-box ftco-animate fadeInUp ftco-animated ">
          <table class="table">
            <thead class="thead-light">
              <tr>
                <th scope="col"><spring:message code="account.surplus.credit" /></th>
                <th scope="col"><spring:message code="account.surplus.nameOnCard" /></th>
                <th scope="col"><spring:message code="account.surplus.expired" /></th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>

              <c:forEach var="card" items="${account.creditCards}">
                <tr>
                  <td>${card.typeCard.name}
                    <input type="hidden" class="type" value="${card.typeCard.id}">
                    <input type="hidden" class="id" value="${card.id}">
                  </td>
                  <td>${card.nameCard}
                    <input type="hidden" value="${card.nameCard}">

                  </td>

                  <td>${card.expiresOn}
                    <input type="hidden" value="${card.expiresOn}">
                  </td>
                  <td>
                    <input type="hidden" value="${card.cardNumber}">
                    <a href="#" class="edit"><spring:message code="link.update" /></a> |
                    <a href="#" class="delete"><spring:message code="link.delete" /></a>
                  </td>
                </tr>
              </c:forEach>



            </tbody>
          </table>
          <button type="button" id="btExampleModal" class="btn btn-primary" data-toggle="modal"
            data-target="#exampleModal"><spring:message code="account.surplus.addCreditCard" /></button>
        </div>

      </div> <!-- .col-md-8 -->

    </div>
  </div>
</section>