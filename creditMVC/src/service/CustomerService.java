package service;

import java.util.HashMap;
import java.util.Map;



import model.Customer;

public class CustomerService {
	private Map<String, Customer> customerMapId;
	private Map<String, Customer> customerMapPw;
	
	
	public CustomerService() {
		customerMapId = new HashMap<String,Customer>();
		customerMapPw = new HashMap<String,Customer>();
		
		
		addCustomer(new Customer("jmk001","pwjmk001"));
		
	
		
	}

	private void addCustomer(Customer customer) {
		customerMapId.put(customer.getId(), customer);
		customerMapPw.put(customer.getPassword(),customer);
		
		
	}
	public Customer findCustomerId(String id) {
		if(id != null ) 
			return(customerMapId.get(id.toLowerCase()));
		else
			return null;
		
	}
	public Customer findCustomerPw(String password) {
		if(password != null)
			return(customerMapPw.get(password.toLowerCase()));
		else
			return null;
	}
	
			

}
