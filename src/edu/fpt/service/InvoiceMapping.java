package edu.fpt.service;

import edu.fpt.context.ConnectDB;
import edu.fpt.dao.InvoiceDAO;
import edu.fpt.entity.Invoice;
import edu.fpt.entity.InvoiceDetail;
import java.util.ArrayList;
import java.util.List;

public class InvoiceMapping {

    public static List<Invoice> allInvoices = null;
    static InvoiceDAO dao = new InvoiceDAO();

    public static List<Invoice> getAllInvoices(ConnectDB db){
        if(allInvoices!=null) return allInvoices;
        allInvoices = dao.getAllInvoices(db);
        return allInvoices;
    }

    public static List<Invoice> getInvoices(ConnectDB db, String cno){
        if(allInvoices==null) allInvoices = dao.getAllInvoices(db);
        List<Invoice> listInvoices = new ArrayList<>();
        for(int i=0; i<allInvoices.size(); i++){
            if(allInvoices.get(i).getCno().equals(cno))
                listInvoices.add(allInvoices.get(i));
        }
        return listInvoices;
    }

    public static Invoice getLatestInvoice(ConnectDB db, String cno){
        if(allInvoices==null) allInvoices = dao.getAllInvoices(db);
        for(int i=0; i<allInvoices.size(); i++){
            if(allInvoices.get(i).getCno().equals(cno))
                return allInvoices.get(i);
        }
        return null;
    }

    public static List<Invoice> getAllNotConfirmedInvoices(ConnectDB db){
        if(allInvoices==null) allInvoices = dao.getAllInvoices(db);
        List<Invoice> listInvoices = new ArrayList<>();
        for(int i=0; i<allInvoices.size(); i++){
            if(!allInvoices.get(i).isPaymentStatus())
                listInvoices.add(allInvoices.get(i));
        }
        return listInvoices;
    }

    public static List<InvoiceDetail> getInvoiceDetail(ConnectDB db, int inno) {
        return dao.getInvoiceDetail(db,inno);
    }

    public static void newInvoiceDetail(ConnectDB db, int inno, int ino, int quantity) {
        dao.newInvoiceDetail(db,inno,ino,quantity);
        allInvoices = null;
    }

    public static void newInvoice(ConnectDB db, String cno, String dateSale, boolean paymentStatus) {
        if(dao.newInvoice(db,cno,dateSale,paymentStatus)){
            allInvoices = null;
        }
    }

    public static void removeInvoice(ConnectDB db, int inno){
        if(dao.removeInvoice(db,inno)>0){
            allInvoices = null;
        }
    }

    public static void confirmInvoice(ConnectDB db, int inno, boolean status) {
        if(dao.confirmInvoice(db,inno,status)){
            allInvoices = null;
        }
    }

}
