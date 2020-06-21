#!/usr/bin/env vala
/* This is the application. */
public class MyApplication : Gtk.Application {
	Gtk.Scale h_scale;
	Gtk.Scale v_scale;
	Gtk.Label label;

	/* Override the 'activate' signal of GLib.Application. */
	protected override void activate () {
		var window = new Gtk.ApplicationWindow (this);
		window.title = "Scale Example";
		window.set_default_size (400, 300);
		window.set_border_width (5);

		h_scale = new Gtk.Scale.with_range (Gtk.Orientation.HORIZONTAL, 0.0, 100.0, 5.0);
		h_scale.set_digits (0); //number of decimal places displayed
		h_scale.set_valign (Gtk.Align.START); //horizontal alignment

		var adjustment = new Gtk.Adjustment (42.0, 0.0, 100.0, 5.0, 10.0, 0.0);
		v_scale = new Gtk.Scale (Gtk.Orientation.VERTICAL, adjustment);
		v_scale.set_vexpand(true);

		label = new Gtk.Label ("Move the scale handles...");

		var grid = new Gtk.Grid ();
		grid.set_column_spacing (10); //amount of space between columns
		grid.set_column_homogeneous (true); //all columns same width
		grid.attach (h_scale, 0, 0, 1, 1);
		grid.attach_next_to (v_scale, h_scale, Gtk.PositionType.RIGHT, 1, 1);
		grid.attach (label, 0, 1, 2, 1);

		h_scale.value_changed.connect (scale_moved);
		v_scale.value_changed.connect (scale_moved);

		window.add (grid);
		window.show_all ();
	}

	/* Callback function for "value-changed" signal.
	 * The parameter refers to the scale which emitted the signal.
	 * Since we are accessing the values of not one, but two scales,
	 * we made the ranges instance variables, and ignore the
	 * parameter.
	 */
	void scale_moved (Gtk.Range range) {
		label.set_text ("Horizontal scale is %.1f; vertical scale is %.1f.".printf (h_scale.get_value (), v_scale.get_value ()));
	}
}

/* main creates and runs the application. */
public int main (string[] args) {
	return new MyApplication ().run (args);
}
