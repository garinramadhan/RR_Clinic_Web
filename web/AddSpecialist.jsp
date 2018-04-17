<%-- 
    Document   : AddSpecialist
    Created on : Apr 17, 2018, 9:05:59 PM
    Author     : GR
--%>

<%@page import="model.MSpecialist"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Specialist</title>
        
        <center>
        <%
                              String status;
                          status = request.getParameter("status");
                          if(status.equals("Add")){%>
                              <h2>Add Specialist</h2>
                              <%}else if(status.equals("Update")){%>
                                  <h2>Update Specialist</h2>
                              <%}
    %>
    </center>
    <br>
    </head>
    <body>
        <form name="SpecialistForm" method="post" action="AddSpc">
        <div class="container form-horizontal">
            <div class="row">
                <div class="col-md-7 col-md-offset-3">
                <div class="custom">
                    <%
                        String idSpecialist = "", Specialist = "";
                        Double Fare = 0.0;
                        MSpecialist mSpc = new MSpecialist();
                        if(status.equals("Update")){
                            idSpecialist = request.getParameter("id");
                            ArrayList spc = new ArrayList();
                            mSpc.setSpcID(idSpecialist);
                            spc = mSpc.getRecord();
                            idSpecialist = (String)spc.get(0);
                            Specialist = (String)spc.get(1);
                            Fare = (Double)spc.get(2);
                        }else{
                            idSpecialist = mSpc.autoid();
                        }
                        %>
                    <fieldset disabled>
                        <div class="form-group">
                          <label class="col-md-3 control-label" for="txtIdSpecialist">ID Specialist</label>
                          <div class="col-md-9">
                              <input type="text" id="txtID" name="txtID" required="required" class="form-control col-md-7 col-xs-12" value="<%=idSpecialist%>">
                          </div>
                        </div>
                    </fieldset>
                
                
                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtSpecialist">Specialist</label>
                  <div class="col-md-9">
                    <input type="text" id="txtName" name="txtName" required="required" class="form-control col-md-7 col-xs-12" value="<%=Specialist%>">
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtFare">Fare</label>
                  <div class="col-md-9">
                      <input type="text" id="txtPhone" name="txtFare" required="required" class="form-control col-md-7 col-xs-12" value="<%=Fare%>">
                  </div>
                </div>

                <%
                    if(status != null){
                    if(status.equals("Add") && status != null){
                %>
                <div class="form-group">
                  <div class="col-md-12 text-right">
                      <input type="submit" value="Save" name="Btn">
                  </div>
                </div><%
                            }else if(status.equals("Update") && status != null){%>
                               <div class="form-group">
                                <div class="col-md-12 text-right">
                                    <input type="submit" value="Update" name="Btn">
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
    <script src="assets/js/jquery-3.1.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){
        $('.table').DataTable();
      });
    </script>
    <script type="text/javascript">
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>

    </body>
</html>
