/* A window in the application */
class MyWindow : Gtk.ApplicationWindow {

	/* The constructor */
	internal MyWindow (MyApplication app) {
		Object (application: app, title: "チェックボタン");

		this.set_default_size (300, 100);
		this.border_width = 10;

		var checkbutton = new Gtk.CheckButton.with_label ("タイトルの表示");

		/* Connect the checkbutton to the
		 * callback function (aka. signal handler).
		 */
		checkbutton.toggled.connect (this.toggled_cb);

		/* Add the button to the this window */
		this.add (checkbutton);

		checkbutton.set_active (true);
		checkbutton.show ();
	}

	/* The signal handler for the 'toggled' signal of the checkbutton. */
	void toggled_cb (Gtk.ToggleButton checkbutton) {
		if (checkbutton.get_active())
			this.set_title ("CheckButton Example");
		else
			this.set_title ("");
	}
}

/* This is the application */
class MyApplication : Gtk.Application {

	/* The constructor */
	internal MyApplication () {
		Object (application_id: "org.example.checkbutton");
	}

	/* Override the activate signal of GLib.Application */
	protected override void activate () {
		new MyWindow (this).show ();
	}

}

/* main creates and runs the application */
int main (string[] args) {
	return new MyApplication ().run (args);
}
