#!/usr/bin/env vala

using Gtk;

public class MyNotebook : Gtk.Window {

    public MyNotebook () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "ノートブック";
        this.border_width = 0;

        var notebook = new Gtk.Notebook ();
        this.add (notebook);

        var page1 = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
        var lab1 = new Gtk.Label("文字列がタイトルのページです。");
        page1.add(lab1);
        notebook.append_page(page1, new Gtk.Label("文字列"));
        
        var page2 = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
        var lab2 = new Gtk.Label("イメージがタイトルのページです。");
        page2.add(lab2);
        var image = new Gtk.Image ();
        image.set_from_icon_name ("help-about", Gtk.IconSize.MENU);
        notebook.append_page (page2, image);
    }
}

public static int main (string[] args) {
    Gtk.init (ref args);

    var app = new MyNotebook ();
    app.show_all ();
    Gtk.main ();
    return 0;
}
