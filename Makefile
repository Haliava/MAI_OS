CXX			:= g++
CXX_FLAGS	:= -std=c++20

BIN			:= bin
SRC			:= src
EXECUTABLE	:= main
CHILD1		:= child1
CHILD2		:= child2

build: $(BIN)/$(EXECUTABLE)
	@echo "Building..."

run: clear build
	@echo "Executing..."
	$(BIN)/$(EXECUTABLE)

$(BIN):
	mkdir $@

$(BIN)/$(EXECUTABLE): $(BIN) | $(BIN)/$(CHILD1)
	$(CXX) $(CXX_FLAGS) -o $@ $(SRC)/$(EXECUTABLE).cpp $(SRC)/utils.cpp

$(BIN)/$(CHILD1): $(BIN) | $(BIN)/$(CHILD2)
	$(CXX) $(CXX_FLAGS) -o $@ $(SRC)/$(CHILD1).cpp $(SRC)/utils.cpp

$(BIN)/$(CHILD2): $(BIN)
	$(CXX) $(CXX_FLAGS) -o $@ $(SRC)/$(CHILD2).cpp $(SRC)/utils.cpp

clear:
	@echo "Clearing..."
	-rm -r $(BIN)

