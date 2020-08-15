#!/usr/bin/env vala

using GLib;
using Gsl;

public class IntegrationSample : GLib.Object {
    public static double f (double x, double* params) {
        double alpha = *params;
        double f = Math.log (alpha*x) / Math.sqrt(x);
        return f;
    }
        
    public static void main (string[] args) {
        IntegrationWorkspace w = new IntegrationWorkspace (1000);
                
        double integration_result, error;
                
        double expected = -4.0;
        double alpha = 1.0;
                
        Function F = Function () { function = f, params = &alpha };

        Integration.qags (&F, 0, 1, 0, 1e-7, 1000, w, out integration_result, out error);
        stdout.printf ("result          = %.18f\n", integration_result);
        stdout.printf ("exact result    = %.18f\n", expected);
        stdout.printf ("extimated error = %.18f\n", error);
        stdout.printf ("actual error    = %.18f\n", integration_result - expected);
        stdout.printf ("intervals = %i\n", (int)w.size);
    }
}