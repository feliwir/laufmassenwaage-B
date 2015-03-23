#specify usb or a valid Bluetooth connection
NXT=usb

#file extension we use
EXT=nxc

#source dir
SRC_DIR=src

#doxygen dir
DOXY_DIR=doxygen

#build dir
BUILD_DIR=build

#the compiler we use
NXC=nbc

#options to pass to the compiler
OPTIONS=-Z2

#target name
PROGRAM=waage

all: $(PROGRAM).rxe

$(PROGRAM).rxe: ./$(SRC_DIR)/$(PROGRAM).$(EXT) Makefile
	$(NXC) -O=./$(BUILD_DIR)/$(PROGRAM).rxe $(OPTIONS) \
		        ./$(SRC_DIR)/$(PROGRAM).$(EXT)

download: ./$(SRC_DIR)/$(PROGRAM).$(EXT) Makefile
	$(NXC) -O=./$(BUILD_DIR)/$(PROGRAM).rxe $(OPTIONS) \
		        ./$(SRC_DIR)/$(PROGRAM).$(EXT) -s=$(NXT) -d
		        
doc: ./$(DOXY_DIR)/Doxyfile ./$(DOXY_DIR)/*.dox Makefile 
		doxygen ./doxygen/Doxyfile
	
clean:
	rm $(BUILD_DIR)/$(PROGRAM).rxe
		   
