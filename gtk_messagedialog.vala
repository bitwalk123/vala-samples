#!/usr/bin/env vala

public class MyMessageDialog : Gtk.Window {

    public MyMessageDialog () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "メッセージダイアログ";
        this.border_width = 0;
        this.window_position = Gtk.WindowPosition.CENTER;

        var but = new Gtk.Button.with_label ("情報 (Information)");
        but.clicked.connect (this.on_info_clicked);

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
        box.pack_start (but, true, true, 0);
        this.add (box);
    }

    void on_info_clicked (Gtk.Button button) {
        var messagedialog = new Gtk.MessageDialog (
            this,
            Gtk.DialogFlags.MODAL,
            Gtk.MessageType.INFO,
            Gtk.ButtonsType.OK_CANCEL,
            "メッセージタイプは INFO です。"
        );

        messagedialog.response.connect (dialog_response);
        messagedialog.show ();
    }

    void dialog_response (Gtk.Dialog dialog, int response_id) {
        switch (response_id) {
            case Gtk.ResponseType.OK:
                print ("「OK」ボタンがクリックされました。\n");
                break;
            case Gtk.ResponseType.CANCEL:
                print ("「Cancel」ボタンがクリックされました。\n");
                break;
            case Gtk.ResponseType.DELETE_EVENT:
                print ("ダイアログが閉じられました。\n");
                break;
        }
        dialog.destroy();
    }
}

public static int main (string[] args) {
    Gtk.init (ref args);

    MyMessageDialog app = new MyMessageDialog ();
    app.show_all ();
    Gtk.main ();
    return 0;
}

