CC := clang -Xclang -load -Xclang /home/sangeeta/fpsanitizer/build/lib/LLVMFPInstrument.so
SRC_DIR := .
OBJ_DIR := .
SRC_FILES := $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC_FILES))
LDFLAGS := -I . -L/home/sangeeta/fpsanitizer/runtime/obj -lfpsanitizer -DSPEC_CPU -DNDEBUG -I. -DFN -DFAST -DCONGRAD_TMP_VECTORS -DDSLASH_TMP_LINKS   -O0 -fno-strict-aliasing -DSPEC_CPU_LP64  
CPPFLAGS := -lmpfr -lm
CXXFLAGS :=  -I .  -DSPEC_CPU -DNDEBUG -I. -DFN -DFAST -DCONGRAD_TMP_VECTORS -DDSLASH_TMP_LINKS   -O0 -fno-strict-aliasing -DSPEC_CPU_LP64

milc: $(OBJ_FILES)
	$(CC) $(CPPFLAGS) $(LDFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CXXFLAGS) -c -o $@ $<

clean:
	rm -rf milc *.out *.o *.dSYM
