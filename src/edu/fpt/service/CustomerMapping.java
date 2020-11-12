package edu.fpt.service;

import edu.fpt.context.ConnectDB;
import edu.fpt.dao.CustomerDAO;
import edu.fpt.entity.Customer;
import java.util.List;

public class CustomerMapping {

    public static List<Customer> allCustomers = null;
    static CustomerDAO dao = new CustomerDAO();

    public static List<Customer> getAllCustomers(ConnectDB db){
        if(allCustomers!=null) return allCustomers;
        allCustomers = dao.getAllCustomers(db);
        return allCustomers;
    }

    public static Customer getCustomer(ConnectDB db, String cno){
        if(allCustomers==null) allCustomers = dao.getAllCustomers(db);
        for(int i=0; i<allCustomers.size(); i++){
            if(allCustomers.get(i).getCno().equals(cno))
                return allCustomers.get(i);
        }
        return null;
    }

    public static void changePassword(ConnectDB db, Customer cus){
        if(dao.changePassword(db,cus)){
            allCustomers = null;
        }
    }

    public static void newCustomer(ConnectDB db, Customer cus){
        if(dao.newCustomer(db,cus)){
            allCustomers = null;
        }
    }

    public static void editCustomer(ConnectDB db, Customer cus){
        if(dao.editCustomer(db,cus)){
            allCustomers = null;
        }
    }

    public static void removeCustomer(ConnectDB db, String cno){
        if(dao.removeCustomer(db,cno)){
            allCustomers = null;
        }
    }

}
