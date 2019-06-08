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
@WebServlet(name = "Cart", urlPatterns = {"/Cart"})
public class Cart extends HttpServlet {


    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String model = request.getParameter("model");
        String price = request.getParameter("price");
        String qty = request.getParameter("qty");
        String rating = request.getParameter("rating");
        String seller = request.getParameter("seller");
        String buyer = request.getParameter("buyer");
        
        UserDAO cart = new UserDAO();
        int buyerID = cart.getBuyerId(buyer);
        int productID = cart.getProduct(model,price,qty,rating,seller);
        if(cart.CheckToCart(buyerID, productID) == 1){
            cart.updateToCart(buyerID,productID);
            response.sendRedirect("myCart.jsp");
        }else{
            cart.addToCart(buyerID,productID);
            response.sendRedirect("myCart.jsp");
        }
        
    }

    

}
