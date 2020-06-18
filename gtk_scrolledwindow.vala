/* This is the application. */
public class MyApplication : Gtk.Application {
	/* Override the 'activate' signal of GLib.Application. */
	protected override void activate () {
		/* Create the window of this application. */
		var window = new Gtk.ApplicationWindow (this);
		window.title = "ScrolledWindow Example";
		window.set_default_size (200, 200);

		var scrolled_window = new Gtk.ScrolledWindow (null, null);
		scrolled_window.set_border_width (10);
		scrolled_window.add_with_viewport (new Gtk.Image.from_file ("gnome-image.png"));
		scrolled_window.set_policy (Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC);

		window.add (scrolled_window);
		window.show_all ();
	}
}

/* main creates and runs the application. */
public int main (string[] args) {
	return new MyApplication ().run (args);
}
