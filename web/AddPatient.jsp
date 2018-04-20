<%-- 
    Document   : AddPatient
    Created on : Apr 17, 2018, 3:15:36 PM
    Author     : GR
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.MPatient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!--===============================================================================================-->
    <div class="top_nav">
        <a role="button" class="btn btn-light" href="index.jsp" style="margin-top: 5px;margin-left: 5px;"><i class="material-icons" style="font-size: 28px;">arrow_back</i></a>
    </div>
    
<center>
        <%
                              String status;
                          status = request.getParameter("status");
                          String role = (String)session.getAttribute("role");
                          if(status.equals("Add")){%>
                              <h2>Add Patient</h2>
                              <%}else if(status.equals("Update")){
                                    if(role.equals("0")){
                                        response.sendRedirect("index.jsp");
                                      }else{
                                        %> <h2>Update Patient</h2> <%
                                    }
                              %>
                                  
                              <%}
    %>
    </center>
    <br>
<!--===============================================================================================-->
    </head>
    <body>
        <form name="PatientForm" method="post" action="AddPatient" id="patform">
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
                <div class="col-md-7 col-md-offset-3">
                <div class="custom">
                    <%
                        String PatientID, PatientName="", PatientGender="", PatientDOB="", PatientAddress="";
                        MPatient mPat = new MPatient();
                        if(status.equals("Update")){
                            PatientID = request.getParameter("id");
                            ArrayList pat = new ArrayList();
                            mPat.setPatientID(PatientID);
                            pat = mPat.getRecord();
                            PatientID = (String) pat.get(0);
                            PatientGender = (String)pat.get(1);
                            PatientDOB = (String)pat.get(2);
                            PatientAddress = (String)pat.get(3);
                        }else{
                            PatientID = mPat.autoid();
                        }
                        %>
                    
                        <div class="form-group">
                          <label class="col-md-3 control-label" for="txtIdPatient">ID Patient</label>
                          <div class="col-md-9">
                              <input type="text" id="txtID" name="txtID" required="required" class="form-control col-md-7 col-xs-12" value="<%=PatientID%>">
                          </div>
                        </div>
                    
                
                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtPatientname">Patient Name</label>
                  <div class="col-md-9">
                    <input type="text" id="txtName" name="txtName" required="required" class="form-control col-md-7 col-xs-12" value="<%=PatientName%>">
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtDateofbirth">Date of Birth</label>
                  <div class="col-md-9">
                      <input type="date" name="dob" value="<%=PatientDOB%>">
                  </div>
                </div>  
                  
                <div class="form-group">
                  <label class="col-md-3 control-label" for="gender">Gender</label>
                  <div class="col-md-9">
                    <input type="radio" name="gender" value="male"> Male
                    <input type="radio" name="gender" value="female"> Female
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtPatientname">Patient Address</label>
                  <div class="col-md-9">
<!--                    <input type="text" id="txtAddress" name="txtAddress" required="required" class="form-control col-md-7 col-xs-12" value="">-->
                      <textarea form="patform" id="txtAddress" name="txtAddress" required="required" class="form-control col-md-7 col-xs-12" value="<%=PatientAddress%>"></textarea>
                  </div>
                </div>
                

                              <%
                          if(status != null){
                            if(status.equals("Add") && status != null){%>
                               <div class="form-group">
                  <div class="col-md-12 text-right">
                      <input type="submit" value="Save" name="Btn" class="btn btn-success">
                  </div>
                </div><%
                            }else if(status.equals("Update") && status != null){%>
                               <div class="form-group">
                                <div class="col-md-12 text-right">
                                    <input type="submit" value="Update" name="Btn" class="btn btn-info">
                                </div>
                              </div> 
                            <%}
                          }
                      %>
                
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
<!--===============================================================================================-->
    <script type="text/javascript">
        $(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
<!--===============================================================================================-->
    </body>
</html>
