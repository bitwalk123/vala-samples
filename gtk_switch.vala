#!/usr/bin/env vala

public class MySwitch : Gtk.Window {

    public MySwitch () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "スイッチ";
        this.border_width = 0;
        this.window_position = Gtk.WindowPosition.CENTER;

		var sw = new Gtk.Switch ();
		sw.set_active (true);
		sw.notify["active"].connect (switched);

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
        box.pack_end (sw, false, true, 0);
        this.add (box);
    }

    void switched (Object switcher, ParamSpec pspec) {
        var state = "";

        if ((switcher as Gtk.Switch).get_active())
            state = "オン";
        else
            state = "オフ";

        print ("スイッチが「" + state + "」になりました。\n");
    }
}

public static int main (string[] args) {
    Gtk.init (ref args);

    MySwitch app = new MySwitch ();
    app.show_all ();
    Gtk.main ();
    return 0;
}
