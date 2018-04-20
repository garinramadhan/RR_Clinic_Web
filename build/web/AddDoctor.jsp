<%-- 
    Document   : AddDoctor
    Created on : Apr 16, 2018, 9:02:16 PM
    Author     : dhadotid
--%>

<%@page import="model.MDoctor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MSpecialist"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
    <center>
        <%
                              String status;
                          status = request.getParameter("status");
                          String role = (String)session.getAttribute("role");
                          if(status.equals("Add")){
                              if(role.equals("0")){
                                        response.sendRedirect("index.jsp");
                                      }else{
                                        %> <h2>Add Doctor</h2> <%
                                    }
                              }else if(status.equals("Update")){
                                    if(role.equals("0")){
                                        response.sendRedirect("index.jsp");
                                      }else{
                                        %> <h2>Update Doctor</h2> <%
                                    }
                              %>
                                  
                              <%}
    %>
    </center>
    <br>
<!--===============================================================================================-->
</head>
    <body>
    <form name="DrugForm" method="post" action="AddDoctor">
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
                        String idDoctor, idSpecialist = "", doctorName = "", gender = "", dob = "", phone = "";
                        MDoctor mDoc = new MDoctor();
                        if(status.equals("Update")){
                            idDoctor = request.getParameter("id");
                            ArrayList dok = new ArrayList();
                            mDoc.setDoctorID(idDoctor);
                            dok = mDoc.getRecord();
                            idDoctor = (String) dok.get(0);
                            idSpecialist = (String)dok.get(1);
                            doctorName = (String)dok.get(2);
                            gender = (String)dok.get(3);
                            dob = (String)dok.get(4);
                            phone = (String)dok.get(5);
                        }else{
                            idDoctor = mDoc.autoid();
                        }
                        %>
                    
                        <div class="form-group">
                          <label class="col-md-3 control-label" for="txtIdDoctor">ID Doctor</label>
                          <div class="col-md-9">
                              <input type="text" id="txtID" name="txtID" required="required" class="form-control col-md-7 col-xs-12" value="<%=idDoctor%>">
                          </div>
                        </div>
                    
                
                <div class="form-group">
                  <label class="col-md-3 control-label" for="DDIdSpecialist">ID Specialist</label>
                  <div class="col-md-9">
                     <select name="specialist">
                         <%
                            MSpecialist ms = new MSpecialist();
                            ArrayList data = ms.tableSpecialist();
                            for(int i = 0;i < data.size()-1;i+=3)
                            {
                                String idSpc = (String)data.get(i);
                                String SpcName = (String)data.get(i+1);
                                Double fare = (Double)data.get(i+2);
                                String value = idSpc + " - "  +SpcName;
                                out.println("<option value='"+idSpc+"'>"+value+"</option>");
                            }
                         %>
                      </select> 
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtDoctorname">Doctor Name</label>
                  <div class="col-md-9">
                    <input type="text" id="txtName" name="txtName" required="required" class="form-control col-md-7 col-xs-12" value="<%=doctorName%>">
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
                  <label class="col-md-3 control-label" for="txtDateofbirth">Date of Birth</label>
                  <div class="col-md-9">
                      <input type="date" name="dob" value="<%=dob%>">
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtPhonenumber">Phone Number</label>
                  <div class="col-md-9">
                      <input type="text" id="txtPhone" name="txtPhone" required="required" class="form-control col-md-7 col-xs-12" value="<%=phone%>">
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
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
<!--===============================================================================================-->
    </body>
</html>