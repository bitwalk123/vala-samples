#!/usr/bin/env vala

public class MyButton : Gtk.Window {

    public MyButton () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "Icon Button";
        this.border_width = 0;
        this.window_position = Gtk.WindowPosition.CENTER;

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
        this.add (box);

        var but_open = new Gtk.Button.from_icon_name ("document-open", Gtk.IconSize.BUTTON);;
        box.pack_start (but_open, false, true, 0);
        var but_copy = new Gtk.Button.from_icon_name ("edit-copy", Gtk.IconSize.BUTTON);;
        box.pack_start (but_copy, false, true, 0);
        var but_cut = new Gtk.Button.from_icon_name ("edit-cut", Gtk.IconSize.BUTTON);;
        box.pack_start (but_cut, false, true, 0);
        var but_paste = new Gtk.Button.from_icon_name ("edit-paste", Gtk.IconSize.BUTTON);;
        box.pack_start (but_paste, false, true, 0);

        var but_exit = new Gtk.Button.from_icon_name ("application-exit", Gtk.IconSize.BUTTON);;
        box.pack_end (but_exit, false, true, 0);
        var but_info = new Gtk.Button.from_icon_name ("dialog-information", Gtk.IconSize.BUTTON);;
        box.pack_end (but_info, false, true, 0);
    }
}

public static int main (string[] args) {
    Gtk.init (ref args);

    MyButton app = new MyButton ();
    app.show_all ();
    Gtk.main ();
    return 0;
}
