#!/usr/bin/env vala

using Gtk;

public class About : Gtk.Dialog {

    public About () {
        this.set_icon_name("dialog-information");
        this.set_title("About");
        this.set_resizable(false);
        this.set_modal (true);
        this.add_button ("_OK", Gtk.ResponseType.NONE);

        var content = this.get_content_area ();
        var box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        box.set_spacing (0);
        content.add (box);

        var lab_name = new Gtk.Label ("CSS Example Program");
        lab_name.get_style_context().add_class("appname");
        box.pack_start (lab_name, true, true, 0);

        var lab_ver = new Gtk.Label ("version 0.1");
        lab_ver.get_style_context().add_class("version");
        box.pack_start (lab_ver, true, true, 0);

        var lab_author = new Gtk.Label ("Copyright 2020 Fuhito Suguri");
        lab_author.get_style_context().add_class("author");
        box.pack_start (lab_author, true, true, 0);

        var lab_license = new Gtk.Label ("under MIT License");
        lab_license.get_style_context().add_class("license");
        box.pack_start (lab_license, true, true, 0);
    }
}

public class MyDialog : Gtk.Window {
    public MyDialog () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "Main";
        this.border_width = 0;
        this.window_position = Gtk.WindowPosition.CENTER;

        var but = new Gtk.Button.with_label ("このプログラムについて");
        but.clicked.connect (this.on_clicked);

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        box.pack_start (but, true, true, 0);
        this.add (box);
    }

    void on_clicked (Gtk.Button button) {
        var dialog = new About();
        
        dialog.response.connect (on_response);
        dialog.show_all ();
    }
    
    void on_response (Gtk.Dialog dialog, int response_id) {
        dialog.destroy ();
    }
}

public static int main (string[] args) {
    Gtk.init (ref args);

    var css_provider = new Gtk.CssProvider();
    try {
        css_provider.load_from_path("css_test.css");
    } catch (GLib.Error e) {
        warning ("Style sheet data did not load: %s", e.message);
    }
    Gtk.StyleContext.add_provider_for_screen (
        Gdk.Screen.get_default(),
        css_provider,
        Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
    );
    var app = new MyDialog ();
    app.show_all ();
    Gtk.main ();
    return 0;
}