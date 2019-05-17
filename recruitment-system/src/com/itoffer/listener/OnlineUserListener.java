package com.itoffer.listener;

import java.util.Hashtable;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import com.itoffer.bean.User;
import com.itoffer.dao.UserDAO;

import sun.usagetracker.UsageTrackerClient;

/**
 * Application Lifecycle Listener implementation class OnlineUserListener
 * 在线用户监听器
 *
 */
@WebListener
public class OnlineUserListener implements HttpSessionAttributeListener {
    /**
     * Default constructor. 
     */
    public OnlineUserListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionAttributeListener#attributeAdded(HttpSessionBindingEvent)
     */
    @SuppressWarnings("unchecked")
	public void attributeAdded(HttpSessionBindingEvent event){
    	// 监听对象中增加一个属性 
    	// TODO Auto-generated method stub
    	// 判断监听到的是否为记录用户信息的会话域属性
    	if("SESSION_USER".equals(event.getName())){
    		/*//使session生效
	    	LockHelper.putSession(event.getSession());*/
	    	// 获取会话域属性值:当前登录的用户对象
	    	User user = (User) event.getValue();
	    	UserDAO userDAO = new UserDAO();
	    	User userOnline = userDAO.selectById(user.getUserId());
	    	//获取应用上下文对象
	    	ServletContext application = event.getSession().getServletContext();
	    	//获取存放在应用域属性中的在线用户信息列表
	    	// 保存sessionID和user的映射  
	    	Map<Integer,User> onlineUserMap = (Map<Integer,User>)application.getAttribute("ONLINE_USER");
	    	if (onlineUserMap == null)
		    	onlineUserMap = new Hashtable<Integer,User>();
		    // 将当前登录的用户对象存入应用域属性:在线用户信息列表
		    onlineUserMap.put(user.getUserId(),userOnline);
		    application.setAttribute("ONLINE_USER", onlineUserMap);
    	}
    }

	/**
     * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
     */
    public void attributeRemoved(HttpSessionBindingEvent event)  { 
         // TODO Auto-generated method stub
    	/*// 判断监听到的是否为记录用户信息的会话域属性
    	if("SESSION_USER".equals(event.getName())){
	    	// 获取会话域属性值:当前登录的用户对象
	    	User user = (User) event.getValue();
	    	//获取应用上下文对象
	    	ServletContext application = event.getSession().getServletContext();
	    	//获取存放在应用域属性中的在线用户信息列表
	    	// 保存sessionID和user的映射  
	    	Map<Integer,User> onlineUserMap = (Map<Integer,User>)application.getAttribute("ONLINE_USER");
		    // 将当前登录的用户对象存入应用域属性:在线用户信息列表
		    onlineUserMap.remove(user.getUserId(),user);
    	}*/
    }

	/**
     * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
     */
    public void attributeReplaced(HttpSessionBindingEvent event)  { 
         // TODO Auto-generated method stub
    }
	
}
