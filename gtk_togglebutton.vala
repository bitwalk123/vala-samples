public class MyWindow : Gtk.ApplicationWindow {

	Gtk.Spinner spinner;

	internal MyWindow (MyApplication app) {
		Object (application: app, title: "ToggleButton Example");

		this.set_default_size (300, 300);
		this.border_width = 30;

		/*Spinner*/
		spinner = new Gtk.Spinner ();
		spinner.set_hexpand (true);
		spinner.set_vexpand (true);

		/*ToggleButton*/
		var togglebutton = new Gtk.ToggleButton.with_label ("Start/Stop");
		togglebutton.toggled.connect (toggled_cb);

		/*Grid*/
		var grid = new Gtk.Grid ();
		grid.set_row_homogeneous (false);
		grid.set_row_spacing (15);
		grid.attach (spinner, 0, 0, 1, 1);
		grid.attach (togglebutton, 0, 1, 1, 1);

		this.add (grid);
	}

	void toggled_cb (Gtk.ToggleButton button) {
		if (button.get_active()) {
			spinner.start ();
		}
		else {
			spinner.stop ();
		}
	}
}

public class MyApplication : Gtk.Application {

	protected override void activate () {

		//Show all the things
		new MyWindow (this).show_all ();
	}

	internal MyApplication () {
		Object (application_id: "org.example.spinner");
	}
}

public int main (string[] args) {
	return new MyApplication ().run (args);
}
