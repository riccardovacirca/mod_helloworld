# Module mod_helloworld Makefile
# Compiles module as static library

# Load project configuration
ifeq ($(wildcard ../../.env),)
$(error ERROR: File ../../.env not found!)
endif

include ../../.env
export

# Compiler settings
CC := clang
# Use CFLAGS from parent Makefile if provided, otherwise default to debug
ifeq ($(origin CFLAGS), command line)
    # CFLAGS passed from parent Makefile (debug or release)
    MODULE_CFLAGS := $(CFLAGS)
else
    # Default debug flags when called directly
    MODULE_CFLAGS := -std=gnu11 -g -DM_MG_DEBUG
endif
INCLUDES := -I../.. -I../../include -I../../modules -I../../lib/mongoose -I../../lib/microservice -I/usr/include -I/usr/include/apr-1.0

# Module files
MODULE_SOURCES := mod_helloworld.c
MODULE_OBJECTS := $(MODULE_SOURCES:.c=.o)
LIBRARY := libmod_helloworld.a

all: $(LIBRARY)

$(LIBRARY): $(MODULE_OBJECTS)
	ar rcs $(LIBRARY) $(MODULE_OBJECTS)

%.o: %.c
	$(CC) $(MODULE_CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	@rm -f *.o $(LIBRARY)

.PHONY: all clean
