#!/usr/bin/env vala

using GLib;
using Gsl;

public class Test : GLib.Object {
    public static void main (string[] args) {
        Combination c;
        size_t i;
                
        stdout.printf("All subsets of {0,1,2,3} by size:\n");
        for (i=0; i<=4; i++) {
            c = new Combination.with_zeros (4, i);
            do {
                stdout.printf ("{");
                Combination.fprintf (stdout, c, " %u");
                stdout.printf (" }\n");
            } while (c.next() == Status.SUCCESS);
        }
    }
}