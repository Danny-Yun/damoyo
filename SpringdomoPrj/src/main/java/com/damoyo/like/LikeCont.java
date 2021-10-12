package com.damoyo.like;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.damoyo.domain.PhotolikeVO;

import com.damoyo.mapper.PhotolikeMapper;

@Controller
public class LikeCont {
	
	@Autowired
	@Qualifier("com.damoyo.like.LiketoProc")
	private PhotolikeMapper liketoProc = null;
	
	 public LikeCont() {
		    //System.out.println("--> liketoCont() created");
		  }
		  
		  @SuppressWarnings("unchecked")
		  @ResponseBody
		  @RequestMapping(value="/photo/like", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
		  public String like(Long p_num, HttpSession session){
		    //System.out.println("--> like() created");
		    Long m_num = (Long)session.getAttribute("m_num");
		    JSONObject obj = new JSONObject();

		    ArrayList<String> msgs = new ArrayList<String>();
		    HashMap <String, Object> hashMap = new HashMap<String, Object>();
		    hashMap.put("m_num", m_num);
		   // hashMap.put("mno", mno);
		    PhotolikeVO LikeVO = liketoProc.read(hashMap);
		    
		   
		    Long like_cnt = LikeVO.getP_like_num();
		    Long like_check = 0L;
		    like_check = LikeVO.getP_like_num();
		    
		    if(liketoProc.countbyLike(hashMap)==0){
		      liketoProc.create(hashMap);
		    }
		      
		    if(like_check == 0) {
		      msgs.add("좋아요!");
		      liketoProc.like_check(hashMap);
		      like_check++;
		      like_cnt++;
		      
		    } else {
		      msgs.add("좋아요 취소");
		      liketoProc.like_check_cancel(hashMap);
		      like_check--;
		      like_cnt--;
		      
		    }
		    obj.put("p_like_num", LikeVO.getP_like_num());
		    obj.put("p_num", p_num);
		    obj.put("m_num", m_num);
		    obj.put("msg", msgs);
		    
		    return obj.toJSONString();
			
		   
		  }
}
