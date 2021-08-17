package com.bank.servlets;

import com.bank.dao.customerDao;
import com.bank.entities.User;
import com.bank.helper.ConnectionProvider;
import java.io.*;
import javafx.scene.control.Alert;
import javax.servlet.*;
import javax.servlet.http.*;

public class transferAmountServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            HttpSession session=request.getSession(false);
            int id=(int) session.getAttribute("transferID");
            // get all data from JSP
            String RecEmail=request.getParameter("receiver");
            int amount=Integer.parseInt(request.getParameter("amount"));
            
            // get data from database
            customerDao dao = new customerDao(ConnectionProvider.getConnection());
            User u=dao.getSenderUser(id);
            
            // current balance of user
            int senderBalance=Integer.parseInt(u.getBalance());
            User RUser=dao.getReceiverUser(RecEmail);
            
             
            int receiverBalance=Integer.parseInt(RUser.getBalance());
            boolean f;
            if(amount<=senderBalance){
                out.println("done");
                f=true;
                int diff=senderBalance-amount;
                int sum=receiverBalance+amount;
                
                boolean b=dao.updateBalance(id,diff);
                dao.updateBalance(RUser.getId(),sum);
                dao.updateTransactionHistory(u.getName(), RUser.getName(),amount);
                out.println("done");
            }else{
                out.println("error");
                f=false;
            }
            
            request.setAttribute("f", f);
            RequestDispatcher rd=request.getRequestDispatcher("transactUser.jsp");
            rd.forward(request, response);
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
