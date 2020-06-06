using Gtk;
 
int main (string[] args) {
    Gtk.init (ref args);
    
    var window = new Window ();
    window.title = "Hello, World!";
    window.border_width = 10;
    window.window_position = WindowPosition.CENTER;
    window.set_default_size(350, 70);
    window.destroy.connect (Gtk.main_quit);
    
    var label = new Label ("こんにちは、世界！");
    
    window.add (label);
    window.show_all ();
    
    Gtk.main ();
    return 0;
}
