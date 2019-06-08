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
@WebServlet(name = "purchase", urlPatterns = {"/purchase"})
public class purchase extends HttpServlet {


   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String prodID = request.getParameter("prodID");
        String shipping = request.getParameter("shipping");
        String buyer = request.getParameter("buyer");
        String model = request.getParameter("model");
        String price = request.getParameter("price");
        String qty = request.getParameter("qty");
        String rating = request.getParameter("rating");
        String seller = request.getParameter("seller");
        int total = (Integer.parseInt(price) * Integer.parseInt(qty)) + Integer.parseInt(shipping);
        UserDAO purchase = new UserDAO();
        int BuyerID = purchase.getBuyerId(buyer);
        purchase.insertPurchase(prodID,seller,BuyerID,qty,shipping,"COD",total,"0");
        purchase.deleteCartItem(BuyerID,prodID);
        response.sendRedirect("myCart.jsp");
        
    }

  

}
