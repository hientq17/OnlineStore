/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.action.ajax;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.context.ConnectDB;
import edu.fpt.dao.InvoiceDAO;
import edu.fpt.dao.ItemDAO;
import edu.fpt.entity.Invoice;
import edu.fpt.entity.Item;
import edu.fpt.service.InvoiceMapping;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 *
 * @author MrEnd
 */
public class InvoiceAction extends ActionSupport {
    int inno;
    List<Invoice> invoiceList = null;

    ConnectDB db = new ConnectDB();

    public String cancelInvoice(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String cno = (String)request.getSession().getAttribute("cnoLogin");
        InvoiceMapping.removeInvoice(db,inno);
        invoiceList = InvoiceMapping.getInvoices(db,cno);
        db.closeConnection();
        return SUCCESS;
    }

    public int getInno() {
        return inno;
    }

    public void setInno(int inno) {
        this.inno = inno;
    }

    public List<Invoice> getInvoiceList() {
        return invoiceList;
    }

    public void setInvoiceList(List<Invoice> invoiceList) {
        this.invoiceList = invoiceList;
    }
}
