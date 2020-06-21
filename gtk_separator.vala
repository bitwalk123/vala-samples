#!/usr/bin/env vala
/* This is the application. */
public class Application : Gtk.Application {

	public Application () {
		Object (application_id: "org.example.window");
	}

	/* Override the 'activate' signal of GLib.Application,
	 * which is inherited by Gtk.Application. */
	public override void activate () {

		var window = new Gtk.Window ();
		window.title = "Separator Example";

		var label1 = new Gtk.Label ("Below, a horizontal separator.");
		var label2 = new Gtk.Label ("On the right, a vertical separator.");
		var label3 = new Gtk.Label ("On the left, a vertical separator.");

		var hseparator = new Gtk.Separator (Gtk.Orientation.HORIZONTAL);
		var vseparator = new Gtk.Separator (Gtk.Orientation.VERTICAL);

		var grid = new Gtk.Grid();

		grid.attach (label1, 0, 0, 3, 1);
		grid.attach (hseparator, 0, 1, 3, 1);
		grid.attach (label2, 0, 2, 1, 1);
		grid.attach (vseparator, 1, 2, 1, 1);
		grid.attach (label3, 2, 2, 1, 1);

		grid.set_column_homogeneous(true);

		window.add (grid);
		this.add_window (window);

		window.show_all ();
	}
}

/* The main function creates the application and runs it.*/
int main (string[] args) {
	var app = new Application ();
	return app.run (args);
}
