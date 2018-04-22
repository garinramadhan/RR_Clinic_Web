/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.MPatient;

/**
 *
 * @author GR
 */
@WebServlet(name = "AddPatient", urlPatterns = {"/AddPatient"})
public class AddPatient extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            RequestDispatcher rd = request.getRequestDispatcher("Patient.jsp");
            rd.forward(request, response);
            
            String status = request.getParameter("Btn");
            String gender = request.getParameter("gender");
            MPatient md = new MPatient();
            if(status.equals("Update")){
                md.setPatientID(request.getParameter("txtID"));
                md.setPatientName(request.getParameter("txtName"));
                md.setPatientGender(gender);
                md.setPatientDOB(request.getParameter("dob"));
                md.setPatientAddress(request.getParameter("txtAddress"));
                int i = md.doUpdate();
                if(i > 0){
                    response.sendRedirect("Patient.jsp?ket=Sukses");
                }else{
                    response.sendRedirect("Patient.jsp?ket=Gagal");
                }
            }else if(status.equals("Save")){
                md.setPatientID(request.getParameter("txtID"));
                md.setPatientName(request.getParameter("txtName"));
                md.setPatientGender(gender);
                md.setPatientDOB(request.getParameter("dob"));
                md.setPatientAddress(request.getParameter("txtAddress"));
                int i = md.doInsert();
                if(i > 0){
                    response.sendRedirect("Patient.jsp?ket=Sukses");
                }else{
                    response.sendRedirect("Patient.jsp?ket=Gagal");
                }
            }
//            else if(request.getParameter("status").equals("Delete")){
//                md.setPatientID(request.getParameter("id"));
//                int i = md.doDelete();
//                if(i > 0){
//                    response.sendRedirect("Patient.jsp?ket=Sukses");
//                }else{
//                    response.sendRedirect("Patient.jsp?ket=Gagal");
//                }
//            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
