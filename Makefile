#specify usb or a valid Bluetooth connection
NXT=usb

#file extension we use
EXT=nxc

#source path
SRC_DIR=src

#build dir
BUILD_DIR=build

#the compiler we use
NXC=nbc

#options to pass to the compiler
OPTIONS=-Z2 -EF

#target name
PROGRAM=waage

all: $(PROGRAM).rxe

$(PROGRAM).rxe: ./$(SRC_DIR)/$(PROGRAM).$(EXT) Makefile
	$(NXC) -O=./$(BUILD_DIR)/$(PROGRAM).rxe $(OPTIONS) \
		        ./$(SRC_DIR)/$(PROGRAM).$(EXT)

download: ./$(SRC_DIR)/$(PROGRAM).$(EXT) Makefile
	$(NXC) -O=./$(BUILD_DIR)/$(PROGRAM).rxe $(OPTIONS) \
		        ./$(SRC_DIR)/$(PROGRAM).$(EXT) -s=$(NXT) -d
	
clean:
	rm $(BUILD_DIR)/$(PROGRAM).rxe
		   
