var plasma = getApiVersion(1);

var layout = {
    "desktops": [
        {
            "applets": [
            ],
            "config": {
                "/": {
                    "ItemGeometries-1800x1125": "",
                    "ItemGeometries-3440x1440": "",
                    "ItemGeometriesHorizontal": "",
                    "formfactor": "0",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "a2n.blur"
                },
                "/ConfigDialog": {
                    "DialogHeight": "630",
                    "DialogWidth": "810"
                },
                "/General": {
                    "changedPositions": "{\"desktop:/AuthStack copy.md\":[\"1800x1125\",\"1\",\"8\"],\"desktop:/OneDrive.desktop\":[\"1800x1125\",\"0\",\"2\"],\"desktop:/Scratch\":[\"1800x1125\",\"0\",\"0\"],\"desktop:/auth_stack_turns.txt\":[\"1800x1125\",\"1\",\"6\"],\"desktop:/context_reccs.txt\":[\"3440x1440,2259x1271,1800x1125\",\"0\",\"2\"],\"desktop:/opctrl_install_history.txt\":[\"1800x1125\",\"1\",\"7\"],\"desktop:/ouput.txt\":[\"1800x1125\",\"1\",\"9\"]}",
                    "lastResolution": "1800x1125",
                    "positions": "{\"1800x1125\":[\"1\",\"16\",\"desktop:/default.xml\",\"0\",\"3\",\"desktop:/AuthStack copy.md\",\"1\",\"8\",\"desktop:/ouput.txt\",\"1\",\"9\",\"desktop:/context_reccs.txt\",\"0\",\"2\",\"desktop:/opctrl_install_history.txt\",\"1\",\"7\",\"desktop:/OneDrive.desktop\",\"0\",\"2\",\"desktop:/NICS KeePass Vaults\",\"0\",\"0\",\"desktop:/auth_stack_turns.txt\",\"1\",\"6\",\"desktop:/Scratch\",\"0\",\"0\",\"desktop:/Workspace\",\"0\",\"1\",\"desktop:/nics-win-mgmt.rdp\",\"0\",\"4\"],\"2259x1271\":[\"1\",\"20\",\"desktop:/auth_stack_turns.txt\",\"0\",\"6\",\"desktop:/NICS KeePass Vaults\",\"0\",\"0\",\"desktop:/AuthStack copy.md\",\"0\",\"8\",\"desktop:/OneDrive.desktop\",\"0\",\"5\",\"desktop:/opctrl_install_history.txt\",\"0\",\"7\",\"desktop:/Workspace\",\"0\",\"1\",\"desktop:/nics-win-mgmt.rdp\",\"0\",\"4\",\"desktop:/context_reccs.txt\",\"0\",\"2\",\"desktop:/default.xml\",\"0\",\"3\"],\"3440x1440\":[\"1\",\"31\",\"desktop:/OneDrive.desktop\",\"0\",\"5\",\"desktop:/default.xml\",\"0\",\"3\",\"desktop:/Workspace\",\"0\",\"1\",\"desktop:/NICS KeePass Vaults\",\"0\",\"0\",\"desktop:/auth_stack_turns.txt\",\"0\",\"6\",\"desktop:/AuthStack copy.md\",\"0\",\"8\",\"desktop:/opctrl_install_history.txt\",\"0\",\"7\",\"desktop:/context_reccs.txt\",\"0\",\"2\",\"desktop:/nics-win-mgmt.rdp\",\"0\",\"4\"]}",
                    "sortMode": "-1"
                },
                "/Wallpaper/a2n.blur/General": {
                    "ActiveColor": "true",
                    "ActiveColorColor": "#000000",
                    "ActiveColorTransparency": "50",
                    "Image": "file:///usr/share/wallpapers/F44/",
                    "SlidePaths": "/usr/share/wallpapers/"
                },
                "/Wallpaper/online.knowmad.shaderwallpaper/General": {
                    "iChannel0": "file:///home/emcghee5/.local/share/plasma/wallpapers/online.knowmad.shaderwallpaper/contents/ui/Resources/wallpaper.jpg",
                    "iChannel3_flag": "true",
                    "selectedShaderIndex": "16"
                },
                "/Wallpaper/org.kde.image/General": {
                    "Image": "file:///home/emcghee5/.local/share/wallpapers/Aritim-Light-Wallpaper-V4-5344x3008.jpg",
                    "SlidePaths": "/usr/share/wallpapers/"
                }
            },
            "wallpaperPlugin": "a2n.blur"
        },
        {
            "applets": [
            ],
            "config": {
                "/": {
                    "formfactor": "0",
                    "immutability": "1",
                    "lastScreen": "1",
                    "wallpaperplugin": "org.kde.image"
                }
            },
            "wallpaperPlugin": "org.kde.image"
        }
    ],
    "panels": [
        {
            "alignment": "center",
            "applets": [
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.marginsseparator"
                },
                {
                    "config": {
                    },
                    "plugin": "com.himdek.kde.plasma.overview"
                },
                {
                    "config": {
                    },
                    "plugin": "com.github.kenansalar.plasma-gnome-pager"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.marginsseparator"
                },
                {
                    "config": {
                    },
                    "plugin": "org.magpie.dotted.separator"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.panelspacer"
                },
                {
                    "config": {
                        "/ConfigDialog": {
                            "DialogHeight": "630",
                            "DialogWidth": "810"
                        },
                        "/General": {
                            "customButtonImage": "start-here-kde-plasma",
                            "favoritesPortedToKAstats": "true",
                            "useCustomButtonImage": "true"
                        }
                    },
                    "plugin": "menu.11.enhanced"
                },
                {
                    "config": {
                        "/General": {
                            "expanding": "false",
                            "length": "10"
                        }
                    },
                    "plugin": "org.kde.plasma.panelspacer"
                },
                {
                    "config": {
                        "/General": {
                            "launchers": "preferred://filemanager,applications:com.mitchellh.ghostty.desktop,preferred://browser,applications:FFPWA-01KZVB0M9KM3Y4NMSNQXTNV1JB.desktop,applications:com.github.IsmaelMartinez.teams_for_linux.desktop,applications:FFPWA-01KZV9PHP8G3T8VQ5QT956RBFR.desktop,applications:obsidian.desktop,applications:FFPWA-01KZVAWBFK0WFY2Y3WT7YN1SBN.desktop,applications:org.keepassxc.KeePassXC.desktop,applications:dev.zed.Zed.desktop"
                        }
                    },
                    "plugin": "org.kde.plasma.icontasks"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.panelspacer"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.marginsseparator"
                },
                {
                    "config": {
                    },
                    "plugin": "org.magpie.dotted.separator"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.systemtray"
                },
                {
                    "config": {
                        "/": {
                            "popupHeight": "451",
                            "popupWidth": "560"
                        },
                        "/Appearance": {
                            "fontWeight": "400"
                        }
                    },
                    "plugin": "org.kde.plasma.digitalclock"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.showdesktop"
                }
            ],
            "config": {
                "/": {
                    "formfactor": "2",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                }
            },
            "height": 2.5555555555555554,
            "hiding": "normal",
            "lengthMode": "fill",
            "location": "bottom",
            "maximumLength": 100,
            "minimumLength": 100,
            "offset": 0,
            "opacity": "adaptive"
        }
    ],
    "serializationFormatVersion": "1"
}
;

plasma.loadSerializedLayout(layout);
