#!/usr/bin/env vala

public class MyLinkButton : Gtk.Window {

    public MyLinkButton () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "リンクボタン";
        this.border_width = 0;
        this.window_position = Gtk.WindowPosition.CENTER;

        var lb = new Gtk.LinkButton.with_label (
            "https://wiki.gnome.org/Projects/Vala",
            "Valaのプロジェクトサイトへリンク"
        );

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        box.pack_start (lb, true, true, 0);
        this.add (box);
    }
}

public static int main (string[] args) {
    Gtk.init (ref args);

    MyLinkButton app = new MyLinkButton ();
    app.show_all ();
    Gtk.main ();
    return 0;
}
