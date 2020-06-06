/*
 * https://developer.gnome.org/gnome-devel-demos/stable/dialog.vala.html.en
 * /
/* A window in the application. */
public class MyWindow : Gtk.ApplicationWindow {

	/* Constructor */
	internal MyWindow (MyApplication app) {
		Object (application: app, title: "GNOME Button");

		this.window_position = Gtk.WindowPosition.CENTER;
		this.set_default_size (250,50);

		var button = new Gtk.Button.with_label ("Click Me");

		/* Connect the button's "clicked" signal to
		 * the signal handler (aka. this.callback function).
		 */
		button.clicked.connect (this.on_button_click);

		/* Add the button to this window and show it. */
		this.add (button);
		button.show ();
	}

	/* The signal handler for the buttons 'clicked' signal. */
	void on_button_click (Gtk.Button button) {
		var dialog = new Gtk.Dialog.with_buttons ("A Gtk+ Dialog", this,
                                                          Gtk.DialogFlags.MODAL,
                                                          Gtk.Stock.OK,
                                                          Gtk.ResponseType.OK, null);

		var content_area = dialog.get_content_area ();
		var label = new Gtk.Label ("This demonstrates a dialog with a label");

		content_area.add (label);

		/* Connect the 'response' signal of the dialog
		 * the signal handler.  It is emitted when the dialog's
		 * OK button is clicked.
		 */
		dialog.response.connect (on_response);

		/* Show the dialog and all the widgets. */
		dialog.show_all ();
	}

	/* Signal handler for the 'response' signal of the dialog. */
        void on_response (Gtk.Dialog dialog, int response_id) {

                /* To see the int value of the ResponseType. This is only
		 * for demonstration purposes.*/
                print ("response is %d\n", response_id);

		/* This causes the dialog to be destroyed. */
                dialog.destroy ();
        }

}

/* This is the application. */
public class MyApplication : Gtk.Application {

	/* The constructor of the application. */
	internal MyApplication () {
		Object (application_id: "org.example.MyApplication");
	}

	/* Override the 'activate' signal of GLib.Application. */
	protected override void activate () {

		/* Create a window for the this application and show it. */
		new MyWindow (this).show ();
	}
}

/* The main function creates and runs the application. */
public int main (string[] args) {
	return new MyApplication ().run (args);
}
