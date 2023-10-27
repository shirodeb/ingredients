# Build time environment setup

# All valid variable prefix:
# PREPEND_ENV: prepend a variables list to specified variable
# APPEND_ENV: append a variables list to specified variable
# SET_ENV: set a variable with given value
# DEFAULT_ENV: SET_ENV but not override if not empty
# Important note: PREPEND/APPEND must give the seperator in the first element
# Internal substitution:
# %ROOT%: Absoulte path to ingredients root

export PREPEND_ENV__PATH=(":" "%ROOT%/bin/")
export APPEND_ENV__LD_LIBRARY_PATH=(":" "%ROOT%/lib64/" "%ROOT%/lib/gcc/aarch64-unknown-linux-gnu/13.2.0")
export SET_ENV__CC="%ROOT%/bin/gcc"
export DEFAULT_ENV__CXX="%ROOT%/bin/g++"
