#!/usr/bin/env vala

public class MyLabel : Gtk.Window {

    public MyLabel () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "ラベル";
        this.border_width = 10;
        this.window_position = Gtk.WindowPosition.CENTER;

        var lab = new Gtk.Label ("これはラベルです。");

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        box.pack_start (lab, true, true, 0);
        this.add (box);
    }
}

public static int main (string[] args) {
    Gtk.init (ref args);

    MyLabel app = new MyLabel ();
    app.show_all ();
    Gtk.main ();
    return 0;
}

