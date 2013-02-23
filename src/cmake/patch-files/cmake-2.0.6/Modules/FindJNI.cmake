#
# This module finds if Java is installed and determines where the
# include files and libraries are. It also determines what the name of
# the library is. This code sets the following variables:
#
#  JAVA_AWT_LIB_PATH     = the path to where the jawt library is
#  JAVA_INCLUDE_PATH     = the path to where jni.h can be found
#  JAVA_AWT_INCLUDE_PATH = the path to where jni.h can be found
# 

SET(JAVA_AWT_LIBRARY_DIRECTORIES
  /usr/java/jdk1.5.0/jre/lib/i386
  /usr/java/jdk1.5.0/jre/lib/amd64
  /usr/java/j2sdk1.4.2_02/jre/lib/i386
  /usr/java/j2sdk1.4.2_02/jre/lib/ia64
  )

SET(JAVA_AWT_INCLUDE_DIRECTORIES
  "[HKEY_LOCAL_MACHINE\\SOFTWARE\\JavaSoft\\Java Development Kit\\1.4;JavaHome]/include"
  "[HKEY_LOCAL_MACHINE\\SOFTWARE\\JavaSoft\\Java Development Kit\\1.3;JavaHome]/include"
  /usr/include 
  /usr/local/include
  /usr/lib/java/include
  /usr/local/lib/java/include
  )

FOREACH(JAVA_PROG "${JAVA_RUNTIME}" "${JAVA_COMPILE}" "${JAVA_ARCHIVE}")
  GET_FILENAME_COMPONENT(jpath "${JAVA_PROG}" PATH)
  FOREACH(JAVA_INC_PATH ../include ../java/include ../share/java/include)
    IF(EXISTS ${jpath}/${JAVA_INC_PATH})
      SET(JAVA_AWT_INCLUDE_DIRECTORIES ${JAVA_AWT_INCLUDE_DIRECTORIES} "${jpath}/${JAVA_INC_PATH}")
    ENDIF(EXISTS ${jpath}/${JAVA_INC_PATH})
  ENDFOREACH(JAVA_INC_PATH)
  FOREACH(JAVA_LIB_PATH 
    ../lib ../jre/lib ../jre/lib/i386 
    ../java/lib ../java/jre/lib ../java/jre/lib/i386 
    ../share/java/lib ../share/java/jre/lib ../share/java/jre/lib/i386)
    IF(EXISTS ${jpath}/${JAVA_LIB_PATH})
      SET(JAVA_AWT_LIBRARY_DIRECTORIES ${JAVA_AWT_LIBRARY_DIRECTORIES} "${jpath}/${JAVA_LIB_PATH}")
    ENDIF(EXISTS ${jpath}/${JAVA_LIB_PATH})
  ENDFOREACH(JAVA_LIB_PATH)
ENDFOREACH(JAVA_PROG)

IF(APPLE)
  IF(EXISTS ~/Library/Frameworks/JavaEmbedding.framework)
    SET(JAVA_HAVE_FRAMEWORK 1)
  ENDIF(EXISTS ~/Library/Frameworks/JavaEmbedding.framework)
  IF(EXISTS /Library/Frameworks/JavaEmbedding.framework)
    SET(JAVA_HAVE_FRAMEWORK 1)
  ENDIF(EXISTS /Library/Frameworks/JavaEmbedding.framework)
  IF(EXISTS /System/Library/Frameworks/JavaEmbedding.framework)
    SET(JAVA_HAVE_FRAMEWORK 1)
  ENDIF(EXISTS /System/Library/Frameworks/JavaEmbedding.framework)
  IF(JAVA_HAVE_FRAMEWORK)
    IF(NOT JAVA_AWT_LIBRARY)
      SET (JAVA_AWT_LIBRARY "-framework JavaVM -framework JavaEmbedding" CACHE FILEPATH "Java Frameworks" FORCE)
    ENDIF(NOT JAVA_AWT_LIBRARY)
    SET(JAVA_AWT_INCLUDE_DIRECTORIES ${JAVA_AWT_INCLUDE_DIRECTORIES}
      ~/Library/Frameworks/JavaVM.framework/Headers
      /Library/Frameworks/JavaVM.framework/Headers
      /System/Library/Frameworks/JavaVM.framework/Headers
      ~/Library/Frameworks/JavaEmbedding.framework/Headers
      /Library/Frameworks/JavaEmbedding.framework/Headers
      /System/Library/Frameworks/JavaEmbedding.framework/Headers
      )
  ENDIF(JAVA_HAVE_FRAMEWORK)
ELSE(APPLE)
  FIND_LIBRARY(JAVA_AWT_LIBRARY jawt 
    PATHS ${JAVA_AWT_LIBRARY_DIRECTORIES}
  )
ENDIF(APPLE)

# add in the include path    
FIND_PATH(JAVA_INCLUDE_PATH jni.h 
  ${JAVA_AWT_INCLUDE_DIRECTORIES}
)

FIND_PATH(JAVA_INCLUDE_PATH2 jni_md.h 
  ${JAVA_AWT_INCLUDE_DIRECTORIES}
  ${JAVA_INCLUDE_PATH}/win32
  ${JAVA_INCLUDE_PATH}/linux
)

FIND_PATH(JAVA_AWT_INCLUDE_PATH jawt.h 
          ${JAVA_AWT_INCLUDE_DIRECTORIES} ${JAVA_INCLUDE_PATH} )

MARK_AS_ADVANCED(
  JAVA_AWT_LIBRARY
  JAVA_AWT_INCLUDE_PATH
  JAVA_INCLUDE_PATH
  JAVA_INCLUDE_PATH2
)
