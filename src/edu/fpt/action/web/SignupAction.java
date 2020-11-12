/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.action.web;

import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.context.ConnectDB;
import edu.fpt.entity.Customer;
import edu.fpt.service.CustomerMapping;

/**
 *
 * @author MrEnd
 */
public class SignupAction extends ActionSupport {
    String cnoLogin, cpass, recpass, cname, cgender;

    ConnectDB db = new ConnectDB();

    public SignupAction() {
    }
    
    public String execute(){
        Customer cus = new Customer();
        cus.setCno(cnoLogin);
        cus.setCpass(cpass);
        cus.setCname(cname);
        cus.setCgender(cgender.equals("Male"));
        cus.setCadmin(false);
        CustomerMapping.newCustomer(db,cus);
        db.closeConnection();
        return SUCCESS;

    }

    @Override
    public void validate() {
        if(!cnoLogin.matches("\\w+") || cnoLogin.length()<8 || cnoLogin.length()>16){
            addFieldError("cnoLoginField","ID must be 8-16 characters and do not contain special characters");
        } else{
            Customer c = CustomerMapping.getCustomer(db,cnoLogin);
            if(c!=null){
                addFieldError("cnoLoginField","This ID existed");
            }
        }
        if(!cpass.matches("\\w+") || cpass.length()<8 || cpass.length()>16){
            addFieldError("cpassField","Password must be 8-16 charaters and do not contain special characters");
        } else if(!cpass.equals(recpass)){         
            addFieldError("repeatCpassField","Your password and confirmation password do not match");  
        }
    }

    public String getCnoLogin() {
        return cnoLogin;
    }

    public String getCpass() {
        return cpass;
    }

    public String getRecpass() {
        return recpass;
    }

    public String getCname() {
        return cname;
    }

    public String getCgender() {
        return cgender;
    }

    public void setCnoLogin(String cnoLogin) {
        this.cnoLogin = cnoLogin;
    }

    public void setCpass(String cpass) {
        this.cpass = cpass;
    }

    public void setRecpass(String recpass) {
        this.recpass = recpass;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public void setCgender(String cgender) {
        this.cgender = cgender;
    }
    
    
}
