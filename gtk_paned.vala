/* This is the application. */
public class MyApplication : Gtk.Application {
	/* Override the 'activate' signal of GLib.Application. */
	protected override void activate () {

		var window = new Gtk.ApplicationWindow (this);
		window.title = "Paned Example";
		window.set_default_size (450,350);

		// a new widget with two adjustable panes,
		// one on the left and one on the right
		var paned = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);

		/* two images */
		var image1 = new Gtk.Image ();
		image1.set_from_file ("gnome-image.png");
		var image2 = new Gtk.Image ();
		image2.set_from_file ("tux.png");

		/* add the first image to the left pane */
		paned.add1 (image1);

		/* add the second image to the right pane */
		paned.add2 (image2);

		/* add the panes to the window */
		window.add (paned);
		window.show_all ();
	}
}

/* main creates and runs the application. */
public int main (string[] args) {
	return new MyApplication ().run (args);
}
