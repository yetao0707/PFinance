package com.util;

import com.mathworks.toolbox.javabuilder.MWException;
import com.yetao.lq.Operation;

import java.io.PrintStream;

/**
 * Created by yetao on 17/4/3.
 */

/*************************************************************************
 *  Compilation:  javac Simplex.java
 *  Execution:    java Simplex
 *
 *  Given an M-by-N matrix A, an M-length vector b, and an
 *  N-length vector c, solve the  LP { max cx : Ax <= b, x >= 0 }.
 *  Assumes that b >= 0 so that x = 0 is a basic feasible solution.
 *
 *  Creates an (M+1)-by-(N+M+1) simplex tableaux with the
 *  RHS in column M+N, the objective function in row M, and
 *  slack variables in columns M through M+N-1.
 *
 *************************************************************************/
/**
 *
 */

public class Simplex {



    // test client
    public static void main(String[] args) {
        try {
            Operation operation = new Operation();
            Object[] result = operation.operation(2, 3);
            System.out.print(result);
        } catch (MWException e) {
            e.printStackTrace();
        }
    }


}
