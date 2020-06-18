/* This is the application. */
public class MyApplication : Gtk.Application {
	Gtk.Label label;

	/* Override the 'activate' signal of GLib.Application. */
	protected override void activate () {
		var window = new Gtk.ApplicationWindow (this);
		window.title = "SpinButton Example";
		window.set_default_size (210, 70);
		window.set_border_width (5);

		var spinbutton = new Gtk.SpinButton.with_range (0, 100, 1);
		spinbutton.set_hexpand (true);

		label = new Gtk.Label ("Choose a number");

		var grid = new Gtk.Grid ();
		grid.attach (spinbutton, 0, 0, 1, 1);
		grid.attach (label, 0, 1, 1, 1);

		spinbutton.value_changed.connect (this.value_changed_cb);

		window.add (grid);
		window.show_all ();
	}

	void value_changed_cb (Gtk.SpinButton spin) {
		label.set_text ("The number you selected is %.0f.".printf (spin.get_value()));
	}
}

/* main creates and runs the application. */
public int main (string[] args) {
	return new MyApplication ().run (args);
}
