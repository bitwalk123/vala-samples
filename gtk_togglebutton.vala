#!/usr/bin/env vala

public class MyToggleButton : Gtk.Window {

    public MyToggleButton () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "トグルボタン";
        this.border_width = 0;
        this.window_position = Gtk.WindowPosition.CENTER;

        var tb1 = new Gtk.ToggleButton.with_label ("トグルボタンＡ");
        tb1.toggled.connect (this.on_toggled);
        var tb2 = new Gtk.ToggleButton.with_label ("トグルボタンＢ");
        tb2.toggled.connect (this.on_toggled);
        var tb3 = new Gtk.ToggleButton.with_label ("トグルボタンＡ");
        tb3.toggled.connect (this.on_toggled);

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        box.pack_start (tb1, true, true, 0);
        box.pack_start (tb2, true, true, 0);
        box.pack_start (tb3, true, true, 0);
        this.add (box);
    }

    void on_toggled (Gtk.ToggleButton tb) {
        if (tb.get_active()) {
            print (tb.get_label() + "は「オン」になりました。\n");
        } else {
            print (tb.get_label() + "は「オフ」になりました。\n");
        }
    }
}

public static int main (string[] args) {
    Gtk.init (ref args);

    MyToggleButton app = new MyToggleButton ();
    app.show_all ();
    Gtk.main ();
    return 0;
}
