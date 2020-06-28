#!/usr/bin/env vala

public class MyIconView : Gtk.Window {
    
    string[] icons = {"edit-cut", "edit-paste", "edit-copy"};

    public MyIconView () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "アイコンビュー";
        this.border_width = 0;
        this.window_position = Gtk.WindowPosition.CENTER;

        Gtk.ListStore liststore = new Gtk.ListStore (2, typeof (Gdk.Pixbuf), typeof (string));
        Gtk.TreeIter iter;
        for (int i = 0; i < icons.length; i++) {
            try {
                Gdk.Pixbuf pixbuf = Gtk.IconTheme.get_default().load_icon(icons[i], 32, 0);
                liststore.append (out iter);
                liststore.set (iter, 0, pixbuf, 1, icons[i]);
            } catch (GLib.Error e) {
                warning (e.message);
            }
        } 
        var iconview = new Gtk.IconView();
        iconview.set_model (liststore);
        iconview.set_pixbuf_column(0);
        iconview.set_text_column(1);

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        box.pack_start (iconview, true, true, 0);
        this.add (box);
    }
}

public static int main (string[] args) {
    Gtk.init (ref args);

    MyIconView app = new MyIconView ();
    app.show_all ();
    Gtk.main ();
    return 0;
}
