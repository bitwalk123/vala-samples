/* This is the application. */
public class MyApplication : Gtk.Application {
	/* Override the 'activate' signal of GLib.Application. */
	protected override void activate () {

		/* Create the window of this application and child widget and show all the things. */
		var window = new Gtk.ApplicationWindow (this);
		window.set_default_size (250, 50);
		window.title = "GNOME LinkButton";

		var linkbutton = new Gtk.LinkButton.with_label ("http://live.gnome.org", "Link to GNOME live!");

		window.add (linkbutton);
		window.show_all ();
	}
}

/* main creates and runs the application. */
public int main (string[] args) {
	return new MyApplication ().run (args);
}
