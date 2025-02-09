# ----------------------------------------------------------------------
# The compiler and flags
CPP = g++
CFLAGS = -L/usr/lib/cmplrs/cxx -DPOSIX_4D9 -w -g
LFLAGS = -lm  # Link with math library
RM = rm -f
# ----------------------------------------------------------------------

# Explanation of macros:
#     $< is any dependent file
#     $@ is the target's full name

# Add suffix .cpp since it's not a default with make utility
.SUFFIXES: .cpp .o

# Define the target for compiling both programs
all: fixme fixed

# Compile fixme.cpp to create the executable "fixme"
fixme: fixme.cpp
	g++ -g -o fixme fixme.cpp

# Compile fixed.cpp to create the executable "fixed"
fixed: fixed.cpp
	g++ -g -o fixed fixed.cpp

# Clean the directory, remove executables and other generated files
clean:
	${RM} core fixme fixed log err

