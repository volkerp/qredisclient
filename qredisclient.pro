TEMPLATE = lib
CONFIG += staticlib
VERSION = 0.1.0
TARGET = qredisclient

include($$PWD/qredisclient.pri)

isEmpty(DESTDIR) {
    DESTDIR = $$PWD
}

OBJECTS_DIR = $$DESTDIR/obj
MOC_DIR = $$DESTDIR/obj
RCC_DIR = $$DESTDIR/obj

unix {
    isEmpty(PREFIX) {
        PREFIX_ = /usr/local
    }
    else {
        PREFIX_ = $${PREFIX}
    }
    isEmpty(LIB_DIR) {
        LIB_DIR_ = $${PREFIX_}/lib
    } else {
        LIB_DIR_ = $${LIB_DIR}
    }
    isEmpty(INCLUDE_DIR) {
        INCLUDE_DIR_ = $${PREFIX_}/include/qredisclient
    } else {
        INCLUDE_DIR_ = $${INCLUDE_DIR}
    }

    includes.path = $${INCLUDE_DIR_}
    includes.files = $$PWD/src/qredisclient/*.h

    # install library target
    target.path = $${LIB_DIR_}

    INSTALLS *= target includes
}

