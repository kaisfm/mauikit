/*
 *   Copyright 2018 Camilo Higuita <milo.h@aol.com>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 2, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.impl 2.3
import org.kde.mauikit 1.0 as Maui
import org.kde.kirigami 2.2 as Kirigami
import QtGraphicalEffects 1.0

Button
{
    id: control
    property color color: buttonBackgroundColor
    property color fgColor : Qt.darker(control.color, 1.8)
    property color bgColor : control.color
    property alias buttonBG : buttonBG
    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: background.implicitHeight
    hoverEnabled: !isMobile
    
    leftPadding: space.small
    rightPadding: leftPadding
    
    contentItem: Text 
    {
        text: control.text
        font: control.font
        color: fgColor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
    
    background: Rectangle 
    {
        id: buttonBG
        implicitWidth: iconSizes.medium *3
        
        implicitHeight: iconSizes.medium + space.small
     
        color: bgColor
                
        border.color: Qt.darker(color, 1.4)
        
        border.width: unit
        radius: unit * 3
        
         layer.enabled: true
        
        layer.effect: DropShadow 
        {
            transparentBorder: true
            radius: 8
            samples: 16
            horizontalOffset: 0
            verticalOffset: unit * 4
            color: Qt.rgba(0, 0, 0, 0.3)
        }
    }
    
}
