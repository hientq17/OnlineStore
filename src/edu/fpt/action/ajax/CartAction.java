/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.action.ajax;

import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.context.ConnectDB;
import edu.fpt.entity.CartItem;
import edu.fpt.service.CartMapping;
import org.apache.struts2.ServletActionContext;

import java.util.List;

/**
 *
 * @author MrEnd
 */
public class CartAction extends ActionSupport {
    int ino;
    String cno;
    int quantity;
    double totalCart = 0;
    List<CartItem> listCarts;

    ConnectDB db = new ConnectDB();

    public CartAction() {
    }

    public String addCart(){
        int quan = CartMapping.getQuantityCart(db, cno, ino);
        if(quan>=0){
            CartMapping.editCart(db, cno, ino, quan+quantity);
        } else{
            CartMapping.newCart(db, cno, ino, quantity);
        }
        db.closeConnection();
        return SUCCESS;
    }

    public String updateCart(){
        CartMapping.editCart(db,cno,ino,quantity);
        totalCart = 0;
        listCarts = CartMapping.getCart(db,cno);
        for(int i=0; i<listCarts.size(); i++){
            totalCart += listCarts.get(i).getQuantity()*listCarts.get(i).getUnitPrice();
        }
        db.closeConnection();
        return SUCCESS;
    }

    public String deleteCart() throws Exception {
        CartMapping.removeCart(db, cno, ino);
        totalCart = 0;
        listCarts = CartMapping.getCart(db,cno);
        for(int i=0; i<listCarts.size(); i++){
            totalCart += listCarts.get(i).getQuantity()*listCarts.get(i).getUnitPrice();
        }
        db.closeConnection();
        return SUCCESS;
    }

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public void setIno(int ino) {
        this.ino = ino;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    

    public int getIno() {
        return ino;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getTotalCart() {
        return totalCart;
    }

    public void setTotalCart(double totalCart) {
        this.totalCart = totalCart;
    }

    public List<CartItem> getListCarts() {
        return listCarts;
    }

    public void setListCarts(List<CartItem> listCarts) {
        this.listCarts = listCarts;
    }
}
