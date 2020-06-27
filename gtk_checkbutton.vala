#!/usr/bin/env vala

public class MyCheckButton : Gtk.Window {

    public MyCheckButton () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "チェックボタン";
        this.border_width = 0;
        this.window_position = Gtk.WindowPosition.CENTER;

        var cb1 = new Gtk.CheckButton.with_label ("チェックボタンＡ");
        cb1.toggled.connect (this.on_toggled);
        var cb2 = new Gtk.CheckButton.with_label ("チェックボタンＢ");
        cb2.toggled.connect (this.on_toggled);
        var cb3 = new Gtk.CheckButton.with_label ("チェックボタンＣ");
        cb3.toggled.connect (this.on_toggled);

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        box.pack_start (cb1, true, true, 0);
        box.pack_start (cb2, true, true, 0);
        box.pack_start (cb3, true, true, 0);
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

    MyCheckButton app = new MyCheckButton ();
    app.show_all ();
    Gtk.main ();
    return 0;
}
