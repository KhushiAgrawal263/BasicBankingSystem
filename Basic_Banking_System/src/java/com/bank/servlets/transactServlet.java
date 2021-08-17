package com.bank.servlets;

import com.bank.dao.customerDao;
import com.bank.entities.User;
import com.bank.helper.ConnectionProvider;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class transactServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            // getting user when we click transact
            int id = Integer.parseInt(request.getParameter("u"));
            out.println(id);
            
            customerDao dao=new customerDao(ConnectionProvider.getConnection());
            User tUser=dao.getSenderUser(id);
            
            out.println(tUser.getEmail());

            HttpSession s = request.getSession();
            s.setAttribute("TransactData", tUser);
            response.sendRedirect("transactUser.jsp");
            
            String uid=request.getParameter("id");
            out.println(uid);
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
