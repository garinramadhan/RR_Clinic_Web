<%-- 
    Document   : AddDrug
    Created on : Apr 17, 2018, 10:47:20 PM
    Author     : GR
--%>

<%@page import="model.MDrug"%>
<%@page import="java.util.ArrayList"%>
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
<!--===============================================================================================-->
        <center>
        <%
                              String status;
                          status = request.getParameter("status");
                          String role = (String)session.getAttribute("role");
                          if(status.equals("Add")){
                              if(role.equals("0")){
                                        response.sendRedirect("index.jsp");
                                      }else{
                                        %> <h2>Add Drug</h2> <%
                                    }
                              }else if(status.equals("Update")){
                                    if(role.equals("0")){
                                        response.sendRedirect("index.jsp");
                                      }else{
                                        %> <h2>Update Drug</h2> <%
                                    }
                              %>
                                  
                              <%}
    %>
    </center>
    <br>
<!--===============================================================================================-->
    </head>
    <body>
        <form name="DoctorForm" method="post" action="AddDrug">
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
                        String idDrug, DrugName = "", DrugType = "", DrugExp = "";
                        Integer Stock = 0;
                        Double Price = 0.0;
                        MDrug mDrg = new MDrug();
                        if(status.equals("Update")){
                            idDrug = request.getParameter("id");
                            ArrayList drg = new ArrayList();
                            mDrg.setDrugID(idDrug);
                            drg = mDrg.getRecord();
                            idDrug = (String) drg.get(0);
                            DrugName = (String)drg.get(1);
                            DrugType = (String)drg.get(2);
                            Stock = (Integer)drg.get(3);
                            DrugExp = (String)drg.get(4);
                            Price = (Double)drg.get(5);
                        }else{
                            idDrug = mDrg.autoid();
                        }
                        %>
                    
                        <div class="form-group">
                          <label class="col-md-3 control-label" for="txtIdDrug">ID Drug</label>
                          <div class="col-md-9">
                              <input type="text" id="txtID" name="txtID" required="required" class="form-control col-md-7 col-xs-12" value="<%=idDrug%>">
                          </div>
                        </div>
                    
                
                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtDrugname">Drug Name</label>
                  <div class="col-md-9">
                    <input type="text" id="txtName" name="txtName" required="required" class="form-control col-md-7 col-xs-12" value="<%=DrugName%>">
                  </div>
                </div>
                  
                <div class="form-group">
                  <label class="col-md-3 control-label" for="DDDrugType">Drug Type</label>
                  <div class="col-md-9">
                     <select name="type">
                         <option>Capsule</option>
                         <option>Syrup</option>
                         <option>Tablet</option>
                      </select> 
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtStock">Stock</label>
                  <div class="col-md-9">
                      <input type="text" id="txtStock" name="txtStock" required="required" class="form-control col-md-7 col-xs-12" value="<%=Stock%>">
                  </div>
                </div>
                  
                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtExpDate">Expired Date</label>
                  <div class="col-md-9">
                      <input type="date" name="expdate" value="<%=DrugExp%>">
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtPrice">Price</label>
                  <div class="col-md-9">
                      <input type="text" id="txtPrice" name="txtPrice" required="required" class="form-control col-md-7 col-xs-12" value="<%=Price%>">
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
