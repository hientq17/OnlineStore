/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.action.ajax;

import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.context.ConnectDB;
import edu.fpt.dao.InvoiceDAO;
import edu.fpt.entity.Invoice;
import edu.fpt.service.InvoiceMapping;
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
public class InvoiceAdminAction extends ActionSupport {
    List<Invoice> listInvoices = new ArrayList<>();
    String varConfirm, dateFrom, dateTo;

    ConnectDB db = new ConnectDB();

    public String getList() throws ParseException {
        listInvoices();
        return SUCCESS;
    }

    public String confirm() throws ParseException {
        String inno = ServletActionContext.getRequest().getParameter("inno");
        InvoiceMapping.confirmInvoice(db, Integer.parseInt(inno), true);
        listInvoices();
        db.closeConnection();
        return SUCCESS;
    }

    public void listInvoices() throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        List<Invoice> listTmp = new ArrayList<>();
        if(varConfirm.equals("ON")){
            listTmp = InvoiceMapping.getAllNotConfirmedInvoices(db);
        } else{
            listTmp = InvoiceMapping.getAllInvoices(db);
        }
        long dateSale, dateF, dateT;
        if(dateFrom != null && dateFrom.length()>0 && !dateFrom.equalsIgnoreCase("undefined")
                && dateTo != null && dateTo.length()>0 && !dateTo.equalsIgnoreCase("undefined")){
            for (Invoice invoice : listTmp) {
                dateSale = formatter.parse(invoice.getDateSale()).getTime();
                dateF = formatter.parse(dateFrom).getTime();
                dateT = formatter.parse(this.dateTo).getTime();
                if(dateSale>=dateF && dateSale<=dateT){
                    listInvoices.add(invoice);
                }
            }
        } else if(dateFrom != null && dateFrom.length()>0 && !dateFrom.equalsIgnoreCase("undefined")){
            for (Invoice invoice : listTmp) {
                dateSale = formatter.parse(invoice.getDateSale()).getTime();
                dateF = formatter.parse(dateFrom).getTime();
                dateT = new Date().getTime();
                if(dateSale>=dateF && dateSale<=dateT){
                    listInvoices.add(invoice);
                }
            }
        } else if(dateTo != null && dateTo.length()>0 && !dateTo.equalsIgnoreCase("undefined")){
            for (Invoice invoice : listTmp) {
                dateSale = formatter.parse(invoice.getDateSale()).getTime();
                dateT = formatter.parse(this.dateTo).getTime();
                if(dateSale<=dateT){
                    listInvoices.add(invoice);
                }
            }
        } else{
            listInvoices = listTmp;
        }
        db.closeConnection();
    }

    public List<Invoice> getListInvoices() {
        return listInvoices;
    }

    public void setListInvoices(List<Invoice> listInvoices) {
        this.listInvoices = listInvoices;
    }

    public String getVarConfirm() {
        return varConfirm;
    }

    public void setVarConfirm(String varConfirm) {
        this.varConfirm = varConfirm;
    }

    public String getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(String dateFrom) {
        this.dateFrom = dateFrom;
    }

    public String getDateTo() {
        return dateTo;
    }

    public void setDateTo(String dateTo) {
        this.dateTo = dateTo;
    }
}
