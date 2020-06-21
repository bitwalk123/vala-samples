#!/usr/bin/env vala
/*
 * https://developer.gnome.org/gnome-devel-demos/stable/progressbar.vala.html.en
 */
public class MyApplication : Gtk.Application {

	Gtk.ProgressBar progress_bar;

	protected override void activate () {
		var window = new Gtk.ApplicationWindow (this);
		window.set_title ("ProgressBar Example");
		window.set_default_size (220, 20);

		progress_bar = new Gtk.ProgressBar ();
		window.add (progress_bar);
		window.show_all ();

		double fraction = 0.0;
		progress_bar.set_fraction (fraction);
		GLib.Timeout.add (500, fill);
	}

	bool fill () {
		double fraction = progress_bar.get_fraction (); //get current progress
		fraction += 0.1; //increase by 10% each time this function is called

		progress_bar.set_fraction (fraction);

		/* This function is only called by GLib.Timeout.add while it returns true; */
		if (fraction < 1.0)
			return true;
		return false;
	}
}

public int main (string[] args) {
	var progress_bar_application = new MyApplication ();
	int status =  progress_bar_application.run (args);
	return status;
}
