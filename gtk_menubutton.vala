public class MyWindow : Gtk.ApplicationWindow {

	internal MyWindow (MyApplication app) {
		Object (application: app, title: "MenuButton Example");
		this.set_default_size (600, 400);
		var grid = new Gtk.Grid ();

		var menubutton = new Gtk.MenuButton();
		menubutton.set_size_request (80, 35);

		var menumodel = new Menu ();
		menumodel.append ("New", "app.new");
		menumodel.append ("About", "win.about");

		/* We create the last item as a MenuItem, so that
		 * a submenu can be appended to this menu item.
		 */
		var submenu = new Menu ();
		menumodel.append_submenu ("Other", submenu);
		submenu.append ("Quit", "app.quit");
		menubutton.set_menu_model (menumodel);

		var about_action = new SimpleAction ("about", null);
		about_action.activate.connect (this.about_cb);
		this.add_action (about_action);

		this.add(grid);
		grid.attach(menubutton, 0, 0, 1, 1);
	}

	void about_cb (SimpleAction simple, Variant? parameter) {
		print ("You clicked \"About\"\n");
	}
}

public class MyApplication : Gtk.Application {
	protected override void activate () {
		new MyWindow (this).show_all ();
	}

	internal MyApplication () {
		Object (application_id: "org.example.MyApplication");
	}

	/* Override the 'startup' signal of GLib.Application. */
	protected override void startup () {
		base.startup ();

		var new_action = new SimpleAction ("new", null);
		new_action.activate.connect (this.new_cb);
		this.add_action (new_action);

		var quit_action = new SimpleAction ("quit", null);
		quit_action.activate.connect (this.quit);
		this.add_action (quit_action);
	}

	void new_cb (SimpleAction simple, Variant? parameter) {
		print ("You clicked \"New\"\n");
	}
}

public int main (string[] args) {
	return new MyApplication ().run (args);
}
