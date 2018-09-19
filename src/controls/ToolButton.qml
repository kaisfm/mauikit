import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Controls.impl 2.3
import org.kde.kirigami 2.0 as Kirigami

ToolButton
{
    id: control
    readonly property color defaultColor:  textColor

    property bool isMask:  true
    property string iconName: ""
    property int size: iconSize
    property color iconColor: textColor
    property bool anim: false
    property string tooltipText : ""
    hoverEnabled: !isMobile
    height:  control.display === ToolButton.IconOnly ? size + space.medium : implicitHeight
    width: control.display === ToolButton.IconOnly ? height : implicitWidth
    icon.name:  iconName
    icon.width:  size
    icon.height: size
    //     icon.height:  display === ToolButton.TextUnderIcon ? size * 2 : size
    icon.color: !isMask ? "transparent" : (down || pressed ? highlightColor : (iconColor || defaultColor))

    onClicked: if(anim) animIcon.running = true
    //                 anchors.verticalCenter: parent.verticalCenter

    flat: true
    highlighted: !isMask
    font.pointSize: control.display === ToolButton.TextUnderIcon ? fontSizes.small : undefined

    display: control.text.length > 0 ? (isWide ? ToolButton.TextBesideIcon : ToolButton.TextUnderIcon) : ToolButton.IconOnly
    spacing: space.tiny

    contentItem: IconLabel
    {
        spacing:  control.display === ToolButton.TextUnderIcon ? space.tiny : control.spacing
        mirrored: control.mirrored
        display: control.display
        icon: control.icon
        text: control.text
        font: control.font
        color: control.iconColor
    }

    SequentialAnimation
    {
        id: animIcon
        PropertyAnimation
        {
            target: control
            property: "icon.color"
            easing.type: Easing.InOutQuad
            from: highlightColor
            to: iconColor
            duration: 500
        }
    }
    
    ToolTip.delay: 1000
    ToolTip.timeout: 5000
    ToolTip.visible: hovered && !isMobile && tooltipText.length > 0
    ToolTip.text: tooltipText
}
