#!/usr/bin/env vala

public class MyButton : Gtk.Window {

    public MyButton () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "ボタン";
        this.border_width = 10;
        this.window_position = Gtk.WindowPosition.CENTER;

        var but = new Gtk.Button.with_label ("ボタン");
        but.clicked.connect (this.on_clicked);

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        box.pack_start (but, true, true, 0);
        this.add (box);
	}

    void on_clicked (Gtk.Button button) {
        print ("button was clicked.\n");
	}
}

public static int main (string[] args) {
    Gtk.init (ref args);

    MyButton app = new MyButton ();
    app.show_all ();
    Gtk.main ();
    return 0;
}
