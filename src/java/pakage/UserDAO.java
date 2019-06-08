/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pakage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author actwhitehat27
 */
public class UserDAO {
    
    //Database Connection Configuration
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }
    
    //User Registration
    public void save(String email, String uname, String pass,String address, String status) {
        Connection con = getConnection();
        PreparedStatement ps = null;
        try {
            String query = "INSERT INTO tbl_user(uname,password,email,address,status) values(?,?,?,?,?)";
            ps = con.prepareStatement(query);
            ps.setString(1, uname);
            ps.setString(2, pass);
            ps.setString(3, email);
            ps.setString(4, address);
            ps.setString(5, status);           
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }
    
    //Check if the user info already exist in the database
    public boolean Register_Check(String uname, String email){
        
        Connection con  = getConnection();
        
        
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            
            String query = "SELECT * FROM `tbl_user` WHERE `uname`=? AND `email`=?";
            ps = con.prepareStatement(query);
            ps.setString(1, uname);
            ps.setString(2, email);
            rs=ps.executeQuery();
            
            if(rs.next()){
                return true;
            }else{
                return false;
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
       
            
    }
    
    public boolean actionLogin(String uname, String pass){
        
        Connection con  = getConnection();
        
        
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            
            String query = "SELECT * FROM `tbl_user` WHERE `uname`=? AND `password`=?";
            ps = con.prepareStatement(query);
            ps.setString(1, uname);
            ps.setString(2, pass);
            rs=ps.executeQuery();
            
            if(rs.next()){
                return true;
            }else{
                return false;
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
       
            
    }
    
    //User status
    public void setStatus(String uname, String status) {
        Connection con = getConnection();
        PreparedStatement ps = null;
        try {
            String query = "UPDATE tbl_user SET status=? WHERE uname=?";
            ps = con.prepareStatement(query);
            ps.setString(1, status);
            ps.setString(2, uname);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }
    
    public int selectSeller(String uname){
        
        Connection con = getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        int id = 0;
        try{
            String query = "SELECT * FROM `tbl_user` WHERE `uname`=?";
            ps = con.prepareStatement(query);
            ps.setString(1, uname);
            rs=ps.executeQuery();
            if(rs.next()){
                return id = rs.getInt("id");
            }else{
                return id = 0;
            }
            
        
        }catch (Exception e){
            System.out.print(e);
        }        
        
        return id;
        
    }
    
  

    public void insertProduct(int userID, String brand, String model, String type, String qty, String price, String sale, String shippingFee, int i, String path) {
       
        Connection con = getConnection();
        PreparedStatement ps = null;
        
        try {
            String query = "INSERT INTO tbl_products(seller_id,brand,model,type,qty,price,sale_percentage,shipping_fee,rating,file_dir) values(?,?,?,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(query);
            ps.setInt(1, userID);
            ps.setString(2, brand);
            ps.setString(3, model);
            ps.setString(4, type);
            ps.setString(5, qty);
            ps.setString(6, price);
            ps.setString(7, sale);
            ps.setString(8, shippingFee);
            ps.setInt(9, i);
            ps.setString(10, path);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }
    
    //to select specific product
    public List<GetSetProducts> selectUsersProduct(int user_id){
        
        Connection con  = getConnection();
        
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        
        List<GetSetProducts> list = new ArrayList<GetSetProducts>();
        
        try {
            
            String query = "SELECT * FROM tbl_products WHERE seller_id=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, user_id);
            
            rs=ps.executeQuery();
            
            while(rs.next()){
                GetSetProducts products = new GetSetProducts();
                products.setProductID(rs.getInt("id"));
                products.setBrand(rs.getString("brand"));
                products.setModel(rs.getString("model"));
                products.setType(rs.getString("type"));
                products.setQty(rs.getInt("qty"));
                products.setPrice(rs.getInt("price"));
                products.setSale_percentage(rs.getFloat("sale_percentage"));
                products.setShippingFee(rs.getInt("shipping_fee"));
                products.setRating(rs.getInt("rating"));
                products.setFileDir(rs.getString("file_dir"));
                list.add(products);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
            
    }
    
    //to select specific product
    public List<GetSetProducts> selectUsersCartProduct(int user_id){
        
        Connection con  = getConnection();
        
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        
        List<GetSetProducts> list = new ArrayList<GetSetProducts>();
        
        try {
            
            String query = "SELECT * FROM tbl_cart,tbl_products WHERE tbl_cart.product_id = tbl_products.id AND tbl_cart.buyer_id=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, user_id);
            
            rs=ps.executeQuery();
            
            while(rs.next()){
                GetSetProducts products = new GetSetProducts();
                products.setProductID(rs.getInt("tbl_products.id"));
                products.setSellerID(rs.getInt("seller_id"));
                products.setBrand(rs.getString("tbl_products.brand"));
                products.setModel(rs.getString("tbl_products.model"));
                products.setType(rs.getString("tbl_products.type"));
                products.setQty(rs.getInt("tbl_products.qty"));
                products.setPrice(rs.getInt("tbl_products.price"));
                products.setSale_percentage(rs.getFloat("tbl_products.sale_percentage"));
                products.setShippingFee(rs.getInt("tbl_products.shipping_fee"));
                products.setRating(rs.getInt("tbl_products.rating"));
                products.setFileDir(rs.getString("tbl_products.file_dir"));
                list.add(products);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
            
    }
    
    public List<GetSetProducts> selectUsersOrderedProduct(int user_id){
        
        Connection con  = getConnection();
        
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        
        List<GetSetProducts> list = new ArrayList<GetSetProducts>();
        
        try {
            
            String query = "SELECT * FROM tbl_transactions,tbl_products WHERE tbl_transactions.product_id = tbl_products.id AND tbl_transactions.buyer_id=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, user_id);
            
            rs=ps.executeQuery();
            
            while(rs.next()){
                GetSetProducts products = new GetSetProducts();
                products.setProductID(rs.getInt("tbl_products.id"));
                products.setSellerID(rs.getInt("seller_id"));
                products.setBrand(rs.getString("tbl_products.brand"));
                products.setModel(rs.getString("tbl_products.model"));
                products.setType(rs.getString("tbl_products.type"));
                products.setQty(rs.getInt("tbl_products.qty"));
                products.setPrice(rs.getInt("tbl_products.price"));
                products.setSale_percentage(rs.getFloat("tbl_products.sale_percentage"));
                products.setShippingFee(rs.getInt("tbl_products.shipping_fee"));
                products.setRating(rs.getInt("tbl_products.rating"));
                products.setFileDir(rs.getString("tbl_products.file_dir"));
                products.setPayment_mode(rs.getString("tbl_transactions.payment_mode"));
                products.setTotalPayment(rs.getInt("tbl_transactions.total_payment"));
                products.setStatus(rs.getInt("tbl_transactions.status"));
                list.add(products);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
            
    }
    
    public List<GetSetProducts> selectUsersCostumersProduct(int user_id){
        
        Connection con  = getConnection();
        
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        
        List<GetSetProducts> list = new ArrayList<GetSetProducts>();
        
        try {
            
            String query = "SELECT * FROM tbl_transactions,tbl_products WHERE tbl_transactions.product_id = tbl_products.id AND tbl_transactions.seller_id=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, user_id);
            
            rs=ps.executeQuery();
            
            while(rs.next()){
                GetSetProducts products = new GetSetProducts();
                products.setProductID(rs.getInt("tbl_products.id"));
                products.setSellerID(rs.getInt("seller_id"));
                products.setBrand(rs.getString("tbl_products.brand"));
                products.setModel(rs.getString("tbl_products.model"));
                products.setType(rs.getString("tbl_products.type"));
                products.setQty(rs.getInt("tbl_products.qty"));
                products.setPrice(rs.getInt("tbl_products.price"));
                products.setSale_percentage(rs.getFloat("tbl_products.sale_percentage"));
                products.setShippingFee(rs.getInt("tbl_products.shipping_fee"));
                products.setRating(rs.getInt("tbl_products.rating"));
                products.setFileDir(rs.getString("tbl_products.file_dir"));
                products.setPayment_mode(rs.getString("tbl_transactions.payment_mode"));
                products.setTotalPayment(rs.getInt("tbl_transactions.total_payment"));
                products.setStatus(rs.getInt("tbl_transactions.status"));
                list.add(products);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
            
    }

    public void productUpdate(String productID, String model, String price, String qty, String rating) {
        Connection con = getConnection();
        PreparedStatement ps = null;
        try {
            String query = "UPDATE tbl_products SET model=?,qty=?,price=?,rating=? WHERE id=?";
            ps = con.prepareStatement(query);
            ps.setString(1, model);
            ps.setString(2, qty);
            ps.setString(3, price);
            ps.setString(4, rating);
            ps.setString(5, productID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }

    public void deleteProduct(String productID) {
        Connection con = getConnection();
        PreparedStatement ps = null;
        try {
            String query = "DELETE FROM tbl_products WHERE id=?";
            ps = con.prepareStatement(query);
            ps.setString(1, productID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void deleteProductCart(String productID,int buyerID) {
        Connection con = getConnection();
        PreparedStatement ps = null;
        try {
            String query = "DELETE FROM tbl_cart WHERE buyer_id=? AND product_id=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, buyerID);
            ps.setString(2, productID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    //to select all product
    public List<GetSetProducts> selectAllProduct(){
        
        Connection con  = getConnection();
        
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        
        List<GetSetProducts> list = new ArrayList<GetSetProducts>();
        
        try {
            
            String query = "SELECT * FROM tbl_products";
            ps = con.prepareStatement(query); 
            rs=ps.executeQuery();
            
            while(rs.next()){
                GetSetProducts products = new GetSetProducts();
                products.setProductID(rs.getInt("id"));
                products.setSellerID(rs.getInt("seller_id"));
                products.setBrand(rs.getString("brand"));
                products.setModel(rs.getString("model"));
                products.setType(rs.getString("type"));
                products.setQty(rs.getInt("qty"));
                products.setPrice(rs.getInt("price"));
                products.setSale_percentage(rs.getFloat("sale_percentage"));
                products.setShippingFee(rs.getInt("shipping_fee"));
                products.setRating(rs.getInt("rating"));
                products.setFileDir(rs.getString("file_dir"));
                list.add(products);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
            
    }
    
    public List<GetSetProducts> selectSearchProduct(String searchQuery){
        
        Connection con  = getConnection();
        
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        
        List<GetSetProducts> list = new ArrayList<GetSetProducts>();
        
        try {
            
            String query = "SELECT * FROM tbl_products WHERE brand LIKE ? OR model LIKE ? OR type LIKE ? OR price LIKE ?";
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + searchQuery + "%");
            ps.setString(2, "%" + searchQuery + "%");
            ps.setString(3, "%" + searchQuery + "%");
            ps.setString(4, "%" + searchQuery + "%");
            rs=ps.executeQuery();
            
            while(rs.next()){
                GetSetProducts products = new GetSetProducts();
                products.setProductID(rs.getInt("id"));
                products.setSellerID(rs.getInt("seller_id"));
                products.setBrand(rs.getString("brand"));
                products.setModel(rs.getString("model"));
                products.setType(rs.getString("type"));
                products.setQty(rs.getInt("qty"));
                products.setPrice(rs.getInt("price"));
                products.setSale_percentage(rs.getFloat("sale_percentage"));
                products.setShippingFee(rs.getInt("shipping_fee"));
                products.setRating(rs.getInt("rating"));
                products.setFileDir(rs.getString("file_dir"));
                list.add(products);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
            
    }
    public String Seller(int seller){
        
        Connection con = getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String productSeller = "";
        try{
            String query = "SELECT * FROM `tbl_user` WHERE `id`=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, seller);
            rs=ps.executeQuery();
            if(rs.next()){
                return productSeller = rs.getString("uname");
            }else{
                return productSeller = "";
            }
            
        
        }catch (Exception e){
            System.out.print(e);
        }        
        
        return productSeller;
        
    }

    public int getBuyerId(String buyer) {
        Connection con = getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        int buyerID = 0;
        try{
            String query = "SELECT * FROM `tbl_user` WHERE `uname`=?";
            ps = con.prepareStatement(query);
            ps.setString(1, buyer);
            rs=ps.executeQuery();
            if(rs.next()){
               buyerID = rs.getInt("id");
            }else{
               buyerID = 0;
            }
            
        
        }catch (Exception e){
            System.out.print(e);
        }        
        
        return buyerID;
    }

    public int getProduct(String model, String price, String qty, String rating, String seller) {
        Connection con = getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        int productID = 0;
        try{
            String query = "SELECT * FROM `tbl_products` WHERE `seller_id`=? AND `model`=? AND `price`=? AND `qty`=? AND `rating`=?";
            ps = con.prepareStatement(query);
            ps.setString(1, seller);
            ps.setString(2, model);
            ps.setString(3, price);
            ps.setString(4, qty);
            ps.setString(5, rating);
            rs=ps.executeQuery();
            if(rs.next()){
                productID = rs.getInt("id");
            }else{
                productID = 0;
            }
            
        
        }catch (Exception e){
            System.out.print(e);
        }        
        
        return productID;
    }

    public void addToCart(int buyerID, int productID) {
        Connection con = getConnection();
        PreparedStatement ps = null;
        
        try {
            String query = "INSERT INTO tbl_cart(buyer_id,product_id,qty) values(?,?,?)";
            ps = con.prepareStatement(query);
            ps.setInt(1, buyerID);
            ps.setInt(2, productID);
            ps.setInt(3, 1);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public int CheckToCart(int buyerID, int productID) {
         Connection con  = getConnection();
        
        
        PreparedStatement ps = null;
        ResultSet rs = null;
        int res = 0;
        
        try {
            
            String query = "SELECT * FROM `tbl_cart` WHERE `buyer_id`=? AND `product_id`=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, buyerID);
            ps.setInt(2, productID);
            rs=ps.executeQuery();
            
            if(rs.next()){
                return res = 1;
            }else{
                return res = 0 ;
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return res;
    }

    public void updateToCart(int buyerID, int productID) {
        Connection con = getConnection();
        PreparedStatement ps = null;
        try {
            String query = "UPDATE tbl_cart SET qty= qty + 1 WHERE buyer_id=? AND product_id=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, buyerID);
            ps.setInt(2, productID);
            
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void insertPurchase(String prodID, String seller, int buyer, String qty, String shipping, String cod, int total, String i) {
        Connection con = getConnection();
        PreparedStatement ps = null;
        
        try {
            String query = "INSERT INTO tbl_transactions(product_id,seller_id,buyer_id,qty,shipping_fee,payment_mode,total_payment,status) VALUES(?,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(query);
            ps.setString(1, prodID);
            ps.setString(2, seller);
            ps.setInt(3, buyer);
            ps.setString(4, qty);
            ps.setString(5, shipping);
            ps.setString(6, cod);
            ps.setInt(7, total);
            ps.setString(8, i);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteCartItem(int BuyerID, String prodID) {
        Connection con = getConnection();
        PreparedStatement ps = null;
        try {
            String query = "DELETE FROM tbl_cart WHERE buyer_id=? AND product_id=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, BuyerID);
            ps.setString(2, prodID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateTransactions(String prodID, String seller, String shipping, int buyerID) {
        Connection con = getConnection();
        PreparedStatement ps = null;
        try {
            String query = "UPDATE tbl_transactions SET status=2 WHERE product_id=? AND buyer_id=? AND seller_id=? AND shipping_fee=?";
            ps = con.prepareStatement(query);
            ps.setString(1, prodID);
            ps.setInt(2, buyerID);
            ps.setString(3, seller);
            ps.setString(4, shipping);
            
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void cancelOrder(String prodID, String seller, String shipping, int buyerID) {
        Connection con = getConnection();
        PreparedStatement ps = null;
        try {
            String query = "DELETE FROM tbl_transactions WHERE buyer_id=? AND product_id=? AND seller_id=? AND shipping_fee=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, buyerID);
            ps.setString(2, prodID);
            ps.setString(3, seller);
            ps.setString(4, shipping);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void confirmOrders(String prodID) {
       Connection con = getConnection();
        PreparedStatement ps = null;
        try {
            String query = "UPDATE tbl_transactions SET status=? WHERE product_id=? ";
            ps = con.prepareStatement(query);
            ps.setString(1, "1");
            ps.setString(2, prodID);
            
            
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void search(String search) {
        
    }

    
    

   
    
    
    
}
