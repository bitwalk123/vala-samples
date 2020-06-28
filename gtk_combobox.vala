#!/usr/bin/env vala

public class MyComboBox : Gtk.Window {
    string[] prefectures = {"北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県",
        "福島県", "茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県",
        "新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県","静岡県",
        "愛知県", "新潟県", "富山県", "石川県", "福井県", "山梨県","長野県", "岐阜県",
        "静岡県", "愛知県", "鳥取県", "島根県", "岡山県", "広島県", "山口県", "徳島県",
        "香川県", "愛媛県", "高知県", "福岡県", "佐賀県", "長崎県", "熊本県", "大分県",
        "宮崎県", "鹿児島県", "沖縄県"};

    public MyComboBox () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "コンボボックス";
        this.border_width = 0;
        this.window_position = Gtk.WindowPosition.CENTER;

        var combo = new Gtk.ComboBoxText ();
        for (int i = 0; i < prefectures.length; i++) {
            combo.append_text(prefectures[i]);
        }
        combo.set_active (0);
        combo.changed.connect (this.item_changed);

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        box.pack_start (combo, true, true, 0);
        this.add (box);
    }
    
    void item_changed (Gtk.ComboBox combo) {
		if (combo.get_active () !=0) {
			stdout.printf ("「%s」が選択されました。\n", prefectures[combo.get_active ()]);
		}
	}
}

public static int main (string[] args) {
    Gtk.init (ref args);

    MyComboBox app = new MyComboBox ();
    app.show_all ();
    Gtk.main ();
    return 0;
}
