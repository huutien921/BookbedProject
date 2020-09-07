<%@ page language="java" contentType="text/html;  charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="tag" uri="hotel_tags" %>
<style>
    div .btn {
        margin-bottom: 5px;
    }
</style>
<script>
    $(document)
        .ready(
            function () {
                $("#dataTable tbody tr")
                    .on(
                        "click",
                        function (event) {

                            var id = $(this).find("td").eq(1)
                                .html();
                            $
                                .ajax({

                                    type: 'GET',
                                    url: '${pageContext.request.contextPath }/api/roomManager/images',
                                    data: {
                                        id: id
                                    },
                                    dataType: 'json',
                                    contentType: 'application/json',
                                    success: function (result) {
                                        s = '';
                                        for (var i = 0; i < result.length; i++) {
                                            s += ' <div class="col-md-3">';
                                            s += '<img class="img-description" id="' + result[i].id + '" onclick="modifiedImage(this)" src="${pageContext.request.contextPath }/uploads/images/rooms/' + result[i].src + '" alt="' + result[i].alt + '">';
                                            s += '</div>';
                                        }
                                        $('#result').html(s);

                                    }

                                });

                        });
                   
                // image description 
                $("#modalImage .delete").on('click',()=>{
                    var load ='<div class="loading-card" id="loading"> <i class="fa fa-spinner fa-spin fa-5x fa-fw"></i>';
                          load += ' <p> <spring:message code="search.result.loading" /></p> </div>';
                          $('#result').html(load);
                    var id  = $('#idImgHidden').val();
                   
                    $.ajax({
                              
                                    type: 'GET',
                                    url: '${pageContext.request.contextPath }/api/roomManager/delete/image',
                                    data: {
                                        id : id
                                    },
                                    dataType: 'json',
                                    contentType: 'application/json',
                                    success: function (result) {
                                        s = '';
                                        for (var i = 0; i < result.length; i++) {
                                            s += ' <div class="col-md-3">';
                                            s += '<img class="img-description" id="' + result[i].id + '" onclick="modifiedImage(this)" src="${pageContext.request.contextPath }/uploads/images/rooms/' + result[i].src + '" alt="' + result[i].alt + '">';
                                            s += '</div>';
                                        }
                                       
                                        $('#result').html(s);
                                        $("#modalImage").modal('hide');
                                        alert('thanh cong cmnr !')

                                    },
                                    error: function(err){
                                        alert('that bai  cmnr !')
                                    }

                                });
                })
              
            });
            function modifiedImage(ent){
               
                var s = '<img class="img-hotel-description" src="'+ent.src+'">'
                var id = ent.id;
              
                if(id == 'null'){
                  
                    $("#modalImage .delete").prop('disabled', true);
                    $("#modalImage .use-avatar").prop('disabled', true);
                }else{
                    $("#modalImage .delete").prop('disabled', false);
                    $("#modalImage .use-avatar").prop('disabled', false);
                    $('#idImgHidden').val(id);
                }
                $("#modalImage .modal-body").html(s);
                $("#modalImage").modal('show');

            }

</script>
<div class="container-fluid">

    <!-- Modal -->
    <div class="modal fade" id="modalImage" tabindex="-1" role="dialog" aria-labelledby="modalImageTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalImageTitle">Change</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                  
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="idImgHidden"/>
                    <button type="button" class="btn btn-secondary delete"> <i class="far fa-trash-alt"></i></button>
                    <button type="button" class="btn btn-primary use-avatar"><i class="fas fa-cog"></i> use avatar for hotel</button>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">

            <tag:hotel_info />

        </div>
        <!-- /.col -->
        <div class="col-md-9">
            <div class="card">
                <div class="card-header p-2">
                    <ul class="nav nav-pills">
                        <li class="nav-item"><a class="nav-link active" href="#room" data-toggle="tab">Room</a></li>
                        <li class="nav-item"><a class="nav-link " href="#discount" data-toggle="tab">Discount</a></li>
                        <li class="nav-item"><a class="nav-link" href="#service" data-toggle="tab">My Service</a></li>
                    </ul>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="tab-content">
                        <div class="tab-pane active" id="room">
                            <!-- rooms -->
                            <div class="box-body">
                                <table id="dataTable" class="table table-bordered table-hover table-center">
                                    <thead>
                                        <tr>
                                            <th>Image</th>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Price</th>
                                            <th>Amount Room</th>
                                            <th>Empty room</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="room" items="${hotel.rooms }">
                                            <c:set var="roomEmty" value="0"></c:set>
                                            <tr class="rows">
                                                <td><img class="img-hotel"
                                                        src="${pageContext.request.contextPath }/uploads/images/rooms/${room.srcIcon}">
                                                </td>
                                                <td>${room.id }</td>
                                                <td>${room.name}</td>
                                                <td>${room.price }</td>
                                                <td>${room.amountOfRoom }</td>
                                                <td>
                                                    <c:forEach var="orderdetail" items="${room.orderDetails }">
                                                        <c:if
                                                            test="${orderdetail.checkOutDate > now and orderdetail.orders.status == true and orderdetail.checkInDate < now and orderdetail.room.id == room.id}">
                                                        </c:if>
                                                        <c:set var="roomEmty"
                                                            value="${roomEmty + orderdetail.quantity }"></c:set>
                                                    </c:forEach> ${room.amountOfRoom - roomEmty}
                                                </td>
                                                <td>${room.status ? '
                                                    <p class="text-muted text-center" style="color: #0033cc ;"><i
                                                            class="fa fa-fw fa-check-square"></i></p>' : '
                                                    <p class="text-muted text-center" style="color: #ff0000 ;"><i
                                                            class="fa fa-fw fa-minus-square"></i></p>' }</td>
                                                <td> <a href="${pageContext.request.contextPath }/roomManager/${room.hotel.id}/edit/${room.id}"
                                                        class="btn  btn-primary">Edit
                                                    </a></td>
                                            </tr>


                                        </c:forEach>
                                    <tfoot>
                                        <tr>
                                            <th>Image</th>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Price</th>
                                            <th>Amount Room</th>
                                            <th>Empty room</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <!-- end rooms -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Image description</h6>
                                </div>
                            
                                <div class="row card-body" id="result">
                             
                                </div>
                            </div>
                        </div>
                        <!-- /.tab-pane -->
                        <div class="tab-pane " id="discount">
                            eddddd
                        </div>
                        <!-- /.tab-pane -->

                        <div class="tab-pane" id="service">
                            aaa
                        </div>
                        <!-- /.tab-pane -->
                    </div>
                    <!-- /.tab-content -->
                </div>
                <!-- /.card-body -->
            </div>
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</div>