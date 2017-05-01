package com.ashvini.dao;

import java.util.List;
import com.ashvini.domain.Question;
import com.ashvini.domain.Subject;

public interface QuestionDao 
{
	public List<Subject> getSubjects();
	public Subject getSubject(int id);
	
	public void saveQuestion(Question question);
	public List<Question> getQuestions();
	public Question getQuestion(int id);
	public void deleteQuestion(int id);
}