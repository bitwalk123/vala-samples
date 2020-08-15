#!/usr/bin/env vala

using GLib;
using Gsl;

public class Test : GLib.Object {
    public static void main (string[] args) {
        double x = 5.0;
        Result res;
                
        double expected = -0.17759677131433830434739701;
                
        Bessel.J0_e (x, out res);
                
        stdout.printf("J0(5.0) = %.18f\n+/- %.18f\n", res.val, res.err);
        stdout.printf("exact   = %.18f\n", expected);
    }
}