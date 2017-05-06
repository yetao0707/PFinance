package com.fp;

/**
 * Created by yetao on 17/3/9.
 */
public class Test {

    public static void main(String []args){
        Object[]m=new Object[2];
        double[] t = new double[2];
        t[0]=11;
        t[1]=11;
        m[0]=t;
        System.out.println(m[0]);
        double[] c = (double[]) m[0];


    }
}
