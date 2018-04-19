/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.MTreatment;

/**
 *
 * @author dhadotid
 */
@WebServlet(name = "AddTreatment", urlPatterns = {"/AddTreatment"})
public class AddTreatment extends HttpServlet {

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
            
            MTreatment md = new MTreatment();
            md.setTreatID(request.getParameter("txtIdTreatment"));
                md.setPatientID(request.getParameter("txtIdPatient"));
                md.setDoctorID(request.getParameter("txtIdDoctor"));
                md.setRecipeID(request.getParameter("txtIdRecipe"));
                md.setDiagnose(request.getParameter("txtDiagnose"));
                md.setTreatDate(request.getParameter("txtDateTreatment"));
                int i = md.doInsert();
                if(i > 0){
                    response.sendRedirect("Treatment.jsp?ket=Sukses");
                }else{
                    response.sendRedirect("Treatment.jsp?ket=Gagal");
                }
//            if(status.equals("Update")){
//                md.setTreatID(request.getParameter("txtID"));
//                md.setPatientID(request.getParameter("txtName"));
//                md.setDoctorID(gender);
//                md.setRecipeID(request.getParameter("dob"));
//                md.setDiagnose(request.getParameter("dob"));
//                md.setTreatDate(request.getParameter("dob"));
//                int i = md.doInsert();
//                if(i > 0){
//                    response.sendRedirect("Patient.jsp?ket=Sukses");
//                }else{
//                    response.sendRedirect("Patient.jsp?ket=Gagal");
//                }
//            }else if(status.equals("Save")){
//                md.setPatientID(request.getParameter("txtID"));
//                md.setPatientName(request.getParameter("txtName"));
//                md.setPatientGender(gender);
//                md.setPatientDOB(request.getParameter("dob"));
//                int i = md.doInsert();
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
