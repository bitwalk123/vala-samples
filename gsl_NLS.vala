#!/usr/bin/env vala

using GLib;
using Gsl;

public class FitSample
{
        struct Data
        {
                public size_t n;
                public double* y;
                public double* sigma;
        }
        
        static int expb_f (Vector x, void* data, Vector f)
        {
                size_t n = ((Data*)data)->n;
                double* y = ((Data*)data)->y;
                double* sigma = ((Data*)data)->sigma;
                double A = x.get (0);
                double lambda = x.get (1);
                double b = x.get (2);
                size_t i;
                for (i = 0; i < n; i++)
                {
                        /* Model Yi = A * exp(-lambda * i) + b */
                        double t = i;
                        double Yi = A * Math.exp (-lambda * t) + b;
                        f.set (i, (Yi - y[i])/sigma[i]);
                }
                return Status.SUCCESS;
        }
        
        static int expb_df (Vector x, void* data, Matrix J)
        {
                size_t n = ((Data*)data)->n;
                double* sigma = ((Data*)data)->sigma;
                double A = x.get (0);
                double lambda = x.get (1);
                size_t i;
                
                for (i = 0; i < n; i++)
                {
                        /* Jacobian matrix J(i,j) = dfi / dxj, */
                        /* where fi = (Yi - yi)/sigma[i],        */
                        /*         Yi = A * exp(-lambda * i) + b */
                        /* and the xj are the parameters (A,lambda,b) */
                        double t = i;
                        double s = sigma[i];
                        double e = Math.exp(-lambda * t);
                        J.set (i, 0, e/s);
                        J.set (i, 1, -t * A * e/s);
                        J.set (i, 2, 1/s);
                }
                return Status.SUCCESS;
        }
        
        static int expb_fdf (Vector x, void* data, Vector f, Matrix J)
        {
                expb_f (x, data, f);
                expb_df (x, data, J);
                return Status.SUCCESS;
        }
        
        static void print_state (size_t iter, MultifitFdfsolver s)
        {
                stdout.printf ("iter: %3u x = % 15.8f % 15.8f % 15.8f\n", (uint)iter, s.x.get (0), s.x.get (1), s.x.get (2));
        }
        
        public static void main (string[] args)
        {
                MultifitFdfsolverType* T;
                MultifitFdfsolver s;
                int status = 0;
                uint i, iter = 0;
                size_t n = 40;
                size_t p = 3;
                
                Matrix covar = new Matrix (p, p);
                double[] y = new double[40];
                double[] sigma = new double[40];
                Data d = Data () { n = n, y = y, sigma = sigma};
                
                double[] x_init = new double[] { 1.0, 0.0, 0.0 };
                VectorView x = VectorView.array (x_init);
                
                RNGType* type;
                RNG r;
                
                RNG.env_setup ();
                
                type = (RNGType*)RNGTypes.default;
                r = new RNG (type);
                
                MultifitFunctionFdf f = MultifitFunctionFdf () { f = expb_f, df = expb_df, fdf = expb_fdf, n = n, p = p, params = &d };
                
                for (i = 0; i < n; i++)
                {
                        double t = i;
                        y[i] = 1.0 + 5 * Math.exp (-0.1 * t) + Randist.gaussian (r, 0.1);
                        sigma[i] = 0.1;
                        stdout.printf ("data: %u %g %g\n", i, y[i], sigma[i]);
                }

                T = (MultifitFdfsolverType*)MultifitFdfsolverTypes.lmsder;
                s = new MultifitFdfsolver (T, n, p);
                s.set (&f, (Vector)(&x.vector));
                
                print_state (iter, s);
                
                do
                {
                        iter++;
                        status = s.iterate ();
                        stdout.printf ("status = %s\n", Gsl.Error.strerror (status));
                        print_state (iter, s);
                        if ((bool)status)
                                break;
                        status = MultifitTest.delta (s.dx, s.x, 1e-4, 1e-4);
                } while (status == Status.CONTINUE && iter < 500);
                
                Multifit.covar ((Matrix)(s.J), 0.0, covar);
                
                stdout.printf ("A      = %.5f\n", s.x.get (0));
                stdout.printf ("lambda = %.5f\n", s.x.get (1));
                stdout.printf ("b      = %.5f\n", s.x.get (2));
                stdout.printf ("status = %s\n", Gsl.Error.strerror (status));
        }
}