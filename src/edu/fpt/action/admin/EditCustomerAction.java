/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.action.admin;

import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.context.ConnectDB;
import edu.fpt.entity.Customer;
import edu.fpt.service.CustomerMapping;

/**
 *
 * @author idnpn
 */
public class EditCustomerAction extends ActionSupport{
    private String cno;
    private String cname;
    private boolean cgender;
    private String cphone;
    private String caddress;

    ConnectDB db = new ConnectDB();
 
    public EditCustomerAction() {
    }
    
    public String execute() {
        Customer cus = CustomerMapping.getCustomer(db,cno);
        cus.setCname(cname);
        cus.setCgender(cgender);
        cus.setCphone(cphone);
        cus.setCaddress(caddress);
        CustomerMapping.editCustomer(db,cus);
        db.closeConnection();
        return SUCCESS;

    }

    @Override
    public void validate() { 
        if(cphone!=null && cphone.length()>0){
            if(!cphone.matches("\\d+")){
                addFieldError("cphoneField","Please input customer phone in number format");
            }
        }  
    }

    public String getCno() {
        return cno;
    }

    public String getCname() {
        return cname;
    }

    public boolean getCgender() {
        return cgender;
    }

    public String getCphone() {
        return cphone;
    }

    public String getCaddress() {
        return caddress;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public void setCgender(boolean cgender) {
        this.cgender = cgender;
    }

    public void setCphone(String cphone) {
        this.cphone = cphone;
    }

    public void setCaddress(String caddress) {
        this.caddress = caddress;
    }
    
}
