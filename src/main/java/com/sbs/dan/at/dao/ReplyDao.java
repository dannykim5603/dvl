package com.sbs.dan.at.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sbs.dan.at.dto.Reply;
@Mapper
public interface ReplyDao {

	List<Reply> getForPrintReplies(Map<String, Object> param);
	
	void writeReply(Map<String, Object> param);
		
	void deleteReply(int id); 
		
	Reply getForPrintReplyById(int id); 

	void modifyReply(Map<String, Object> param); 
		

}
