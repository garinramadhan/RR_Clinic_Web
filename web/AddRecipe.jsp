<%-- 
    Document   : AddRecipe
    Created on : Apr 18, 2018, 1:06:50 AM
    Author     : GR
--%>

<%@page import="model.MRecipe"%>
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
                          if(status.equals("Add")){%>
                              <h2>Add Recipe</h2>
                              <%}else if(status.equals("Update")){%>
                                  <h2>Update Recipe</h2>
                              <%}
    %>
    </center>
    <br>
<!--===============================================================================================-->
    </head>
    <body>
        <form name="DrugForm" method="post" action="AddDoctor">
        <div class="container form-horizontal">
            <div class="row">
                <div class="col-md-7 col-md-offset-3">
                <div class="custom">
                    <%
                        String idRcpDtl, idRecipe = "", DrugId = "",Dose ="", dose = "";
                        Integer Qty=0;
                        Double subTot = 0.0;
                        MRecipe mRcp = new MRecipe();
                        if(status.equals("Update")){
                            idRcpDtl = request.getParameter("id");
                            ArrayList rcp = new ArrayList();
                            mRcp.setRecipeDetID(idRcpDtl);
                            rcp = mRcp.getRecordUpdate();
                            idRcpDtl = (String)rcp.get(0);
                            idRecipe = (String)rcp.get(1);
                            DrugId = (String)rcp.get(2);
                            Qty = (Integer)rcp.get(3);
                            Dose = (String)rcp.get(4);
                            subTot = (Double)rcp.get(5);
                        }else{
                            idRcpDtl = mRcp.autoid();
                        }
                        %>
                    <fieldset disabled>
                        <div class="form-group">
                          <label class="col-md-3 control-label" for="txtIdDoctor">ID Recipe Detail</label>
                          <div class="col-md-9">
                              <input type="text" id="txtRecipeID" name="txtID" required="required" class="form-control col-md-7 col-xs-12" value="<%=idRcpDtl%>">
                          </div>
                        </div>
                    </fieldset>
                
                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtDoctorname">ID Recipe</label>
                  <div class="col-md-9">
                    <input type="text" id="txtRecipe" name="txtRecipe" required="required" class="form-control col-md-7 col-xs-12" value="<%=idRecipe%>">
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtDateofbirth">Drug ID</label>
                  <div class="col-md-9">
                      <input type="text" name="txtName" name="txtName" required="required" class="form-control col-md-7 col-xs-12" value="<%=DrugId%>">
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtPhonenumber">Quantity</label>
                  <div class="col-md-9">
                      <input type="text" id="txtPhone" name="txtPhone" required="required" class="form-control col-md-7 col-xs-12" value="<%=Qty%>">
                  </div>
                </div>
                  
                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtPhonenumber">Dose</label>
                  <div class="col-md-9">
                      <input type="text" id="txtType" name="txtPhone" required="required" class="form-control col-md-7 col-xs-12" value="<%=Dose%>">
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
