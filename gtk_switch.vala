class MyWindow : Gtk.ApplicationWindow {

	internal MyWindow (MyApplication app) {
		Object (application: app, title: "Switch Example");

		this.set_default_size (300, 100);
		this.border_width = 10;

		var label = new Gtk.Label ("Title");
		var switcher = new Gtk.Switch ();

		switcher.set_active (true);

		switcher.notify["active"].connect (switcher_cb);

		var grid = new Gtk.Grid ();
		grid.set_column_spacing (10);
		grid.attach (label, 0, 0, 1, 1);
		grid.attach (switcher, 1, 0, 1, 1);

		this.add (grid);
	}

	void switcher_cb (Object switcher, ParamSpec pspec) {
		if ((switcher as Gtk.Switch).get_active())
			this.set_title ("Switch Example");
		else
			this.set_title ("");
	}
}

class MyApplication : Gtk.Application {
	protected override void activate () {

		var window = new MyWindow (this);
		window.show_all (); //show all the things
	}

	internal MyApplication () {
		Object (application_id: "org.example.checkbutton");
	}
}

int main (string[] args) {
	return new MyApplication ().run (args);
}
