/*
 * vala-panel
 * Copyright (C) 2018 Konstantin Pugin <ria.freelander@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
#ifndef VALAPANELCPU_H
#define VALAPANELCPU_H

#include "client.h"

G_BEGIN_DECLS

G_DECLARE_FINAL_TYPE(CpuApplet, cpu_applet, VALA_PANEL, CPU_APPLET, ValaPanelApplet)

G_DECLARE_FINAL_TYPE(CpuPlugin, cpu_plugin, VALA_PANEL, CPU_PLUGIN, ValaPanelAppletPlugin)

G_END_DECLS

#endif // VALAPANELGENMON_H
