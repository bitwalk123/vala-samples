/* This is the application. */
public class MyApplication : Gtk.Application {
	/* Override the 'activate' signal of GLib.Application. */
	protected override void activate () {
		/* Create the window of this application and show it. */
		var window = new Gtk.ApplicationWindow (this);
		window.title = "Welcome to GNOME";
		window.show ();
	}
}

/* main creates and runs the application. */
public int main (string[] args) {
	return new MyApplication ().run (args);
}
