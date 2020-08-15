#!/usr/bin/env vala

using GLib;
using Gsl;

public class Test : GLib.Object {
    public static void main (string[] args) {
        double mean, max, min;
        double[] data = new double[] { 17.2, 18.1, 16.5, 18.3, 12.6 };

        mean = Stats.mean (data, 1, data.length);
        Stats.minmax (out min, out max, data, 1, data.length);
                
        stdout.printf("promedio %g\n", mean);
        stdout.printf("minimo %g\n", min);
        stdout.printf("maximo %g\n", max);
    }
}
