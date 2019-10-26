package com.jimmy.framework.core.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.jimmy.framework.core.common.utils.ws.ReceiveMessage;
/**
 * websock负责发送信息业务处理
 * @author Jimmy.fang
 *
 */
@Controller
public class SubController {
	
    @Autowired
    public SimpMessagingTemplate template;  
      
    /**
     * 广播模式
     * @param rm
     */
    @MessageMapping("/subscribe")
    public void subscribe(ReceiveMessage rm) {
        for(int i =1;i<=20;i++) {
            //广播使用convertAndSend方法，第一个参数为目的地，和js中订阅的目的地要一致
            template.convertAndSend("/topic/getResponse", rm.getName());
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

    }
    
    /**
     * 点对点模式
     * @param rm
     */
    @MessageMapping("/queue")
    public void queue(ReceiveMessage rm) {
        System.out.println("向zhangsan发送固定信息");
        for(int i =1;i<=20;i++) {
            /*广播使用convertAndSendToUser方法，第一个参数为用户id，此时js中的订阅地址为
            "/user/" + 用户Id + "/message",其中"/user"是固定的*/
            template.convertAndSendToUser("zhangsan","/message",rm.getName());
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

    }
    
    
    /**
     * 点对点模式
     * @param fromUser,toUser
     */
    @MessageMapping("/p2p/{fromUser}/{toUser}")
    public void queueFromUserToUser(ReceiveMessage rm,@DestinationVariable String fromUser,@DestinationVariable String toUser) {
    	 /*广播使用convertAndSendToUser方法，第一个参数为用户id，此时js中的订阅地址为
        "/user/" + 用户Id + "/message",其中"/user"是固定的*/
        template.convertAndSendToUser(toUser,"/message",rm.getName());
    }

}
