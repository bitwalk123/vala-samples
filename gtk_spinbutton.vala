#!/usr/bin/env vala

public class MySpinButton : Gtk.Window {

    public MySpinButton () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "スピンボタン";
        this.border_width = 0;
        this.window_position = Gtk.WindowPosition.CENTER;
        
        var sb = new Gtk.SpinButton.with_range (0, 100, 1);
        sb.value_changed.connect (this.value_changed);

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        box.pack_start (sb, true, true, 0);
        this.add (box);
    }

    void value_changed (Gtk.SpinButton spin) {
        print ("値が %.0f に変わりました。\n".printf (spin.get_value()));
    }
}

public static int main (string[] args) {
    Gtk.init (ref args);

    MySpinButton app = new MySpinButton ();
    app.show_all ();
    Gtk.main ();
    return 0;
}
