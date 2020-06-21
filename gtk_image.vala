#!/usr/bin/env vala
/*
 * https://developer.gnome.org/gnome-devel-demos/stable/image.vala.html.en
 */
public class MyWindow : Gtk.ApplicationWindow {
	internal MyWindow (MyApplication app) {
		Object (application: app, title: "Welcome to GNOME");

		var image = new Gtk.Image ();
		image.set_from_file ("gnome-image.png");
		this.add (image);
		this.set_default_size (300, 300);
	}
}

public class MyApplication : Gtk.Application {
	protected override void activate () {
		new MyWindow (this).show_all ();
	}

	internal MyApplication () {
		Object (application_id: "org.example.MyApplication");
	}
}

public int main (string[] args) {
	return new MyApplication ().run (args);
}
