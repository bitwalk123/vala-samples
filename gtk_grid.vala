#!/usr/bin/env vala

public class MyGrid : Gtk.Window {

    public MyGrid () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "Grid";
        this.border_width = 0;
        this.window_position = Gtk.WindowPosition.CENTER;

        var but0 = new Gtk.Button.with_label ("０");
        var but1 = new Gtk.Button.with_label ("１");
        var but2 = new Gtk.Button.with_label ("２");
        var but3 = new Gtk.Button.with_label ("３");
        var but4 = new Gtk.Button.with_label ("４");
        var but5 = new Gtk.Button.with_label ("５");
        var but6 = new Gtk.Button.with_label ("６");
        var but7 = new Gtk.Button.with_label ("７");
        var but8 = new Gtk.Button.with_label ("８");
        var but9 = new Gtk.Button.with_label ("９");

        var grid = new Gtk.Grid();
        this.add(grid);

        grid.attach(but0, 0, 0, 1, 1);
        grid.attach(but1, 1, 0, 1, 1);
        grid.attach(but2, 2, 0, 1, 1);
        grid.attach(but3, 3, 0, 1, 1);

        grid.attach(but4, 0, 1, 1, 1);
        grid.attach(but5, 1, 1, 1, 1);
        grid.attach(but6, 2, 1, 1, 1);
        grid.attach(but7, 3, 1, 1, 2);

        grid.attach(but8, 0, 2, 2, 1);
        grid.attach(but9, 2, 2, 1, 1);
    }
}

public static int main (string[] args) {
    Gtk.init (ref args);

    MyGrid app = new MyGrid ();
    app.show_all ();
    Gtk.main ();
    return 0;
}
