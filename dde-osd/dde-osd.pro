#-------------------------------------------------
#
# Project created by QtCreator 2015-11-03T10:28:12
#
#-------------------------------------------------

QT       += core gui dbus x11extras svg sql dtkwidget

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

LIBS += -lX11 -lXext
TARGET = dde-osd
TEMPLATE = app
CONFIG += c++11 link_pkgconfig
PKGCONFIG += dframeworkdbus dtkgui gsettings-qt xcb-ewmh dtkwidget xrandr

SOURCES += main.cpp \
    container.cpp \
    manager.cpp \
    listview.cpp \
    delegate.cpp \
    model.cpp \
    abstractosdprovider.cpp \
    osdprovider.cpp \
    audioprovider.cpp \
    common.cpp \
    brightnessprovider.cpp \
    kblayoutprovider.cpp \
    displaymodeprovider.cpp \
    indicatorprovider.cpp \
    kblayoutindicator.cpp

HEADERS  += container.h \
    manager.h \
    listview.h \
    delegate.h \
    model.h \
    common.h \
    abstractosdprovider.h \
    osdprovider.h \
    audioprovider.h \
    brightnessprovider.h \
    kblayoutprovider.h \
    displaymodeprovider.h \
    indicatorprovider.h \
    kblayoutindicator.h \
    accessibledefine.h \
    accessible.h

isEmpty(PKGTYPE){
    PKGTYPE = deb
}

contains(PKGTYPE, deb) {
    QT += testlib
    SOURCES += unittest.cpp
    HEADERS += unittest.h
}

RESOURCES += \
    image.qrc \
    theme.qrc

include(notification/notification.pri)
include(notification-center/notification-center.pri)

isEmpty(PREFIX){
    PREFIX = /usr
}

target.path = $${PREFIX}/lib/deepin-daemon/

service_file.path = $${PREFIX}/share/dbus-1/services/
service_file.files = com.deepin.dde.osd.service

INSTALLS += service_file target
