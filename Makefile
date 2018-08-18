# source file and object file share the same name
SOURCE  := $(wildcard *.c) $(wildcard *.cpp)
OBJS    := $(patsubst %.c,%.o,$(patsubst %.cpp,%.o,$(SOURCE)))

TARGET  := hotplugtest

# compile arguments
CC		:= gcc
LIBS    := -lusb-1.0 # link the libusb-1.0.so
LDFLAGS := -L/usr/lib64 -L/lib64
DEFINES :=
INCLUDE :=
CFLAGS  := -g -Wall -O3 $(DEFINES) $(INCLUDE)
CXXFLAGS:= $(CFLAGS)

.PHONY : clean distclean rebuild

all : $(TARGET)

rebuild: distclean all

clean :
	rm -fr *.so
	rm -fr *.o

distclean : clean
	rm -fr $(TARGET)

$(TARGET) : $(OBJS)
	$(CC) $(CXXFLAGS) -o $@ $(OBJS) $(LDFLAGS) $(LIBS)
