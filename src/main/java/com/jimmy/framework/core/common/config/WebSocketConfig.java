package com.jimmy.framework.core.common.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;

/**
 * 通过EnableWebSocketMessageBroker 开启使用STOMP协议来传输基于代理(message broker)的消息,此时浏览器支持使用@MessageMapping 就像支持@RequestMapping一样。
 * springboot实现服务器端消息推送（websocket + sockjs + stomp）
 * https://www.cnblogs.com/hhhshct/p/8849449.html
 */
@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig extends AbstractWebSocketMessageBrokerConfigurer {

    //    /**
//     * endPoint 注册协议节点,并映射指定的URl
//     *
//     * @param registry
//     */
//    @Override
//    public void registerStompEndpoints(StompEndpointRegistry registry) {
//        //注册一个Stomp 协议的endpoint,并指定 SockJS协议。
//        registry.addEndpoint("/endpointWisely").withSockJS();
//    }
//
//    /**
//     * 配置消息代理(message broker)
//     *
//     * @param registry
//     */
//    @Override
//    public void configureMessageBroker(MessageBrokerRegistry registry) {
//        //广播式应配置一个/topic 消息代理
//        registry.enableSimpleBroker("/topic");
//    }
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) { //endPoint 注册协议节点,并映射指定的URl
        //注册一个名字为"endpointChat" 的endpoint,并指定 SockJS协议。   点对点-用
    	//解决跨域问题
        registry.addEndpoint("/webServer").setAllowedOrigins("*").withSockJS();  
        registry.addEndpoint("/queueServer").setAllowedOrigins("*").withSockJS();//注册两个STOMP的endpoint，分别用于广播和点对点  
    }


    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {//配置消息代理(message broker)
        //点对点式增加一个/queue 消息代理
        registry.enableSimpleBroker("/topic","/user");//topic用来广播，user用来实现p2p
    }
}
