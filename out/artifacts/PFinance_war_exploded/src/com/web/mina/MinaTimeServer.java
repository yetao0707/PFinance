package com.web.mina;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.charset.Charset;

import org.apache.mina.core.service.IoAcceptor;
import org.apache.mina.core.session.IdleStatus;
import org.apache.mina.filter.codec.ProtocolCodecFilter;
import org.apache.mina.filter.codec.prefixedstring.PrefixedStringCodecFactory;
import org.apache.mina.filter.codec.textline.TextLineCodecFactory;
import org.apache.mina.filter.logging.LoggingFilter;
import org.apache.mina.transport.socket.nio.NioSocketAcceptor;
public class MinaTimeServer {
	
	private static final int PORT = 41140;

    /** 
     * @param args 
     * @throws IOException 
     */  
    public static void main(String[] args) throws IOException {  
        // 服务器端的主要对象  
        IoAcceptor acceptor = new NioSocketAcceptor();  
          
        // 设置Filter链   
        acceptor.getFilterChain().addLast("logger", new LoggingFilter());  
        // 协议解析，采用mina现成的UTF-8字符串处理方式  
        //acceptor.getFilterChain().addLast("codec", new ProtocolCodecFilter(new TextLineCodecFactory(Charset.forName("UTF-8")))); 

		//设定过滤器一行行(/r/n)的读取数据
        acceptor.getFilterChain().addLast("mychin", new ProtocolCodecFilter(new PrefixedStringCodecFactory(Charset.forName("UTF-8"))  ));
          
        // 设置消息处理类（创建、关闭Session，可读可写等等，继承自接口IoHandler）  
        acceptor.setHandler(new TimeServerHandler() );  
        // 设置接收缓存区大小  
        acceptor.getSessionConfig().setReadBufferSize(2048000);  
        acceptor.getSessionConfig().setReadBufferSize(2048000);
        acceptor.getSessionConfig().setIdleTime(IdleStatus.BOTH_IDLE, 30);  

        // 服务器开始监听  
        acceptor.bind( new InetSocketAddress(PORT) );  
 
    }  
  
} 


