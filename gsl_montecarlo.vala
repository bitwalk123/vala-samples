#!/usr/bin/env vala

using GLib;
using Gsl;

public class MonteSample : GLib.Object {
    static double exact = 1.3932039296856768591842462603255;

    static double g (double* k, size_t dim, void* params) {
        double A = 1.0 / (Math.PI * Math.PI * Math.PI);
        return A / (1.0 - Math.cos(k[0]) * Math.cos(k[1]) * Math.cos(k[2]));
    }
        
    static void display_results (string title, double result, double error) {
        stdout.printf ("%s ==================\n", title);
        stdout.printf ("result = % .6f\n", result);
        stdout.printf ("sigma  = % .6f\n", error);
        stdout.printf ("exact  = % .6f\n", exact);
        stdout.printf ("error  = % .6f = %.1g sigma\n", result - exact, Math.fabs (result-exact)/error);
    }
        
    public static void main (string[] args) {
        double res, err;
                
        double[] xl = new double[] { 0, 0, 0 };
        double[] xu = new double[] { Math.PI, Math.PI, Math.PI };
                
        RNGType* T;
        RNG r;
                
        MonteFunction G = { g, 3, null};
                
        size_t calls = 500000;
                
        RNG.env_setup ();
                
        T = (RNGType*)RNGTypes.default;
        r = new RNG (T);
                
        {
            MontePlainState s = new MontePlainState (3);
            MontePlainState.integrate (&G, xl, xu, 3, calls, r, s, out res, out err);
            display_results ("plain", res, err);
        }
                
        {
            MonteMiserState s = new MonteMiserState (3);
            MonteMiserState.integrate (&G, xl, xu, 3, calls, r, s, out res, out err);
            display_results ("miser", res, err);
        }
                
        {
            MonteVegasState s = new MonteVegasState (3);
            MonteVegasState.integrate (&G, xl, xu, 3, 10000, r, s, out res, out err);
            display_results ("vegas warm_up", res, err);
            stdout.printf ("converging...\n");
            do {
                MonteVegasState.integrate (&G, xl, xu, 3, calls/5, r, s, out res, out err);
                stdout.printf ("result = % .6f sigma = % .6f chisq/dof = %.1f\n", res, err, s.chisq);
            } while (Math.fabs (s.chisq - 1.0) > 0.5 );
            
            display_results ("vegas final", res, err);
        }
    }
}