#!/usr/bin/env vala

// https://gist.github.com/chergert/7d3cffaf9afe37e3e5eb
using Gtk;

namespace Chimera {
    public class ChimeraTab : Gtk.Bin {
        ScrolledWindow scroller;
        TextView text_view;

        construct {
            this.scroller = new ScrolledWindow (null, null);
            this.scroller.set_policy (PolicyType.NEVER, PolicyType.AUTOMATIC);
            this.scroller.set_shadow_type (ShadowType.NONE);
      
            this.text_view = new TextView ();

            this.scroller.add (this.text_view);

            this.text_view.show();
            this.scroller.show();
        }

        public Gtk.Widget create_label () {
            var label = new Gtk.Label ("Foo");
            label.show();
            return label;
        }
    }

    public class ChimeraNotebook : Gtk.Notebook {
        construct {
            this.show_border = false;
            this.new_tab ();
        }

        public void new_tab () {
            var tab = new ChimeraTab ();
            this.append_page (tab, tab.create_label());
            tab.show ();
        }
    }

    public static int main (string[] argv) {
        Gtk.init (ref argv);

        var win = new Gtk.Window ();
        win.set_title("Foo");

        var notebook = new ChimeraNotebook ();
        notebook.show ();
        win.add (notebook);

        win.set_default_size (640, 480);
        win.delete_event.connect (
            (win,e) => {
                Gtk.main_quit ();
                return false;
            }
        );
        win.present ();

        Gtk.main ();
        return 0;
    }
}
