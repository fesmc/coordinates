# Shared build configuration for coordinates (dependency wiring).
#
# Loaded after the compiler and machine fragments (configme assembles them in
# the order: compiler -> machine -> netCDF -> common). References FFLAGS /
# FFLAGS_OPENMP (compiler) and INC_NC / LIB_NC (machine or auto-detected netCDF).
#
# coordinates links only against netCDF. INC_NC is folded into FFLAGS here
# because the compile rules in Makefile_coordinates.mk do not pass it
# explicitly (the legacy flat configs bundled it into FFLAGS_DEFAULT).

FFLAGS += $(INC_NC)

# OpenMP build (make openmp=1): append the compiler's OpenMP flag (FFLAGS_OPENMP,
# set in the compiler fragment).
ifeq ($(openmp), 1)
    FFLAGS += $(FFLAGS_OPENMP)
endif

# Extra link flags. -Wl,-zmuldefs is the default for Linux targets; the macbook
# machine fragment disables it (macOS ld rejects it) by setting LFLAGS_EXTRA =.
LFLAGS_EXTRA ?= -Wl,-zmuldefs
LFLAGS = $(LIB_NC) $(LFLAGS_EXTRA)
