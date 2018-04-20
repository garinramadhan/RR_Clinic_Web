<%-- 
    Document   : AddPayment
    Created on : Apr 19, 2018, 7:01:59 PM
    Author     : dhadotid
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.MPayment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RR Clinic</title>
        
        <!--===============================================================================================-->
        <link href="assets/dashboard/css/style.css" rel="stylesheet" />
        <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="assets/css/Style.css" rel="stylesheet" />
<!--===============================================================================================-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.css"/>
        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!--===============================================================================================-->
    <div class="top_nav">
        <a role="button" class="btn btn-light" href="index.jsp" style="margin-top: 5px;margin-left: 5px;"><i class="material-icons" style="font-size: 28px;">arrow_back</i></a>
    </div>
    </head>
    <body>
        <form action="AddPayment" method="post" id="addPayment">
             <%               
            String user = (String)session.getAttribute("username");
            if(user != null) {
                //out.println("Welcome, " + user);
            }
            else {
                response.sendRedirect("login.jsp");
            }
        %>
            <div class="container form-horizontal">
    	<div class="row">
          <div class="col-md-7 col-md-offset-0">
            <div class="custom">
                <br>
                
                <center>
                <h2 id="tulisanatas">Add New Data Payment</h2>
                </center>
                <hr>

                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtIdPayment">Id Payment</label>
                  <div class="col-md-9">
                      <input ID="txtIdPayment" name="txtIdPayment" placeholder="Please select Id Payment from table below" CssClass="form-control" Enabled="False"></input>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtPatientName">Patient Name</label>
                  <div class="col-md-9">
                      <input ID="txtPatientName" name="txtPatientName" placeholder="Patient Name" CssClass="form-control" Enabled="False"></input>
                  </div>
                </div>
                
               
                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtDoctorName">Doctor Name</label>
                  <div class="col-md-9">
                    <input ID="txtDoctorName" name="txtDoctorName" runat="server" placeholder="Doctor Name" CssClass="form-control" Enabled="False"></input>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtDiagnose">Diagnose</label>
                  <div class="col-md-9">
                    <input ID="txtDiagnose" name="txtDiagnose" placeholder="Diagnose" CssClass="form-control" Enabled="False" TextMode="MultiLine"></input>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtPaymentDoctor">Payment Doctor</label>
                  <div class="col-md-9">
                    <input ID="txtPaymentDoctor" name="txtPaymentDoctor" placeholder="Payment Doctor" CssClass="form-control" Enabled="False"></input>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtPaymentDrug">Payment Drug</label>
                  <div class="col-md-9">
                    <input ID="txtPaymentDrug" name="txtPaymentDrug" placeholder="Payment Drug" CssClass="form-control" Enabled="False"></input>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtTotalPayment">Total Payment</label>
                  <div class="col-md-9">
                    <input ID="txtTotalPayment" name="txtTotalPayment" placeholder="Total Payment" CssClass="form-control" Enabled="False"></input>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtMoney">Money</label>
                  <div class="col-md-9">
                      <input ID="txtMoney" name="txtMoney" placeholder="Money" CssClass="form-control" onkeyup="return calculate()"></input>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtChange">Change</label>
                  <div class="col-md-9">
                    <input ID="txtChange" name="txtChange" placeholder="Change" CssClass="form-control" Enabled="False"></input>
                  </div>
                </div>

                <div class="form-group">
                  <div class="col-md-12 text-right">
                    <button ID="btnSave" name="Save" Class="btn btn-primary btn-lg">Save</button>
                  </div>
                </div>

                <hr>

         <div class="col-sm-12 col-md-12 col-lg-12">
            <label ID="lblDataPayment" Text="Data Payment" style="font-weight: 700">Data Payment</asp:Label>
                
            <table id="dataPayment" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>ID Patient</th>
                          <th>Patient Name</th>
                          <th>Diagnose</th>
                          <th>Doctor Name</th>
                          <th>Payment Doctor</th>
                          <th>Payment Drug</th>
                          <th>Total Payment</th>
                          <th>Action</th>
                        </tr>
                      </thead>
                      <tbody>
                      <%
                          
                      try{
                        MPayment md = new MPayment();
                        ArrayList data = md.tablePayment();
                        for(int i = 0;i < data.size()-1;i+=7)
                        {
                            String idPayment = (String)data.get(i);
                            String patientName = (String)data.get(i+1);
                            String diagnose = (String)data.get(i+2);
                            String doctorName = (String)data.get(i+3);
                            Double paymentDoctor = (Double)data.get(i+4);
                            Double paymentDrug = (Double)data.get(i+5);
                            Double totPay = (Double)data.get(i+6);
                            
                            out.println("<tr>");
                            out.println("<td id='nr'>"+idPayment+"</td>");
                            out.println("<td>"+patientName+"</td>");
                            out.println("<td>"+doctorName+"</td>");
                            out.println("<td>"+diagnose+"</td>");
                            out.println("<td>"+paymentDoctor+"</td>");
                            out.println("<td>"+paymentDrug+"</td>");
                            out.println("<td>"+totPay+"</td>");
                            out.println("<td>");
                            out.println("<a role='button' class='btn btn-info' id='btnSelect'>Select </a>");
                            out.println("</td>");
                            out.println("</tr>");
                        }
                    }
                    catch(Exception ex) {
                        out.println("Data Gagal Ditampilkan : " + ex);
                        
                    }
                      %>                      
                                             
                      </tbody>
                    </table>
        </div>

            </div>
          </div>
    	</div>
        </div>
                    
        </form>
                      
                      <!--===============================================================================================-->
    <script src="assets/js/jquery-3.1.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
    <script type="text/javascript">
      $(document).ready(function(){
        $('.table').DataTable();
      });
    </script>
    <script>
        function calculate() {
            document.getElementById("txtChange").value = document.getElementById("txtMoney").value - document.getElementById("txtTotalPayment").value;
        }
    </script>
    <script>
        $('.btn').on('click', function () {
            //$(this).parent().parent().find('td:first').text());
            document.getElementById("txtIdPayment").value = $(this).parent().parent().find('td:eq(0)').text();
            document.getElementById("txtPatientName").value = $(this).parent().parent().find('td:eq(1)').text();
            document.getElementById("txtDoctorName").value = $(this).parent().parent().find('td:eq(2)').text();
            document.getElementById("txtDiagnose").value = $(this).parent().parent().find('td:eq(3)').text();
            document.getElementById("txtPaymentDoctor").value = $(this).parent().parent().find('td:eq(4)').text();
            document.getElementById("txtPaymentDrug").value = $(this).parent().parent().find('td:eq(5)').text();
            document.getElementById("txtTotalPayment").value = $(this).parent().parent().find('td:eq(6)').text();
        });
        
</script>
<!--===============================================================================================-->
    <script type="text/javascript">
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
    </body>
</html>
