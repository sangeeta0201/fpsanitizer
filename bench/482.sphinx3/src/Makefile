CC := clang -Xclang -load -Xclang /home/sangeeta/fpsanitizer/build/lib/LLVMFPInstrument.so
#CC := clang
SRC_DIR := .
OBJ_DIR := .
SRC_FILES := $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC_FILES))
LDFLAGS := -I . -L/home/sangeeta/fpsanitizer/runtime/obj -lfpsanitizer -DSPEC_CPU -DNDEBUG -I. -DSPEC_CPU -DHAVE_CONFIG_H -I.    -DSPEC_CPU_LP64 -Ilibutil 
CPPFLAGS :=  -Ilibutil -lmpfr -lm
CXXFLAGS :=  -I .  -DSPEC_CPU -DNDEBUG -I. -DFN -DFAST -DCONGRAD_TMP_VECTORS -DDSLASH_TMP_LINKS   -O1 -fno-slp-vectorize -fno-vectorize -fno-tree-vectorize  -fno-strict-aliasing -DSPEC_CPU_LP64 -Ilibutil

sphinx3: $(OBJ_FILES)
	$(CC) $(CPPFLAGS) $(LDFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CXXFLAGS) -c -o $@ $<

clean:
	rm -rf sphinx3 *.out *.o *.dSYM
