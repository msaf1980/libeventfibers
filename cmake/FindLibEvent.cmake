find_path(LIBEVENT_INCLUDE_DIR event2/event.h
	HINTS $ENV{LIBEVENT_DIR}
	PATH_SUFFIXES include
	PATHS /usr/local /usr
)
find_library(LIBEVENT_LIBRARY
  NAMES event
  HINTS $ENV{LIBEV_DIR}
  PATH_SUFFIXES lib
  PATHS /usr/local /usr
)
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LibEvent DEFAULT_MSG LIBEVENT_LIBRARY LIBEVENT_INCLUDE_DIR)
mark_as_advanced(LIBEVENT_INCLUDE_DIR LIBEVENT_LIBRARY)
