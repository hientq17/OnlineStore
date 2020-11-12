/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.action.admin;


import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.context.ConnectDB;
import edu.fpt.dao.CustomerDAO;
import edu.fpt.entity.Customer;
import edu.fpt.service.CustomerMapping;


/**
 *
 * @author Admin
 */
public class AddNewCustomerAction extends ActionSupport{
    private String cno;
    private String cpass;
    private String cname;
    private boolean cgender;
    private String cphone;
    private String caddress;
    private boolean cadmin;

    ConnectDB db = new ConnectDB();
    
    public AddNewCustomerAction() {
    }

    @Override
    public void validate() {
        if(!cno.matches("\\w+")  || cno.length()<8 || cno.length()>16){
            addFieldError("cnoField", "Customer ID must be 8-16 characters and do not contain special characters");
        } else{
                if(CustomerMapping.getCustomer(db,cno)!=null){
                    addFieldError("cnoField", "Customer ID existed");
                }
        }
        if(!cpass.matches("\\w+") || cpass.length()<8 || cpass.length()>16 ){
            addFieldError("cpassField","Customer password must be between 8 and 16 characters");
        }
        System.out.println("TESTT"+cphone+"CPHONE");
        if(cphone!=null && cphone.length()>0){
            if(!cphone.matches("\\d+")){
                addFieldError("cphoneField","Please input customer phone in number format");
            }
        }  
    }
    
    
    public String execute() {
        CustomerMapping.newCustomer(db,new Customer(cno, cpass, cname, cgender, cphone, caddress, cadmin));
        db.closeConnection();
        return SUCCESS;
    }

    public String getCno() {
        return cno;
    }

    public String getCpass() {
        return cpass;
    }

    public String getCname() {
        return cname;
    }

    public boolean isCgender() {
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

    public void setCpass(String cpass) {
        this.cpass = cpass;
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

    public boolean isCadmin() {
        return cadmin;
    }

    public void setCadmin(boolean cadmin) {
        this.cadmin = cadmin;
    }
    
     
    
}
