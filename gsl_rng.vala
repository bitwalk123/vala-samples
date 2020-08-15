#!/usr/bin/env vala

using GLib;
using Gsl;

public class RNGSample : GLib.Object {
    public static void main (string[] args) {
        RNGType* T;
        RNG r;
                
        int i, n = 10;
                
        RNG.env_setup ();
                
        T = (RNGType*) RNGTypes.default;
        r = new RNG (T);
                
        for (i = 0; i < n; i++) {
            double u = r.uniform ();
            stdout.printf ("%d %.5f\n", i, u);
        }
    }
}