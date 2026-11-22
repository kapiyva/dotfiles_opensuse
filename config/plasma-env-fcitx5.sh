#!/bin/sh
# fcitx5 (flatpak) is launched by KWin as the Wayland input method.
# Point Xwayland apps at it; Wayland-native apps use text-input directly,
# so GTK_IM_MODULE / QT_IM_MODULE are intentionally left unset.
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export XMODIFIERS="@im=fcitx"
fi
