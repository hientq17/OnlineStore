/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.action.web;

import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.context.ConnectDB;
import edu.fpt.dao.CartDAO;
import edu.fpt.dao.CustomerDAO;
import edu.fpt.dao.InvoiceDAO;
import edu.fpt.entity.CartItem;
import edu.fpt.entity.Customer;
import edu.fpt.service.CartMapping;
import edu.fpt.service.CustomerMapping;
import edu.fpt.service.InvoiceMapping;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MrEnd
 */
public class CheckoutAction extends ActionSupport {
    String cnoLogin, cphone, caddress, cname;
    List<CartItem> list = new ArrayList<>();
    
    public CheckoutAction() {
    }
    
    public String execute(){
        ConnectDB db = new ConnectDB();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String d = formatter.format(date);
        list = CartMapping.getCart(db,cnoLogin);
        InvoiceMapping.newInvoice(db,cnoLogin, d, false);
        for (CartItem item : list) {
            InvoiceMapping.newInvoiceDetail(db,InvoiceMapping.getLatestInvoice(db,cnoLogin).getInno(),
                    item.getIno(), item.getQuantity());
        }

        CartMapping.removeCart(db,cnoLogin);
        CustomerMapping.editCustomer(db,new Customer(cnoLogin, cname, cphone, caddress));
        db.closeConnection();
        return SUCCESS;
    }    

    public String getCnoLogin() {
        return cnoLogin;
    }

    public void setCnoLogin(String cnoLogin) {
        this.cnoLogin = cnoLogin;
    }

    public String getCphone() {
        return cphone;
    }

    public String getCaddress() {
        return caddress;
    }

    public String getCname() {
        return cname;
    }

    public void setCphone(String cphone) {
        this.cphone = cphone;
    }

    public void setCaddress(String caddress) {
        this.caddress = caddress;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }
    
    
}
