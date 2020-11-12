/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.action.web;

import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.context.ConnectDB;
import edu.fpt.dao.CustomerDAO;
import edu.fpt.entity.Customer;
import edu.fpt.service.CustomerMapping;

/**
 *
 * @author MrEnd
 */
public class ChangePassword extends ActionSupport {
    String cno, cpass, recpass;

    public String changePassword(){
        ConnectDB db = new ConnectDB();
        Customer cus = CustomerMapping.getCustomer(db,cno);
        cus.setCpass(cpass);
        CustomerMapping.changePassword(db,cus);
        db.closeConnection();
        return SUCCESS;
    }

    @Override
    public void validate() {
        if(!cpass.matches("\\w+")  || cpass.length()<8 || cpass.length()>16){
            addFieldError("cpassField", "Password must be 8-16 characters and do not contain special characters");
        } else if(!cpass.equals(recpass)){
            addFieldError("recpassField", "Re-password must be same as password");
        }
    }

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public String getCpass() {
        return cpass;
    }

    public void setCpass(String cpass) {
        this.cpass = cpass;
    }

    public String getRecpass() {
        return recpass;
    }

    public void setRecpass(String recpass) {
        this.recpass = recpass;
    }
}
