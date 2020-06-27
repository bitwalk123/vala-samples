#!/usr/bin/env vala

public class MyRadioButton : Gtk.Window {

    public MyRadioButton () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "ラジオボタン";
        this.border_width = 0;
        this.window_position = Gtk.WindowPosition.CENTER;

        var rb1 = new Gtk.RadioButton(null);
        rb1.set_label("ラジオボタンＡ");
        rb1.toggled.connect (this.on_toggled);
        var rb2 = new Gtk.RadioButton.with_label (rb1.get_group(), "ラジオボタンＢ");
        rb2.toggled.connect (this.on_toggled);
        var rb3 = new Gtk.RadioButton.with_label (rb1.get_group(), "ラジオボタンＣ");
        rb3.toggled.connect (this.on_toggled);

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        box.pack_start (rb1, true, true, 0);
        box.pack_start (rb2, true, true, 0);
        box.pack_start (rb3, true, true, 0);
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

    MyRadioButton app = new MyRadioButton ();
    app.show_all ();
    Gtk.main ();
    return 0;
}
