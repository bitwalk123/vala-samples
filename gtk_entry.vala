#!/usr/bin/env vala

public class MyEntry : Gtk.Window {

    public MyEntry () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "エントリ";
        this.border_width = 0;
        this.window_position = Gtk.WindowPosition.CENTER;

        var ent = new Gtk.Entry ();
        ent.set_text ("ここは入力欄です。");
        ent.set_max_length (32);
        ent.set_icon_from_icon_name(
            Gtk.EntryIconPosition.PRIMARY,
            "accessories-text-editor"
        );
        ent.activate.connect (this.on_activate);

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        box.pack_start (ent, true, true, 0);
        this.add (box);
    }

    void on_activate (Gtk.Entry entry) {
        print (entry.get_text () + "\n");
    }
}

public static int main (string[] args) {
    Gtk.init (ref args);

    MyEntry app = new MyEntry ();
    app.show_all ();
    Gtk.main ();
    return 0;
}
