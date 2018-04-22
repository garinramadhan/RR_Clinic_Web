/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.util.logging.Level.WARNING;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.MPayment;

/**
 *
 * @author dhadotid
 */
public class UpdatePayment extends HttpServlet {

    private static final Logger LOG = Logger.getLogger(AddPayment.class.getName());
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
            MPayment mp = new MPayment();
            String idPay = request.getParameter("txtIdPayment1");
//            String idPay = request.getParameter("id");
            String money = request.getParameter("txtMoney");
            String change = request.getParameter("txtChange");
            if(Integer.parseInt(change) < 0){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Insuficient money');");
                out.println("location='AddPayment.jsp';");
                out.println("</script>");
            }else{
                mp.setPayID(idPay);
                
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Test: " + money + "');");
                out.println("location='AddPayment.jsp';");
                out.println("</script>");
                LOG.log(WARNING, "ASDW " + idPay);
                int i = mp.doUpdate();
                if(i > 0){
                    response.sendRedirect("Payment.jsp?ket=Sukses");
                }else{
                    response.sendRedirect("Payment.jsp?ket=Gagal");
                }
            }
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
