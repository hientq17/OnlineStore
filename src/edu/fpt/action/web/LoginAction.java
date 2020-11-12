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
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author MrEnd
 */
public class LoginAction extends ActionSupport {
    String cnoLogin, cpass;
    boolean cadminLogin;
    Customer cus;
    
    public LoginAction() {        
    }
    
    public String login() {
        ServletActionContext.getRequest().getSession().setAttribute("cnoLogin",cnoLogin);
        if(cus.isCadmin()) {
            cadminLogin = true;
            ServletActionContext.getRequest().getSession().setAttribute("cadminLogin",cadminLogin);
            return "admin";
        }
        else {
            cadminLogin = false;
            ServletActionContext.getRequest().getSession().setAttribute("cadminLogin",cadminLogin);
            return "web";
        }
    }

    @Override
    public void validate() {
        ConnectDB db = new ConnectDB();
        cus = CustomerMapping.getCustomer(db,cnoLogin);
        db.closeConnection();
        if (cus == null) {
            addFieldError("cnoLogin", "This account doesn't exist");
        } else if (!cus.getCpass().equals(cpass)) {
            addFieldError("cnoLogin", "Wrong password");
        }
    }

    public String getCnoLogin() {
        return cnoLogin;
    }

    public String getCpass() {
        return cpass;
    }

    public void setCnoLogin(String cnoLogin) {
        this.cnoLogin = cnoLogin;
    }

    public void setCpass(String cpass) {
        this.cpass = cpass;
    }

    public boolean isCadminLogin() {
        return cadminLogin;
    }

    public void setCadminLogin(boolean cadminLogin) {
        this.cadminLogin = cadminLogin;
    }
    
}
