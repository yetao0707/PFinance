package com.web.mina;

import java.net.InetSocketAddress;
import java.nio.charset.Charset;

import org.apache.mina.core.future.ConnectFuture;
import org.apache.mina.core.service.IoConnector;
import org.apache.mina.core.session.IoSession;
import org.apache.mina.filter.codec.ProtocolCodecFilter;
import org.apache.mina.filter.codec.prefixedstring.PrefixedStringCodecFactory;
import org.apache.mina.filter.codec.textline.TextLineCodecFactory;
import org.apache.mina.filter.logging.LoggingFilter;
import org.apache.mina.transport.socket.nio.NioSocketConnector;

/**
 * Created by Loftor on 2014/8/15.
 */
public class MinaTimeClient {

	private static final int PORT = 41140;
	
    public static void main(String[] args) {
        IoConnector connector = new NioSocketConnector();
        connector.getFilterChain().addLast( "logger", new LoggingFilter() );
        //connector.getFilterChain().addLast( "codec", new ProtocolCodecFilter( new PrefixedStringCodecFactory(Charset.forName("UTF-8"))));
		//设定过滤器一行行(/r/n)的读取数据
        connector.getFilterChain().addLast("mychin", new ProtocolCodecFilter(new PrefixedStringCodecFactory(Charset.forName("UTF-8"))  ));
        
        connector.setHandler(new TimeClientHander());
        ConnectFuture connectFuture = connector.connect(new InetSocketAddress("127.0.0.1",PORT));
        //等待建立连接
        connectFuture.awaitUninterruptibly();
        System.out.println("连接成功");

        IoSession session = connectFuture.getSession();




        session.write("发中文试一下");
        
        session.write("test");
        

        //关闭
        if(session!=null){
            if(session.isConnected()){
                session.getCloseFuture().awaitUninterruptibly();
            }
            connector.dispose(true);
        }


    }

}
