/*
 * https://developer.gnome.org/gnome-devel-demos/stable/window.vala.html.en
 * /
/* This is the application. */
public class Application : Gtk.Application {

	/* Constructor */
	public Application () {
		Object (application_id: "org.example.window");
	}

	/* Override the 'activate' signal of GLib.Application,
	 * which is inherited by Gtk.Application. */
	public override void activate () {

		var window = new Gtk.Window ();
		window.title = "Welcome to GNOME";

		/* The following 3 lines are included here to introduce
		 * you to ways you can adjust the toplevel window to suit
		 * your needs.  Uncomment them to see what they do.
		 */

		//window.border_width = 10;
		//window.set_default_size (350, 70);
		//window.window_position = Gtk.WindowPosition.CENTER;

		/* Add the window to this application. */
		this.add_window (window);

		/* Show the window. */
		window.show ();
	}
}

/* The main function creates the application and runs it.*/
int main (string[] args) {
	var app = new Application ();
	return app.run (args);
}
