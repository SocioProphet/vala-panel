using ValaPanel;
using Gtk;
public class TasklistApplet : AppletPlugin, Peas.ExtensionBase
{
    public Applet get_applet_widget(ValaPanel.Toplevel toplevel,
		                            GLib.Settings? settings,
		                            uint number)
    {
        return new Tasklist(toplevel,settings,number);
    }
}
public class Tasklist: Applet, AppletConfigurable
{
    Wnck.Tasklist widget;
	private static const string KEY_MIDDLE_CLICK_CLOSE = "middle-click-close";
	private static const string KEY_ICONS_ONLY = "icons-only";
	private static const string KEY_ALL_DESKTOPS = "all-desktops";
	private static const string KEY_FLAT_BUTTONS = "flat-buttons";
	private static const string KEY_GROUPING = "grouped-tasks";
	private static const string KEY_GROUPING_LIMIT = "grouping-limit";
	private static const string KEY_SWITCH_UNMIN = "switch-workspace-on-unminimize";
	internal bool icons_only
	{get; set;}
	internal bool flat_buttons
	{get; set;}
    public Tasklist(ValaPanel.Toplevel toplevel,
		                            GLib.Settings? settings,
		                            uint number)
    {
		base(toplevel,settings,number);
	}
	public override void create()
	{
		widget = new Wnck.Tasklist();
		this.add(widget);
		toplevel.notify["edge"].connect((pspec)=>{widget.set_orientation(toplevel.orientation);});
		widget.set_button_relief(ReliefStyle.NONE);
		settings.bind(KEY_ICONS_ONLY,this,KEY_ICONS_ONLY,SettingsBindFlags.GET);
		settings.bind(KEY_FLAT_BUTTONS,this,KEY_FLAT_BUTTONS,SettingsBindFlags.GET);
		settings.changed.connect((key)=>{
			if (key == KEY_ALL_DESKTOPS)
				widget.set_include_all_workspaces(settings.get_boolean(key));
			if (key == KEY_SWITCH_UNMIN)
				widget.set_switch_workspace_on_unminimize(settings.get_boolean(key));
			if (key == KEY_GROUPING)
				widget.set_grouping(settings.get_boolean(key) ? Wnck.TasklistGroupingType.AUTO_GROUP : Wnck.TasklistGroupingType.NEVER_GROUP);
			if (key == KEY_MIDDLE_CLICK_CLOSE)
				widget.set_middle_click_close(settings.get_boolean(key));
			if (key == KEY_GROUPING_LIMIT)
				widget.set_grouping_limit(settings.get_int(key));
		});
		widget.set_include_all_workspaces(settings.get_boolean(KEY_ALL_DESKTOPS));
		widget.set_switch_workspace_on_unminimize(settings.get_boolean(KEY_SWITCH_UNMIN));
		widget.set_grouping(settings.get_boolean(KEY_GROUPING) ? Wnck.TasklistGroupingType.AUTO_GROUP : Wnck.TasklistGroupingType.NEVER_GROUP);
		widget.set_middle_click_close(settings.get_boolean(KEY_MIDDLE_CLICK_CLOSE));
		widget.set_grouping_limit(settings.get_int(KEY_GROUPING_LIMIT));
		this.show_all();
	}
	public Dialog get_config_dialog()
	{
		return Configurator.generic_config_dlg(_("Tasklist Applet"),
							toplevel, this,
							_("Show windows from all desktops"), KEY_ALL_DESKTOPS, GenericConfigType.BOOL,
							_("Show window`s workspace on unminimize"), KEY_SWITCH_UNMIN, GenericConfigType.BOOL,
							_("Close windows on middle click"), KEY_MIDDLE_CLICK_CLOSE, GenericConfigType.BOOL,
							_("Group windows when needed"), KEY_GROUPING, GenericConfigType.BOOL,
							_("Ungrouped buttons limit"), KEY_GROUPING_LIMIT, GenericConfigType.INT,
							_("Icons only"), KEY_ICONS_ONLY, GenericConfigType.BOOL,
							_("Flat buttons"), KEY_FLAT_BUTTONS, GenericConfigType.BOOL);
	}
} // End class

[ModuleInit]
public void peas_register_types(TypeModule module)
{
    // boilerplate - all modules need this
    var objmodule = module as Peas.ObjectModule;
    objmodule.register_extension_type(typeof(ValaPanel.AppletPlugin), typeof(TasklistApplet));
}