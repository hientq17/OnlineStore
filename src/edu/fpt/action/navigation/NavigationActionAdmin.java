/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.action.navigation;

import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.context.ConnectDB;
import edu.fpt.entity.*;
import edu.fpt.service.CustomerMapping;
import edu.fpt.service.InvoiceMapping;
import edu.fpt.service.ItemMapping;
import edu.fpt.dao.InvoiceDAO;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 *
 * @author MrEnd
 */
public class NavigationActionAdmin extends ActionSupport {

    public String customerPage(){
        HttpServletRequest request = ServletActionContext.getRequest();
        ConnectDB db = new ConnectDB();
        List<Customer> allCustomers = CustomerMapping.getAllCustomers(db);
        request.setAttribute("allCustomers",allCustomers);
        db.closeConnection();
        return SUCCESS;
    }

    public String invoicePage(){
        ConnectDB db = new ConnectDB();
        List<Invoice> listInvoices = InvoiceMapping.getAllInvoices(db);
        db.closeConnection();
        ServletActionContext.getRequest().setAttribute("listInvoices",listInvoices);
        return SUCCESS;
    }
    public String invoiceDetailPage(){
        HttpServletRequest request = ServletActionContext.getRequest();
        ConnectDB db = new ConnectDB();
        int inno = Integer.parseInt(request.getParameter("inno"));
        List<InvoiceDetail> invoiceDetailList = InvoiceMapping.getInvoiceDetail(db,inno);
        request.setAttribute("invoiceDetailList",invoiceDetailList);
        db.closeConnection();
        return SUCCESS;
    }
    public String itemPage(){
        HttpServletRequest request = ServletActionContext.getRequest();
        ConnectDB db = new ConnectDB();
        List<ItemType> allItemTypes = ItemMapping.getAllItemTypes(db);
        List<Item> listItems = ItemMapping.getAllItems(db);
        db.closeConnection();
        request.setAttribute("allItemTypes", allItemTypes);
        request.setAttribute("listItems", listItems);
        return SUCCESS;
    }
    public String itemTypePage(){
        HttpServletRequest request = ServletActionContext.getRequest();
        ConnectDB db = new ConnectDB();
        List<ItemType> allItemTypes = ItemMapping.getAllItemTypes(db);
        db.closeConnection();
        request.setAttribute("allItemTypes", allItemTypes);
        return SUCCESS;
    }
    public String warningPageAdmin(){
        return SUCCESS;
    }
    public String addCustomerPageAdmin(){
        return SUCCESS;
    }
    public String addItemPageAdmin(){
        HttpServletRequest request = ServletActionContext.getRequest();
        ConnectDB db = new ConnectDB();
        List<ItemType> allItemTypes = ItemMapping.getAllItemTypes(db);
        db.closeConnection();
        request.setAttribute("allItemTypes", allItemTypes);
        return SUCCESS;
    }
    public String addItemTypePageAdmin(){
        return SUCCESS;
    }
    public String editCustomerPageAdmin(){
        return SUCCESS;
    }
    public String editItemPageAdmin(){
        HttpServletRequest request = ServletActionContext.getRequest();
        ConnectDB db = new ConnectDB();
        List<ItemType> allItemTypes = ItemMapping.getAllItemTypes(db);
        db.closeConnection();
        request.setAttribute("allItemTypes", allItemTypes);
        return SUCCESS;
    }
    public String editItemTypePageAdmin(){
        return SUCCESS;
    }

}
