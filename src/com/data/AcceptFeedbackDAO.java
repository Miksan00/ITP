package com.data;

import java.util.List;

import com.model.Feedback;

public interface AcceptFeedbackDAO {
	
    public List<Feedback> getAcceptFeedbacks() throws Exception;
	public void updateAcceptFeedback(int id) throws Exception;
	public void updateDenyFeedback(int id) throws Exception;

}
