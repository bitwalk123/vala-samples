#!/usr/bin/env vala
using Gtk;

public class HelloWorld : Gtk.Application {

	public HelloWorld () {
		Object (application_id: "org.example.helloworld");
	}

	protected override void activate () {

		var win = new Gtk.Window ();
		win.title = "Hello, World!";

		win.border_width = 10;
		win.set_default_size (350, 70);
		win.window_position = Gtk.WindowPosition.CENTER;
		this.add_window (win);

        var label = new Gtk.Label ("こんにちは、世界！");    
        win.add (label);

        win.show_all ();
	}
}

/* The main function creates the application and runs it.*/
int main (string[] args) {
	var app = new HelloWorld ();
	return app.run (args);
}