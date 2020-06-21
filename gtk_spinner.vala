#!/usr/bin/env vala
/*
 * https://developer.gnome.org/gnome-devel-demos/stable/spinner.vala.html.en
 */
public class MyWindow : Gtk.ApplicationWindow {

	Gtk.Widget spinner;

	internal MyWindow (MyApplication app) {

		Object (application: app, title: "Spinner Example");

		this.set_default_size (200, 200);
		this.border_width = 30;

		spinner = new Gtk.Spinner ();

		this.add (spinner);
		(spinner as Gtk.Spinner).active = true;
		spinner.show ();
	}

	protected override bool key_press_event (Gdk.EventKey event) {

		//print (Gdk.keyval_name(event.keyval) +"\n");
		if (Gdk.keyval_name(event.keyval) == "space") {

			if ((spinner as Gtk.Spinner).active) {
				(spinner as Gtk.Spinner).stop ();
				//spinner.visible = false;
			}
			else {
				(spinner as Gtk.Spinner).start ();
				//spinner.visible = true;
			}
		}
		return true;
	}
}

public class MyApplication : Gtk.Application {

	protected override void activate () {
		MyWindow window = new MyWindow (this);
		window.show ();
	}

	internal MyApplication () {
		Object (application_id: "org.example.spinner");
	}
}

public int main (string[] args) {
	return new MyApplication ().run (args);
}
