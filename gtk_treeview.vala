#!/usr/bin/env vala
/*
 * https://developer.gnome.org/gnome-devel-demos/stable/treeview_simple_liststore.vala.html.en
 */

public class PhoneBookEntry {
	public string firstname;
	public string lastname;
	public string phone;

	public PhoneBookEntry (string f, string l, string p) {
		this.firstname = f;
		this.lastname = l;
		this.phone = p;
	}
}

class TreeViewSimpleListStore : Gtk.ApplicationWindow {

	Gtk.Label label;

	PhoneBookEntry[] phonebook = {
		new PhoneBookEntry ("Jurg", "Billeter", "555-0123"),
		new PhoneBookEntry ("Johannes", "Schmid", "555-1234"),
		new PhoneBookEntry ("Julita", "Inca", "555-2345"),
		new PhoneBookEntry ("Javier", "Jardon", "555-3456"),
		new PhoneBookEntry ("Jason", "Clinton", "555-4567"),
		new PhoneBookEntry ("Random J.", "Hacker", "555-5678")
	};

	enum Column {
		FIRSTNAME,
		LASTNAME,
		PHONE
	}

	internal TreeViewSimpleListStore (MyApplication app) {
		Object (application: app, title: "My Phone Book");

		this.set_default_size (250, 100);
		this.border_width = 10;

		var view = new Gtk.TreeView ();
		this.setup_treeview (view);
		view.expand = true;

		label = new Gtk.Label ("");

		var grid = new Gtk.Grid ();

		grid.attach (view, 0, 0, 1, 1);
		grid.attach (label, 0, 1, 1, 1);
		this.add (grid);

		var selection = view.get_selection ();
		selection.changed.connect (this.on_changed);
	}

	void setup_treeview (Gtk.TreeView view) {
		var listmodel = new Gtk.ListStore (3, typeof (string),
                                              typeof (string),
                                              typeof (string));
		view.set_model (listmodel);

		var cell = new Gtk.CellRendererText ();

		/* 'weight' refers to font boldness.
		 *  400 is normal.
		 *  700 is bold.
		 */
		cell.set ("weight_set", true);
		cell.set ("weight", 700);

		/*columns*/
		view.insert_column_with_attributes (-1, "First Name",
                                                cell, "text",
                                                Column.FIRSTNAME);

		view.insert_column_with_attributes (-1, "Last Name",
                                                new Gtk.CellRendererText (),
                                                "text", Column.LASTNAME);

		view.insert_column_with_attributes (-1, "Phone Number",
                                                new Gtk.CellRendererText (),
                                                "text", Column.PHONE);

		/* Insert the phonebook into the ListStore */
		Gtk.TreeIter iter;
		for (int i = 0; i < phonebook.length; i++) {
			listmodel.append (out iter);
			listmodel.set (iter, Column.FIRSTNAME,
                                 phonebook[i].firstname,
                                 Column.LASTNAME, phonebook[i].lastname,
                                 Column.PHONE, phonebook[i].phone);
		}
	}

	void on_changed (Gtk.TreeSelection selection) {
		Gtk.TreeModel model;
		Gtk.TreeIter iter;
		string name;
		string lastname;
		string phone;

		if (selection.get_selected (out model, out iter)) {
			model.get (iter,
                                   Column.FIRSTNAME, out name,
                                   Column.LASTNAME, out lastname,
                                   Column.PHONE, out phone);

			label.set_text ("\n" + name + " " + lastname + " " + phone);
		}
	}
}

class MyApplication : Gtk.Application {
	protected override void activate () {

		/* Create new Window and show all the things. */
		new TreeViewSimpleListStore (this).show_all ();
	}

	internal MyApplication () {
		Object (application_id: "example.liststore.simple.treeview");
	}
}

int main (string[] args) {
	return new MyApplication ().run (args);
}
