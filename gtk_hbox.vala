#!/usr/bin/env vala

public class MyHBox : Gtk.Window {

    public MyHBox () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "HBox";
        this.border_width = 0;
        this.window_position = Gtk.WindowPosition.CENTER;

        var but1 = new Gtk.Button.with_label ("１");
        var but2 = new Gtk.Button.with_label ("２");
        var but3 = new Gtk.Button.with_label ("３");
        var but4 = new Gtk.Button.with_label ("４");

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
        box.pack_start (but1, true, true, 0);
        box.pack_start (but2, true, true, 0);
        box.pack_start (but3, true, true, 0);
        box.pack_start (but4, true, true, 0);
        this.add (box);
    }
}

public static int main (string[] args) {
    Gtk.init (ref args);

    MyHBox app = new MyHBox ();
    app.show_all ();
    Gtk.main ();
    return 0;
}

