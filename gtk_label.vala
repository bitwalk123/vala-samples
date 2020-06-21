#!/usr/bin/env vala
/*
 * https://developer.gnome.org/gnome-devel-demos/stable/label.vala.html.en
 */
public class MyWindow : Gtk.ApplicationWindow {
	internal MyWindow (MyApplication app) {
		Object (application: app, title: "ラベル");

		var label = new Gtk.Label ("これはラベルです。");

		this.add (label);
		this.set_default_size (200, 100);
		this.show_all ();
	}
}

public class MyApplication : Gtk.Application {
	protected override void activate () {
		new MyWindow (this).show ();
	}

	internal MyApplication () {
		Object (application_id: "org.example.MyApplication");
	}
}

public int main (string[] args) {
	return new MyApplication ().run (args);
}
