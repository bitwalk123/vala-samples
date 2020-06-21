#!/usr/bin/env vala
/* A window in the application */
public class MyWindow : Gtk.ApplicationWindow {

	/* The constructor of the window */
	internal MyWindow (MyApplication app) {
		Object (application: app, title: "GNOME Button");

		var button = new Gtk.Button.with_label ("Click Me");
		button.clicked.connect (this.reverse_label);
		button.show ();

		this.window_position = Gtk.WindowPosition.CENTER;
		this.set_default_size (250,50);
		this.add (button);
	}

	/* The callback function connected to the
	 * 'clicked' signal of the button.
	 */
	void reverse_label (Gtk.Button button) {
		button.label = button.label.reverse ();
	}
}

/* This is the application. */
public class MyApplication : Gtk.Application {

	/* This is the constructor */
	internal MyApplication () {
		Object (application_id: "org.example.MyApplication");
	}

	/* Override the activate signal of GLib.Application */
	protected override void activate () {
		new MyWindow (this).show ();
	}
}

/* main creates and runs the application */
public int main (string[] args) {
	return new MyApplication ().run (args);
}
