/* A window in the application */
class MyWindow : Gtk.ApplicationWindow {

	/* An instance array of linux distributions belonging to this window. */
	string[] distros = {"Select distribution", "Fedora", "Mint", "Suse"};

	/* This enum makes the code more readable when we refer to
	 * the column as Column.DISTRO, instead of just 0.
	 */
	enum Column {
		DISTRO
	}

	/* Constructor */
	internal MyWindow (MyApplication app) {
		Object (application: app, title: "Welcome to GNOME");

		this.set_default_size (200, -1);
		this.border_width = 10;

		Gtk.ListStore liststore = new Gtk.ListStore (1, typeof (string));

		for (int i = 0; i < distros.length; i++){
			Gtk.TreeIter iter;
			liststore.append (out iter);
			liststore.set (iter, Column.DISTRO, distros[i]);
		}

		Gtk.ComboBox combobox = new Gtk.ComboBox.with_model (liststore);
		Gtk.CellRendererText cell = new Gtk.CellRendererText ();
		combobox.pack_start (cell, false);

		combobox.set_attributes (cell, "text", Column.DISTRO);

		/* Set the first item in the list to be selected (active). */
		combobox.set_active (0);

		/* Connect the 'changed' signal of the combobox
		 * to the signal handler (aka. callback function).
		 */
		combobox.changed.connect (this.item_changed);

		/* Add the combobox to this window */
		this.add (combobox);
		combobox.show ();
	}

	/* Signal handler for the 'changed' signal of the combobox. */
	void item_changed (Gtk.ComboBox combo) {
		if (combo.get_active () !=0) {
			print ("You chose " + distros [combo.get_active ()] +"\n");
		}
	}
}

/* This is the application */
class MyApplication : Gtk.Application {

	/* Constructor */
	internal MyApplication () {
		Object (application_id: "org.example.MyApplication");
	}

	/* Override the activate signal of GLib.Application,
	 * which is inherited by Gtk.Application.
	 */
	protected override void activate () {

		/* Create the window of this application
		 * and show it.
		 */
		new MyWindow (this).show ();
	}
}

/* main creates and runs the application */
int main (string[] args) {
	return new MyApplication ().run (args);
}
