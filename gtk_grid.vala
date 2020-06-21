#!/usr/bin/env vala
public class MyWindow : Gtk.ApplicationWindow {

	Gtk.Widget progress_bar;

	internal MyWindow (MyApplication app) {
		Object (application: app, title: "Grid Example");
		var grid = new Gtk.Grid();
		progress_bar = new Gtk.ProgressBar ();
		progress_bar.show ();

		var button = new Gtk.Button.with_label ("Button");
		button.clicked.connect (on_button_click);
		button.show ();

		this.add(grid);
		grid.attach(button, 0, 1, 1, 1);
		grid.attach_next_to (progress_bar, button, Gtk.PositionType.BOTTOM, 1, 1);
		grid.show ();
	}

	void on_button_click (Gtk.Button button) {
		(progress_bar as Gtk.ProgressBar).pulse ();
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
