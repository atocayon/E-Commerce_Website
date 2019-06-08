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
@WebServlet(name = "deleteProductCart", urlPatterns = {"/deleteProductCart"})
public class deleteProductCart extends HttpServlet {

   

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productID = request.getParameter("prodId");
        String buyer = request.getParameter("buyer");
        UserDAO delete = new UserDAO();
        int buyerID = delete.getBuyerId(buyer);
        delete.deleteProductCart(productID,buyerID);
        response.sendRedirect("myCart.jsp");
    }

    

}
