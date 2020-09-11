<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
$(document).ready(()=>{
  setTimeout(()=>{
    $('.alert').hide();
  },6000)

})

</script>
  <!-- Page level plugins -->
 <div class="container-fluid">
<!-- message toast -->
<c:if test="${ms == 'ok' }">
  
  <div class="alert alert-success alert-dismissible">
               <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
               <h4><i class="icon fa fa-check"></i> Successfully updated!</h4>
             Updated information has been saved.
             </div>
 </c:if>
 <c:if test="${ms == 'unactive'}">
    <div class="alert alert-warning alert-dismissible">
               <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
               <h4><i class="icon fa fa-warning"></i> Successfully updated !</h4>
              You have updated some important information. 
              Therefore, your hotel needs our confirmation.
               Confirmation results will be notified via email : ${email } 
             </div>
 
 </c:if>
 <c:if test="${ms == 'okp' }">
 
  <div class="alert alert-success alert-dismissible">
               <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
               <h4><i class="icon fa fa-check"></i> Successfully payment!</h4>
             Updated information has been saved.
             </div>
 </c:if>
 <c:if test="${ms == 'failedp'}">
    <div class="alert alert-warning alert-dismissible">
               <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
               <h4><i class="icon fa fa-warning"></i> Successfully updated !</h4>
              You have updated some important information. 
              Therefore, your hotel needs our confirmation.
               Confirmation results will be notified via email : ${email } 
             </div>
 
 </c:if>
<!-- / end message toast -->
        <div class="card shadow mb-4">
          <div class="card-header py-3">
            <h2 class="m-0 font-weight-bold text-primary">List Hotel</h2>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center;">
                <thead>
                  <tr>
                  
                    <th>ten</th>
                    <th>trang thai</th>
                    <th>Room</th>
                    <th>Rooms available</th>
                    <th>dich vu</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <tr>
                  
                      <th>ten</th>
                      <th>trang thai</th>
                      <th>Room</th>
                      <th>Rooms available</th>
                      <th>dich vu</th>
                      <th>Action</th>
                    </tr>
                </tfoot>
                <tbody>
           
                  <c:forEach var="hotel" items="${hotels}">
                  <tr>
                 
                    <td>${hotel.name}</td>
                    <td>		<c:if test="${hotel.accountByIdAcEmployee == null and hotel.status == false }">
                      <p class="text-center" style="color: #e68a00 ;"><i class="fa fa-fw fa-hourglass"></i>Awaiting</p>
                      
                      </c:if>
                      <c:if test="${hotel.accountByIdAcEmployee == null and hotel.status == true }">
                      <p class="text-center" style="color: #e68a00 ;"><i class="fa fa-fw fa-hourglass"></i>Awaiting(update)</p>
                      
                      </c:if>
                      <c:if test="${hotel.accountByIdAcEmployee != null and hotel.status == true }">
                      <p class="text-center" style="color: #0033cc ;"><i class="fa fa-fw fa-check-square"></i>Active</p>
                      
                      </c:if>
                      
                              <c:if test="${hotel.accountByIdAcEmployee != null and hotel.status == false }">
                      <p class="text-center" style="color: #ff0000 ;"><i class="fa fa-fw fa-times"></i> Prohibit</p>
                      
                      </c:if></td>
                    <td>
                      <c:set var="amountRoom" value="0"></c:set>
              
                      <c:set var="roomAvailable" value="0"></c:set>
                     <c:forEach var="room" items="${hotel.rooms }">
                     <c:if test="${room.status !=null}">
                     
                     <c:set var="amountRoom" value="${amountRoom + room.amountOfRoom }"></c:set> 
                     </c:if>
                     <c:forEach var="orderdetail" items="${room.orderDetails }">
                     <c:if test="${orderdetail.checkOutDate > now and orderdetail.orders.status == true and orderdetail.checkInDate < now}"></c:if>
                     <c:set var="roomAvailable" value="${roomAvailable + orderdetail.quantity }"></c:set>
                     </c:forEach>
                     </c:forEach>
                     ${ amountRoom}
                    </td>
                    <td>${amountRoom -roomAvailable }</td>
                    <td>      <c:forEach var="service" items="${hotel.serviceHotels }">
                      <c:if test="${service.startDate < now and  service.endDate > now and service.status == true}">
                   
                    <c:if test="${service.id % 2 == 0 }">
                     <span class="label label-danger"> ${service.service.name}</span>
                    
                    </c:if>
                      
                    <c:if test="${service.id % 2 != 0 }">
                     <span  class="label label-success"> ${service.service.name}</span>
                    
                    </c:if>
                      </c:if>
                      
                      </c:forEach></td>
                    <td>
                      
                      <a
                      href="${pageContext.request.contextPath }/roomManager/create/${hotel.id}"
                     >   <button type="button" class="btn btn-primary">+room</button></a>
                     <a href="${pageContext.request.contextPath }/partnerManager/edit/${hotel.id}"
                     >   <button type="button" class="btn btn-danger">+edit</button></a>
                       
                        <button type="button" class="btn btn-secondary">Left</button>
                        <button type="button" class="btn btn-secondary">Middle</button>
                </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>

      </div>
