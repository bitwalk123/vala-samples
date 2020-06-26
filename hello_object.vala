#!/usr/bin/env vala
using Gtk;

public class HelloWorld : Gtk.Window {

    public HelloWorld () {
		this.destroy.connect (Gtk.main_quit);
        this.title = "Hello, World!";

        this.border_width = 10;
        this.set_default_size (350, 70);
        this.window_position = Gtk.WindowPosition.CENTER;

        var label = new Gtk.Label ("こんにちは、世界！");    
        this.add (label);
    }
}

public static int main (string[] args) {
	Gtk.init (ref args);

	HelloWorld app = new HelloWorld ();
	app.show_all ();
	Gtk.main ();
	return 0;
}
