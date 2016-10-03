#include "panel-manager.h"

G_DEFINE_INTERFACE(ValaPanelManager, vala_panel_manager, G_TYPE_OBJECT)

void vala_panel_manager_default_init(ValaPanelManagerInterface *self)
{
}

long vala_panel_manager_can_strut(ValaPanelManager *self, ValaPanelToplevelUnit *top)
{
	if (self)
		return VALA_PANEL_MANAGER_GET_IFACE(self)->can_strut(self, top);
	return -1;
}

void vala_panel_manager_update_strut(ValaPanelManager *self, ValaPanelToplevelUnit *top)
{
	if (self)
		VALA_PANEL_MANAGER_GET_IFACE(self)->update_strut(self, top);
}

void vala_panel_manager_ah_start(ValaPanelManager *self, ValaPanelToplevelUnit *top)
{
	if (self)
		VALA_PANEL_MANAGER_GET_IFACE(self)->ah_start(self, top);
}

void vala_panel_manager_ah_stop(ValaPanelManager *self, ValaPanelToplevelUnit *top)
{
	if (self)
		VALA_PANEL_MANAGER_GET_IFACE(self)->ah_stop(self, top);
}

void vala_panel_manager_ah_state_set(ValaPanelManager *self, ValaPanelToplevelUnit *top,
                                     PanelAutohideState st)
{
	if (self)
		VALA_PANEL_MANAGER_GET_IFACE(self)->ah_state_set(self, top, st);
}

void vala_panel_manager_move_to_alloc(ValaPanelManager *self, ValaPanelToplevelUnit *top,
                                      GtkAllocation *alloc)
{
	if (self)
		VALA_PANEL_MANAGER_GET_IFACE(self)->move_to_alloc(self, top, alloc);
}

void vala_panel_manager_move_to_side(ValaPanelManager *self, ValaPanelToplevelUnit *top,
                                     GtkPositionType alloc)
{
	if (self)
		VALA_PANEL_MANAGER_GET_IFACE(self)->move_to_side(self, top, alloc);
}

bool vala_panel_manager_start_panels_from_profile(ValaPanelManager *self, GtkApplication *app,
                                                  const char *profile)
{
	if (self)
		return VALA_PANEL_MANAGER_GET_IFACE(self)->start_panels_from_profile(self,
		                                                                     app,
		                                                                     profile);
	return false;
}

GSettings *vala_panel_manager_get_settings_for_scheme(ValaPanelManager *self, const char *scheme,
                                                      const char *path)
{
	if (self)
		return VALA_PANEL_MANAGER_GET_IFACE(self)->get_settings_for_scheme(self,
		                                                                   scheme,
		                                                                   path);
	return NULL;
}

void vala_panel_manager_remove_settings_path(ValaPanelManager *self, const char *path,
                                             const char *child_name)
{
	if (self)
		VALA_PANEL_MANAGER_GET_IFACE(self)->remove_settings_path(self, path, child_name);
	return;
}
