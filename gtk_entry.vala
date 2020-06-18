/* A window in the application. */
class MyWindow : Gtk.ApplicationWindow {

	/* Constructor */
	internal MyWindow (MyApplication app) {
		Object (application: app, title: "What is your name?");

		var name_box = new Gtk.Entry ();

		/* Connect to the signal handler. */
		name_box.activate.connect (this.on_activate);
		name_box.show ();

		this.set_default_size (300, 100);
		this.border_width = 10;

		/* Add the name_box to this window. */
		this.add (name_box);
	}

	/* Signal handler (aka. callback function) for the 'activate'
	 * signal of a Gtk.Entry.
	 */
	void on_activate (Gtk.Entry entry) {
		name = entry.get_text ();
		print ("\nHello " + name + "!\n\n");
	}
}

/* This is the application. */
class MyApplication : Gtk.Application {

	/* Constructor for the application. */
	internal MyApplication () {
		Object (application_id: "org.example.MyApplication");
	}

	/* Override the 'activate' signal of GLib.Application. */
	protected override void activate () {

		/* Create a new window for this application
		 * and show it. */
		new MyWindow (this).show ();
	}

}

/* The main function creates and runs the application. */
int main (string[] args) {
	return new MyApplication ().run (args);
}
