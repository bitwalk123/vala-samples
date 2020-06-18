/* This is the application. */
public class MyApplication : Gtk.Application {
	/* Override the 'activate' signal of GLib.Application. */
	protected override void activate () {
		/* Create the window of this application. */
		new MyWindow (this).show_all ();
	}
}

/* This is the window. */
class MyWindow: Gtk.ApplicationWindow {
	internal MyWindow (MyApplication app) {
		Object (application: app, title: "TextView Example");
		this.set_default_size (220, 200);

		var buffer = new Gtk.TextBuffer (null); //stores text to be displayed
		var textview = new Gtk.TextView.with_buffer (buffer); //displays TextBuffer
		textview.set_wrap_mode (Gtk.WrapMode.WORD); //sets line wrapping

		var scrolled_window = new Gtk.ScrolledWindow (null, null);
		scrolled_window.set_policy (Gtk.PolicyType.AUTOMATIC,
		                            Gtk.PolicyType.AUTOMATIC);

		scrolled_window.add (textview);
		scrolled_window.set_border_width (5);

		this.add (scrolled_window);
	}
}
/* main creates and runs the application. */
public int main (string[] args) {
	return new MyApplication ().run (args);
}
