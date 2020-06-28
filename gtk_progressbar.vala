#!/usr/bin/env vala

public class MyProgressBar : Gtk.Window {

    Gtk.ProgressBar pbar;

    public MyProgressBar () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "プログレスバー";
        this.border_width = 10;
        this.window_position = Gtk.WindowPosition.CENTER;

        pbar = new Gtk.ProgressBar ();

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        box.pack_start (pbar, true, true, 0);
        this.add (box);

        pbar.set_fraction (0.0);
        GLib.Timeout.add(1000, on_timeout);    
    }

    bool on_timeout () {
        double frac = pbar.get_fraction ();
        frac += 0.1;

        if (frac <= 1.0) {
            pbar.set_fraction (frac);
            return true;
        } else {
            pbar.set_fraction (0.0);
            print("終了しました。\n");
            return false;
        }
    }
}

public static int main (string[] args) {
    Gtk.init (ref args);

    MyProgressBar app = new MyProgressBar ();
    app.show_all ();
    Gtk.main ();
    return 0;
}
