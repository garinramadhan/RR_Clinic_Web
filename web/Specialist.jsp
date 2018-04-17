<%-- 
    Document   : Specialist
    Created on : Apr 17, 2018, 8:55:06 PM
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
        
        <link href="assets/css/style.css" rel="stylesheet" />
        <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="assets/css/Style.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.css"/>
        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.js"></script>

    </head>
    <body>
        <div class="row">             
             <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Patient</h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                      <%
                          String ket;
                          ket = request.getParameter("ket");
                          if(ket != null){
                            if(ket.equals("Sukses") && ket != null){%>
                               <div class="alert alert-success alert-dismissible fade in" role="alert">
                                  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                                  </button>
                                   <strong><%=ket%></strong> 
                                </div>
                            <%}else if(ket.equals("Gagal") && ket != null){%>
                              <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                                  </button>
                                   <strong><%=ket%></strong> 
                               </div>
                              <%}
                          }
                      %>
                      Patient Record.
                    </p>
                    <table id="datatable-fixed-header" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>ID Specialist</th>
                          <th>Specialist Name</th>
                          <th>Fare</th>
                          <th>Action</th>
                        </tr>
                      </thead>
                      <tbody>
                      <%
                      try{
                        MSpecialist ms = new MSpecialist();
                        ArrayList data = ms.tableSpecialist();
                        for(int i = 0;i < data.size()-1;i+=3)
                        {
                            String idSpecialist = (String)data.get(i);
                            String SpcName = (String)data.get(i+1);
                            Double Fare = (Double)data.get(i+2);
                            
                            out.println("<tr>");
                            out.println("<td>"+idSpecialist+"</td>");
                            out.println("<td>"+SpcName+"</td>");
                            out.println("<td>"+Fare+"</td>");
                            out.println("<td>");
                            out.println("<a role='button' class='btn btn-info' href='AddSpecialist.jsp?status=Update&id="+idSpecialist+"' >Modify </a>");
                            out.println("<a role='button' class='btn btn-danger' href='delete_book.jsp?id="+idSpecialist+"'>Delete </a>");
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
                      <script>
$(document).ready(function() {
    $('#datatable-fixed-header').DataTable( {
        "lengthMenu": [[5, 15, 25, 50, -1], [5, 15, 25, 50, "All"]]
    } );
} );
                      </script>
    </body>
</html>
