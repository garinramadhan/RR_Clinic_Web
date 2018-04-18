<%-- 
    Document   : index
<<<<<<< HEAD
    Created on : Apr 16, 2018, 7:35:44 PM
    Author     : GR
=======
    Created on : Apr 16, 2018, 9:03:30 PM
    Author     : dhadotid
>>>>>>> first commit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>RR Clinic</title>

<!--===============================================================================================-->
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/css/Style.css" rel="stylesheet" />
<!--===============================================================================================-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.css"/>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.js"></script>
<!--===============================================================================================-->
    </head>
    <body>
        <%               
            String user = (String)session.getAttribute("username");
            String role = (String)session.getAttribute("role");
            if(user != null) {
                //out.println("Welcome, " + user);
            }
            else {
                response.sendRedirect("login.jsp");
            }
        %>
        <header>
            <input type="checkbox" id="tag-menu"/>
            <label class="menu-bar" for="tag-menu" data-toggle="tooltip" data-placement="bottom" title="Menu">R2 Clinic</label>
            <div class="jw-drawer">
                <nav>
                    <ul>
                        <li><a href="index.jsp">Dashboard</a></li>
                        <li><a id="dspc" href="#">Specialist</a></li>
                        <li><a id="ddoctor" href="#">Doctor</a></li>
                        <li><a id="dpat" href="#">Patient</a></li>
                        <li><a id="dtrt" href="#">Treatment</a></li>
                        <li><a id="drcp" href="#">Recipe</a></li>
                        <!--
                        <li class="dropdown">
                            <a href="#" type="button" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Recipe<span class="caret"></span></a>
                            <ul class="dropdown-menu dropdown-color">
                                <li><a href="#">Recipe Detail</a></li>
                            </ul>
                        </li>
                        !-->
                        <li><a id="ddrug" href="#">Drug</a></li>
                        <li><a id="dpay" href="#">Payment</a></li>
                    </ul>
                </nav>
            </div>
            <ul class="white-color" style="float: right;" data-toggle="tooltip" data-placement="left" title="Account Setting">
                <li class="dropdown no-bullets" style="margin-right: 40px;">
                    <label class="menu-bar dropdown-toggle" for="tag-menu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="tvNama2">Hi, <%=user%><span class="caret"></span></label>
                    
                    <ul class="dropdown-menu dropdown-color">
                        <li><a href="#">Change Password</a></li>
                        <li><a role="button" id="btnLogout" onclick="btnLogout_Click" href="#">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </header>

        
        <div class="content">
            <div class="four-grids" style="margin:0px;margin-right: 15px;margin-top: 15px;">
		<div class="col-md-3 four-grid" align="center">
			<div class="four-agileits">
				<div class="icon">
					<i class="glyphicon glyphicon-user" style="font-size:37px" aria-hidden="true"></i>
				</div>
                                <div class="four-text">
                                    <h3>Registered Patient</h3>
                                    <h4 id="registeredPatient">24</h4>					
                                </div>				
			</div>
		</div>
		<div class="col-md-3 four-grid" align="center">
			<div class="four-agileinfo">
				<div class="icon">
					<i class="fa fa-user-md" style="font-size:37px" aria-hidden="true"></i>
				</div>
				<div class="four-text">
					<h3>Doctor</h3>
					<h4 id="theDoctor">15</h4>
				</div>			
			</div>
		</div>
		<div class="col-md-3 four-grid" align="center">
			<div class="four-w3ls">
				<div class="icon">
					<i class="glyphicon glyphicon-plus" style="font-size:37px" aria-hidden="true"></i>
				</div>
				<div class="four-text">
					<h3>Drug Available</h3>
					<h4 id="drugAvaible">12</h4>			
				</div>		
			</div>
		</div>
		<div class="col-md-3 four-grid" align="center">
			<div class="four-wthree">
				<div class="icon">
					<i class="glyphicon glyphicon-credit-card" style="font-size:37px" aria-hidden="true"></i>
				</div>
				<div class="four-text">
					<h3>Payment Success</h3>
					<h4 id="patientAlreadyPayment">14</h4>				
				</div>		
			</div>
		</div>
		<div class="clearfix"></div>
            </div>
            <div id="badan" class="four-grids" style="margin-right: 15px">
            <!--Konten-->
            </div>
        </div>
    </form>
<!--===============================================================================================-->
    <script src="assets/js/jquery-3.1.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
    <script type="text/javascript">
        $(document).ready(function() {
            $('#datatable-fixed-header').DataTable( {
                "lengthMenu": [[5, 15, 25, 50, -1], [5, 15, 25, 50, "All"]]
            } );
        } );
    </script>
<!--===============================================================================================-->    
    <script type="text/javascript">
        $(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
<!--===============================================================================================-->
    <script>
    $(document).ready(function(){
        $('#dspc').click(function(){
            $('#badan').load('Specialist.jsp');
        });
        $('#ddoctor').click(function(){
            $('#badan').load('Doctor.jsp');
        });
        $('#dpat').click(function(){
            $('#badan').load('Patient.jsp');
        });
        $('#dtrt').click(function(){
            $('#badan').load('Treatment.jsp');
        });
        $('#drcp').click(function(){
            $('#badan').load('Recipe.jsp');
        });
        $('#ddrug').click(function(){
            $('#badan').load('Drug.jsp');
        });
        $('#dpay').click(function(){
            $('#badan').load('Payment.jsp');
        });
    });
    </script>
<!--===============================================================================================-->
</body>
</html>
