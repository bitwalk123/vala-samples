#!/usr/bin/env vala
using GLib;
using Gsl;

public class Test : GLib.Object {
    public static void main (string[] args) {
        double[] a_data = new double[] {
            0.18, 0.60, 0.57, 0.96,
            0.41, 0.24, 0.99, 0.58,
            0.14, 0.30, 0.97, 0.66,
            0.51, 0.13, 0.19, 0.85
        };
                
        double[] b_data = new double[] {
            1.0, 2.0, 3.0, 4.0
        };
                
        MatrixView m = MatrixView.array (a_data, 4, 4);
        VectorView b = VectorView.array (b_data);        
        Vector x = new Vector (4);
                
        int s;
                
        Permutation p = new Permutation (4);
                
        LinAlg.LU_decomp ((Matrix)(&m.matrix), p, out s);
        LinAlg.LU_solve ((Matrix)(&m.matrix), p, (Vector)(&b.vector), x);
                
        stdout.printf("x = \n");
        Vector.fprintf(stdout, x, "%g");
    }
}