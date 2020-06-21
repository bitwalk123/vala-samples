#!/usr/bin/env vala

public class MyWindow : Gtk.ApplicationWindow {
	internal MyWindow (MyApplication app) {
		Object (application: app, title: "RadioButton Example");

		this.border_width = 20;
		this.set_default_size (250, 100);

		/* We demonstrate 3 different RadioButton creation methods */

		//Create a Radio Button
		var button1 = new Gtk.RadioButton (null);
		button1.set_label ("Button 1");

		//Create a RadioButton with a label, and add it to the same group as button1.
		var button2 = new Gtk.RadioButton.with_label (button1.get_group(),"Button 2");

		//Create a RadioButton with a label, adding it to button1's group.
		var button3 = new Gtk.RadioButton.with_label_from_widget (button1, "Button 3");

		//Attach the buttons to a grid.
		var grid = new Gtk.Grid ();
		grid.attach (button1, 0, 0, 1, 1);
		grid.attach (button2, 0, 1, 1, 1);
		grid.attach (button3, 0, 2, 1, 1);

		//Add the button to the window.
		this.add (grid);

		//Connect the signal handlers (aka. callback functions) to the buttons.
		button1.toggled.connect (button_toggled_cb);
		button2.toggled.connect (button_toggled_cb);
		button3.toggled.connect (button_toggled_cb);
	}

	void button_toggled_cb (Gtk.ToggleButton button)
	{
		var state = "unknown";

		if (button.get_active ())
			state = "on";
		else {
			state = "off";
			print ("\n");
		}
		print (button.get_label() + " was turned " + state + "\n");
	}
}

public class MyApplication : Gtk.Application {
	protected override void activate () {

		//Show all of the things.
		new MyWindow (this).show_all ();
	}

	internal MyApplication () {
		Object (application_id: "org.example.MyApplication");
	}
}

public int main (string[] args) {
	return new MyApplication ().run (args);
}
