package com.data;

import java.util.List;

import com.model.Expense;

public interface ExpenseDAO {
public List<Expense> getExpenses() throws Exception;
	
//	void addItem(HttpServletRequest request) throws Exception;
	
	void addExpense(Expense expense) throws Exception;
	
	public void deleteExpense(int id) throws Exception;
	
	public List<Expense> searchExpenses(String invoiceId) throws Exception;
	
	public Expense getExpense(int id) throws Exception;
	
	public void updateExpense(Expense expense) throws Exception;

}
