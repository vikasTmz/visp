##
## Copyright Projet Lagadic / IRISA-INRIA Rennes, 2011
## www: http://www.irisa.fr/lagadic
##
## Author: Celine Teuliere

IF(WIN32)
  FIND_PATH(LIBFREENECT_INCLUDE_DIR libfreenect.h
    $ENV{LIBFREENECT_HOME}/include
    )
  FIND_LIBRARY(LIBFREENECT_LIBRARY libfreenect
    $ENV{LIBFREENECT_HOME}/lib
    "c:/libfreenect/lib"
    )
ELSE(WIN32) 
  FIND_PATH(LIBFREENECT_INCLUDE_DIR libfreenect.h
    $ENV{LIBFREENECT_HOME}/include/
    )
  FIND_LIBRARY(LIBFREENECT_LIBRARY libfreenect.a
    $ENV{LIBFREENECT_HOME}/lib
    $ENV{LIBFREENECT_HOME}/build/lib
    /usr/lib
    /usr/local/lib
    )
ENDIF(WIN32)

## --------------------------------

IF(NOT LIBFREENECT_INCLUDE_DIR)
  MESSAGE(SEND_ERROR "libfreenect include dir not found.")
ENDIF(NOT LIBFREENECT_INCLUDE_DIR)

IF(LIBFREENECT_LIBRARY)
  SET(LIBFREENECT_LIBRARIES ${LIBFREENECT_LIBRARY})
ELSE(LIBFREENECT_LIBRARY)
  MESSAGE(SEND_ERROR "libfreenect library not found.")
ENDIF(LIBFREENECT_LIBRARY)


IF(LIBFREENECT_LIBRARIES AND LIBFREENECT_INCLUDE_DIR)
  SET(LIBFREENECT_INCLUDE_DIR ${LIBFREENECT_INCLUDE_DIR})
  SET(LIBFREENECT_DIR ${LIBFREENECT_INCLUDE_DIR})
  SET(LIBFREENECT_FOUND TRUE)
ELSE(LIBFREENECT_LIBRARIES AND LIBFREENECT_INCLUDE_DIR)
  SET(LIBFREENECT_FOUND FALSE)
ENDIF(LIBFREENECT_LIBRARIES AND LIBFREENECT_INCLUDE_DIR)

MARK_AS_ADVANCED(
  LIBFREENECT_INCLUDE_DIR
  LIBFREENECT_LIBRARIES
  LIBFREENECT_LIBRARY
  )