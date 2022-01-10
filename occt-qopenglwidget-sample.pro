TEMPLATE = app
QT += widgets
CONFIG += console

# source code of the sample
HEADERS = OcctQtViewer.h \
          MainWindow.h \
          ParentPage.h
SOURCES = main.cpp \
          OcctQtViewer.cpp \
          MainWindow.cpp \
          ParentPage.cpp
FORMS = MainWindow.ui \
        ParentPage.ui

OTHER_FILES = LICENSE.md\
              ReadMe.md \
              custom.pri.template

# target configuration
MY_TARGET_ABI = $${QMAKE_TARGET.arch}
mac { MY_TARGET_ABI = $${QMAKE_APPLE_DEVICE_ARCHS} }

MY_PLATFORM = platform
win32        { MY_PLATFORM = win64
} else:mac   { MY_PLATFORM = mac
} else:linux { MY_PLATFORM = lin
} else:unix  { MY_PLATFORM = unix
} else { warning (Unknown platform. "$$MY_PLATFORM" is used) }

MY_COMPILER = compiler
clang {                 MY_COMPILER = clang
} else:gcc {            MY_COMPILER = gcc
} else:win32-msvc2015 { MY_COMPILER = vc14
} else:win32-msvc2017 { MY_COMPILER = vc14
} else:win32-msvc {     MY_COMPILER = vc14
} else { warning (Unknown compiler. "$$MY_COMPILER" is used) }
MY_BUILDTYPE =
CONFIG(debug, debug|release) { MY_BUILDTYPE = d }
MY_PLATFORM_AND_COMPILER = $$MY_PLATFORM/$$MY_COMPILER

# paths to OCCT should be set by custom.pri, see custom.pri.template as example
exists($$PWD/custom.pri) { include($$PWD/custom.pri) }

# OCCT libraries to link
LIBS += -lTKernel -lTKGeomBase -lTKGeomAlgo -lTKG2d -lTKV3d -lTKG3d  -lTKHLR -lTKService -lTKMath -lTKBRep -lTKTopAlgo -lTKOpenGl -lTKPrim -lTKShHealing -lTKMesh
