<%-- 
    Document   : Doctor
    Created on : Apr 16, 2018, 9:03:00 PM
    Author     : dhadotid
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.MDoctor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RR Clinic</title>
    </head>
    <body>
        <div class="row">             
            
             <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Doctor</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
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
                      Doctor Record.
                    </p>
                    <table id="datatable-fixed-header" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>ID Doctor</th>
                          <th>ID Specialist</th>
                          <th>Doctor Name</th>
                          <th>Gender</th>
                          <th>Date of Birth</th>
                          <th>Phone</th>
                          <th>Action</th>
                        </tr>
                      </thead>
                      <tbody>
                      <%
                      try{
                        MDoctor md = new MDoctor();
                        ArrayList data = md.tableDoctor();
                        for(int i = 0;i < data.size()-1;i+=6)
                        {
                            String idDoctor = (String)data.get(i);
                            String DoctorSPC = (String)data.get(i+1);
                            String DoctorName = (String)data.get(i+2);
                            String DoctorGender = (String)data.get(i+3);
                            String DOB = (String)data.get(i+4);
                            String DoctorPhone = (String)data.get(i+5);
                            
                            out.println("<tr>");
                            out.println("<td>"+idDoctor+"</td>");
                            out.println("<td>"+DoctorSPC+"</td>");
                            out.println("<td>"+DoctorName+"</td>");
                            out.println("<td>"+DoctorGender+"</td>");
                            out.println("<td>"+DOB+"</td>");
                            out.println("<td>"+DoctorPhone+"</td>");
                            out.println("<td>");
                            out.println("<a href='view_book.jsp?id="+idDoctor+"'>View </a>");
                            out.println("<a href='edit_book.jsp?id="+idDoctor+"'>Modify </a>");
                            out.println("<a href='delete_book.jsp?id="+idDoctor+"'>Delete </a>");
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
    </body>
</html>