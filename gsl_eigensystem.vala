#!/usr/bin/env vala

using GLib;
using Gsl;

public class Test : GLib.Object {
    public static void main (string[] args) {
        double[] data = new double[] {
            1.0  , 1/2.0, 1/3.0, 1/4.0,
            1/2.0, 1/3.0, 1/4.0, 1/5.0,
            1/3.0, 1/4.0, 1/5.0, 1/6.0,
            1/4.0, 1/5.0, 1/6.0, 1/7.0
        };

        MatrixView m = MatrixView.array (data, 4, 4);
                
        Vector eval = new Vector (4);
        Matrix evec = new Matrix (4, 4);
                
        EigenSymmvWorkspace w = new EigenSymmvWorkspace (4);
                
        w.init ((Matrix)(&m.matrix), eval, evec);
                
        EigenSort.symmv_sort (eval, evec, EigenSortType.ABS_ASC);
                
        for (int i=0; i<4; i++) {
            double eval_i = eval.get (i);
            VectorView evec_i = evec.column (i);
                        
            stdout.printf("eigenvalue = %g\n", eval_i);
            stdout.printf("eigenvector = \n");
            Vector.fprintf(stdout, (Vector)(&evec_i.vector), "%g");
        }
    }
}