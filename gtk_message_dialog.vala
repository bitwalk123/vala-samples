/*
 * https://developer.gnome.org/gnome-devel-demos/stable/messagedialog.vala.html.en
 */
//A window in the application
public class Window : Gtk.ApplicationWindow {
	public Window (Application app) {
		Object (application: app, title: "Gtk.MessageDialog Example");

		var label = new Gtk.Label ("This application goes boom!");
		this.add (label);

		var message_action = new SimpleAction ("message", null);
		message_action.activate.connect (message);
		this.add_action (message_action);

		this.set_default_size (400, 200);
		this.show_all ();
	}

	void dialog_response (Gtk.Dialog dialog, int response_id) {
		switch (response_id) {
			case Gtk.ResponseType.OK:
				print ("*boom*\n");
				break;
			case Gtk.ResponseType.CANCEL:
				print ("good choice\n");
				break;
			case Gtk.ResponseType.DELETE_EVENT:
				print ("dialog closed or cancelled\n");
				break;
		}
			dialog.destroy();
	}

	void message (SimpleAction simple, Variant? parameter) {
		var messagedialog = new Gtk.MessageDialog (this,
                            Gtk.DialogFlags.MODAL,
                            Gtk.MessageType.WARNING,
                            Gtk.ButtonsType.OK_CANCEL,
                            "This action will cause the universe to stop existing.");

		messagedialog.response.connect (dialog_response);
		messagedialog.show ();
	}
}

//This is the Application
public class Application : Gtk.Application {
	protected override void activate () {
		new Window (this);
	}

	protected override void startup () {
		base.startup ();

		var menu = new Menu ();
		menu.append ("Message", "win.message");
		menu.append ("Quit", "app.quit");
		this.app_menu = menu;

		var quit_action = new SimpleAction ("quit", null);
		//quit_action.activate.connect (this.quit);
		this.add_action (quit_action);
	}

	public Application () {
		Object (application_id: "org.example.application");
	}
}

//main function creates Application and runs it
int main (string[] args) {
	return new Application ().run (args);
}
