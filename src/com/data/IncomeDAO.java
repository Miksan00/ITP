package com.data;

import java.util.List;

import com.model.Income;

public interface IncomeDAO {
public List<Income> getIncomes() throws Exception;
	
//	void addItem(HttpServletRequest request) throws Exception;
	
	void addIncome(Income income) throws Exception;
	
	public void deleteIncome(int id) throws Exception;
	
	public List<Income> searchIncomes(String invoiceId) throws Exception;
	
	public Income getIncome(int id) throws Exception;
	
	public void updateIncome(Income income) throws Exception;

}
