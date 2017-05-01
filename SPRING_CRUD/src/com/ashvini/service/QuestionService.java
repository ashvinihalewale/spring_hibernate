package com.ashvini.service;

import java.util.List;
import com.ashvini.domain.Question;
import com.ashvini.domain.Subject;

public interface QuestionService 
{
	public List<Subject> getSubjects();
	public Subject getSubject(int id);
	
	public void saveUpdateQuestion(Question question);
	public List<Question> getQuestions();
	public Question getQuestion(int id);
	public void deleteQuestion(int id);
}