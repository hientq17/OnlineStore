/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.action.ajax;

import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.context.ConnectDB;
import edu.fpt.dao.CustomerDAO;
import edu.fpt.dao.InvoiceDAO;
import edu.fpt.entity.Customer;
import edu.fpt.entity.Invoice;
import edu.fpt.service.CustomerMapping;
import org.apache.struts2.ServletActionContext;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author MrEnd
 */
public class CustomerAdminAction extends ActionSupport {
    String cno;

    ConnectDB db = new ConnectDB();

    public String removeCustomer(){
        CustomerMapping.removeCustomer(db,cno);
        List<Customer> allCustomers = CustomerMapping.getAllCustomers(db);
        ServletActionContext.getRequest().setAttribute("allCustomers",allCustomers);
        db.closeConnection();
        return SUCCESS;
    }

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }
}
