#!/usr/bin/env vala

public class MyFileChooserDialog : Gtk.Window {

    public MyFileChooserDialog () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "ファイル選択用ダイアログ";
        this.border_width = 0;
        this.window_position = Gtk.WindowPosition.CENTER;

        var but = new Gtk.Button.with_label ("ファイル選択");
        but.clicked.connect (this.on_clicked);

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        box.pack_start (but, true, true, 0);
        this.add (box);
    }

    void on_clicked (Gtk.Button button) {
        var open_dialog = new Gtk.FileChooserDialog (
            "ファイルの選択",
            this as Gtk.Window,
            Gtk.FileChooserAction.OPEN,
            Gtk.Stock.CANCEL,
            Gtk.ResponseType.CANCEL,
            Gtk.Stock.OPEN,
            Gtk.ResponseType.ACCEPT
        );

        open_dialog.local_only = false; //allow for uri
        open_dialog.set_modal (true);
        open_dialog.response.connect (open_response_cb);
        open_dialog.show ();
	}

    void open_response_cb (Gtk.Dialog dialog, int response_id) {
        var open_dialog = dialog as Gtk.FileChooserDialog;

        switch (response_id) {
            case Gtk.ResponseType.ACCEPT: //open the file
                print ("「開く」がクリックされました。\n");
                print ("ファイル「" + open_dialog.get_filename () + "」が選択されました。\n");
                break;

            case Gtk.ResponseType.CANCEL:
                print("「キャンセル」がクリックされました。\n");
                break;
        }
        dialog.destroy ();
    }
}

public static int main (string[] args) {
    Gtk.init (ref args);

    MyFileChooserDialog app = new MyFileChooserDialog ();
    app.show_all ();
    Gtk.main ();
    return 0;
}
