#!/usr/bin/env vala

using GLib;
using Gsl;

public class MultiRootSample : GLib.Object {
    struct RParams {
        public double a;
        public double b;
    }
        
    static int rosenbrock_f (Vector x, void* params, Vector f) {
        double a = ((RParams*) params)->a;
        double b = ((RParams*) params)->b;
                
        double x0 = x.get (0);
        double x1 = x.get (1);
                
        double y0 = a * (1 - x0);
        double y1 = b * (x1 - x0 * x0);
        
        f.set (0, y0);
        f.set (1, y1);
                
        return Status.SUCCESS;
    }
        
    static int rosenbrock_df (Vector x, void* params, Matrix J) {
        double a = ((RParams*) params)->a;
        double b = ((RParams*) params)->b;

        double x0 = x.get (0);
        //double x1 = x.get (1);
                
        double df00 = -a;
        double df01 = 0;
        double df10 = -2*b*x0;
        double df11 = b;
                
        J.set (0, 0, df00);
        J.set (0, 1, df01);
        J.set (1, 0, df10);
        J.set (1, 1, df11);
                
        return Status.SUCCESS;
    }
    
    static int rosenbrock_fdf (Vector x, void* params, Vector f, Matrix J) {
        rosenbrock_f (x, params, f);
        rosenbrock_df (x, params, J);
        return Status.SUCCESS;
    }
        
    static void print_state (size_t iter, MultirootFdfsolver s) {
        stdout.printf ("iter = %3u x = % .3f % .3f f(x) = % .3e % .3e\n", (uint)iter, s.x.get (0), s.x.get (1), s.f.get (0), s.f.get (1));
    }
        
    public static void main (string[] args) {
        MultirootFdfsolverType* T;
        MultirootFdfsolver s;
                
        int status = 0;
        size_t iter=0;
                
        size_t n = 2;
                
        RParams p = { 1.0, 10.0 };
        MultirootFunctionFdf f = MultirootFunctionFdf () {
            f = rosenbrock_f, df = rosenbrock_df, fdf = rosenbrock_fdf, n = n, params = &p
        };
                
        double[] x_init = new double[] { -10.0, -5.0 };
        Vector x = new Vector (n);
                
        x.set (0, x_init[0]);
        x.set (1, x_init[1]);
                
        T = (MultirootFdfsolverType*) MultirootFdfsolverTypes.gnewton;
        s = new MultirootFdfsolver (T, n);
        s.set (&f, x);
                
        print_state (iter, s);
                
        do {
            iter++;
            status = s.iterate ();
            print_state (iter, s);
            if ((bool)status) break;
            status = MultirootTest.residual (s.f, 1.0e-7);
        } while (status==Status.CONTINUE && iter < 1000);
    }
}