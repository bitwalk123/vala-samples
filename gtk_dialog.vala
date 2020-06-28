#!/usr/bin/env vala

public class MyDialog : Gtk.Window {

    public MyDialog () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "メイン";
        this.border_width = 0;
        this.window_position = Gtk.WindowPosition.CENTER;

        var but = new Gtk.Button.with_label ("ダイアログを開く");
        but.clicked.connect (this.on_clicked);

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        box.pack_start (but, true, true, 0);
        this.add (box);
    }

    void on_clicked (Gtk.Button button) {
        var dialog = new Gtk.Dialog.with_buttons (
            "ダイアログ", this, Gtk.DialogFlags.MODAL,
            Gtk.Stock.OK, Gtk.ResponseType.OK,
            Gtk.Stock.CANCEL, Gtk.ResponseType.CANCEL,
            null
        );
		var content_area = dialog.get_content_area ();
        var msg = new Gtk.TextBuffer(null);
        msg.set_text("このウィンドウは、追加情報を表示するためのダイアログです。");
        var tv = new Gtk.TextView();
        tv.set_wrap_mode(Gtk.WrapMode.WORD);
        tv.set_editable(false);
        tv.set_buffer(msg);
		content_area.add (tv);

		dialog.response.connect (on_response);

		dialog.show_all ();
    }
    
    void on_response (Gtk.Dialog dialog, int response_id) {
        if (response_id == Gtk.ResponseType.OK) {
            print("「OK」ボタンがクリックされました。\n");
        } else if (response_id == Gtk.ResponseType.CANCEL) {
            print("「Cancel」ボタンがクリックされました。\n");
        }

        dialog.destroy ();
    }
}

public static int main (string[] args) {
    Gtk.init (ref args);

    MyDialog app = new MyDialog ();
    app.show_all ();
    Gtk.main ();
    return 0;
}
