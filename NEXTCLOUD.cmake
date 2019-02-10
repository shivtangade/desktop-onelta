set( APPLICATION_NAME       "oneLTA" )
set( APPLICATION_SHORTNAME  "oneLTA" )
set( APPLICATION_EXECUTABLE "onelta" )
set( APPLICATION_DOMAIN     "onelta.com" )
set( APPLICATION_VENDOR     "oneLTA AG" )
set( APPLICATION_UPDATE_URL "https://onelta.com/desktop/" CACHE string "URL for updater" )
set( APPLICATION_HELP_URL   "" CACHE string "URL for the help menu" )
set( APPLICATION_ICON_NAME  "onelta" )
set( APPLICATION_SERVER_URL "" CACHE string "URL for the server to use. If entered the server can only connect to this instance" )

set( LINUX_PACKAGE_SHORTNAME "onelta" )

set( THEME_CLASS            "NextcloudTheme" )
set( APPLICATION_REV_DOMAIN "com.onelta.desktop" )
set( WIN_SETUP_BITMAP_PATH  "${CMAKE_SOURCE_DIR}/admin/win/nsi" )

set( MAC_INSTALLER_BACKGROUND_FILE "${CMAKE_SOURCE_DIR}/admin/osx/installer-background.png" CACHE STRING "The MacOSX installer background image")

# set( THEME_INCLUDE          "${OEM_THEME_DIR}/mytheme.h" )
# set( APPLICATION_LICENSE    "${OEM_THEME_DIR}/license.txt )

option( WITH_CRASHREPORTER "Build crashreporter" OFF )
#set( CRASHREPORTER_SUBMIT_URL "https://crash-reports.owncloud.com/submit" CACHE string "URL for crash reporter" )
#set( CRASHREPORTER_ICON ":/owncloud-icon.png" )

option( WITH_PROVIDERS "Build with providers list" ON )


## Theming options
set( APPLICATION_WIZARD_HEADER_BACKGROUND_COLOR "#0082c9" CACHE string "Hex color of the wizard header background")
set( APPLICATION_WIZARD_HEADER_TITLE_COLOR "#ffffff" CACHE string "Hex color of the text in the wizard header")
option( APPLICATION_WIZARD_USE_CUSTOM_LOGO "Use the logo from ':/client/theme/colored/wizard_logo.png' else the default application icon is used" ON )

