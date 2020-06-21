#!/usr/bin/env vala
/*
 * https://developer.gnome.org/gnome-devel-demos/stable/statusbar.vala.html.en
 */
public class MyWindow : Gtk.ApplicationWindow {

	Gtk.Statusbar statusbar;
	uint context_id;

	internal MyWindow (MyApplication app) {
		Object (application: app, title: "Statusbar Example");

		statusbar = new Gtk.Statusbar ();
		context_id = statusbar.get_context_id ("example");
		statusbar.push (context_id, "Waiting for you to do something...");

		//set the default size of the window
		this.set_default_size (200, 100);
		var grid = new Gtk.Grid ();
		var label = new Gtk.Label ("Press any key or ");

		grid.attach (label, 0, 0, 1, 1);
		label.show ();

		var button = new Gtk.Button.with_label ("click me.");
		grid.attach_next_to (button, label, Gtk.PositionType.RIGHT, 1, 1);
		button.show ();

		grid.attach (statusbar, 0, 1, 2, 1);
		statusbar.show ();

		grid.set_column_spacing (5);
		grid.set_column_homogeneous (true);
		grid.set_row_homogeneous (true);

		this.add (grid);
		grid.show ();

		button.clicked.connect(button_clicked_cb);
	}

	/* Since the key-press-event is a signal received by the window, we don't need to connect
	the window to a callback function.  We can just override key_press_event. */
	protected override bool key_press_event (Gdk.EventKey event) {
		statusbar.push (context_id, Gdk.keyval_name(event.keyval) + " key was pressed.");
		return true;
	}

	void button_clicked_cb (Gtk.Button button) {
		statusbar.push (context_id, "You clicked the button.");
	}
}

public class MyApplication : Gtk.Application {
	protected override void activate () {
		new MyWindow (this).show ();
	}

	internal MyApplication () {
		Object (application_id: "org.example.status");
	}
}

public int main (string[] args) {
	return new MyApplication ().run (args);
}
