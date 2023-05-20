package com.data;

import java.util.List;

import com.model.Feedback;

public interface FeedbackDAO {
	
public List<Feedback> getFeedbacks() throws Exception;
	
//	void addItem(HttpServletRequest request) throws Exception;
	
	void addFeedback(Feedback feedback) throws Exception;
	
	public void deleteFeedback(int id) throws Exception;
	
	public List<Feedback> searchFeedback(String fullName) throws Exception;
	
	public Feedback getFeedback(int id) throws Exception;
	
	public void updateFeedback(Feedback feedback) throws Exception;

}
