#!/usr/bin/env vala

public class MySpinner : Gtk.Window {

    Gtk.Spinner spin;

    public MySpinner () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "スピナー";
        this.border_width = 0;
        this.window_position = Gtk.WindowPosition.CENTER;

        var tb = new Gtk.ToggleButton.with_label ("開始");
        tb.toggled.connect (this.on_toggled);
        spin = new Gtk.Spinner ();
        spin.set_size_request (50, 50);

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
        box.pack_start (tb, true, true, 0);
        box.pack_start (spin, true, true, 0);
        this.add (box);
    }

    void on_toggled (Gtk.ToggleButton toggle) {
        if (toggle.get_active())
            spin.start ();
        else
            spin.stop ();
    }
}

public static int main (string[] args) {
    Gtk.init (ref args);

    MySpinner app = new MySpinner ();
    app.show_all ();
    Gtk.main ();
    return 0;
}
