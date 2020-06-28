#!/usr/bin/env vala

public class MyTextView : Gtk.Window {

    public MyTextView () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "テキストビュー";
        this.border_width = 0;
        this.window_position = Gtk.WindowPosition.CENTER;
        this.set_default_size (200, 200);

        var scr = new Gtk.ScrolledWindow (null, null);
        scr.set_policy (
            Gtk.PolicyType.AUTOMATIC,
            Gtk.PolicyType.AUTOMATIC
        );

        var tv = new Gtk.TextView ();
        tv.set_wrap_mode (Gtk.WrapMode.WORD);
        scr.add (tv);

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        box.pack_start (scr, true, true, 0);
        this.add (box);
    }
}

public static int main (string[] args) {
    Gtk.init (ref args);

    MyTextView app = new MyTextView ();
    app.show_all ();
    Gtk.main ();
    return 0;
}
