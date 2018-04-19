<%-- 
    Document   : AddTreatment
    Created on : Apr 19, 2018, 12:39:04 AM
    Author     : dhadotid
--%>

<%@page import="model.MTreatment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MPatient"%>
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
<!--===============================================================================================-->
    </head>
    <body>
        <%
            MTreatment mt = new MTreatment();
            String idTreatment, idRecipe;
            idTreatment = mt.autoid();
            idRecipe = mt.autoidRecipe();
        %>
        <div class="container form-horizontal">
    	<div class="row">
          <div class="col-md-7 col-md-offset-0">
            <div class="custom">
                <br>
                
                <center>
                <h2 id="tulisanatas">Add New Data Treatment</h2>
                </center>
                <hr>

                <fieldset disabled>
                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtIdTreatment">Id Treatment</label>
                  <div class="col-md-9">
                      <input ID="txtIdTreatment" placeholder="Id Treatment" name="txtIdTreatment" CssClass="form-control" value="<%=idTreatment%>"></input>
                  </div>
                </div>
                    </fieldset>
                
                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtIdPatient">Id Patient</label>
                  <div class="col-md-9">
                    <input ID="txtIdPatient" name="txtIdPatient" placeholder="Please select Id Patient from table" CssClass="form-control" Enabled="False"></input>
                  </div>
                </div>
                
               
                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtIdDoctor">Id Doctor</label>
                  <div class="col-md-9">
                    <input ID="txtIdDoctor" name="txtIdDoctor" placeholder="Please select Id Doctor from table" CssClass="form-control" Enabled="False"></input>
                  </div>
                </div>

                <fieldset disabled>
                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtIdRecipe">Id Recipe</label>
                  <div class="col-md-9">
                      <input ID="txtIdRecipe" name="txtIdRecipe" placeholder="Id Recipe" CssClass="form-control" value="<%=idRecipe%>"></input>
                  </div>
                </div>
                </fieldset>

                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtDiagnose">Diagnose</label>
                  <div class="col-md-9">
                    <input ID="txtDiagnose" name="txtDiagnose" placeholder="Diagnose" CssClass="form-control" TextMode="MultiLine"></input>
                  </div>
                </div>

                <fieldset disabled>
                <div class="form-group">
                  <label class="col-md-3 control-label" for="txtDateTreatment">DateTreatment</label>
                  <div class="col-md-9">
                    <input ID="txtDateTreatment" name="txtDateTreatment" placeholder="Date Treatment" CssClass="form-control"></input>
                  </div>
                </div>
                </fieldset>

                <div class="form-group">
                  <div class="col-md-12 text-right">
                    
                      <button ID="btnSave" name="Save" Class="btn btn-primary btn-lg">Save</button>
                    
                  </div>
                </div>

                <hr>

<!--         <div class="col-sm-12 col-md-12 col-lg-12">-->
            <div class="col-sm-6 col-md-6 col-lg-6 col-xs-6">
                <h2>Data Patient</h2>
                <!--<asp:Button ID="btnSearchPatient" runat="server" Text="Search" CssClass="btn btn-info"/>!-->
            <table id="datatable-fixed-header" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>ID Patient</th>
                          <th>Patient Name</th>
                          <th>Action</th>
                        </tr>
                      </thead>
                      <tbody>
                      <%
                          
                      try{
                        MPatient md = new MPatient();
                        ArrayList data = md.selectNamePatient();
                        for(int i = 0;i < data.size()-1;i+=2)
                        {
                            String idPatient = (String)data.get(i);
                            String patientName = (String)data.get(i+1);
                            
                            out.println("<tr>");
                            out.println("<td id='nr'>"+idPatient+"</td>");
                            out.println("<td>"+patientName+"</td>");
                            out.println("<td>");
                            out.println("<a role='button' class='btn btn-info' id='btnSelectPatient' >Select </a>");
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
            <div class="col-sm-5 col-md-5 col-sm-offset-1">
                <h2>Data Doctor</h2>
                <!--<asp:Button ID="btnSearchPatient" runat="server" Text="Search" CssClass="btn btn-info"/>!-->
            <table id="datatable-fixed-header" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>ID Doctor</th>
                          <th>Doctor Name</th>
                          <th>Specialist</th>
                          <th>Action</th>
                        </tr>
                      </thead>
                      <tbody>
                      <%
                          
                      try{
                        MTreatment md = new MTreatment();
                        ArrayList data = md.tableDoctor();
                        for(int i = 0;i < data.size()-1;i+=3)
                        {
                            String idDoctor = (String)data.get(i);
                            String doctorName = (String)data.get(i+1);
                            String doctorSpc = (String)data.get(i+2);
                            
                            out.println("<tr>");
                            out.println("<td id='nrDoc'>"+idDoctor+"</td>");
                            out.println("<td>"+doctorName+"</td>");
                            out.println("<td>"+doctorSpc+"</td>");
                            out.println("<td>");
                            out.println("<a role='button' class='btn btn-info' id='btnSelectDoc' >Select </a>");
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
<!--        </div>-->
        
<!--===============================================================================================-->
    <script src="assets/js/jquery-3.1.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
    <script>
        $(document).ready(function() {
            $('#datatable-fixed-header').DataTable( {
                "lengthMenu": [[5, 15, 25, 50, -1], [5, 15, 25, 50, "All"]]
            } );
        } );
    </script>
    
    <script>
        $("#btnSelectPatient").click(function () {
        var id = $(this).closest("tr").find("#nr").text();
        //alert(id);
        document.getElementById("txtIdPatient").value = id;
      });

        $("#btnSelectDoc").click(function () {
          var id = $(this).closest("tr").find("#nrDoc").text();
          //alert(id);
          document.getElementById("txtIdDoctor").value = id;
        });
</script>
<!--===============================================================================================-->
<!--    <script type="text/javascript">
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>-->
<!--===============================================================================================-->
    </body>
</html>
