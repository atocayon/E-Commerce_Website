/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pakage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author actwhitehat27
 */
@WebServlet(name = "cancel", urlPatterns = {"/cancel"})
public class cancel extends HttpServlet {

   

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String prodID = request.getParameter("prodID");
        String seller = request.getParameter("seller");
        String shipping = request.getParameter("shipping");
        String buyer = request.getParameter("buyer");
        
        UserDAO cancel = new UserDAO();
        int buyerID = cancel.getBuyerId(buyer);
        cancel.cancelOrder(prodID,seller,shipping,buyerID);
        response.sendRedirect("myOrders.jsp");
    }

   

}
