# Build time environment setup

# All valid variable prefix:
# PREPEND_ENV: prepend a variables list to specified variable
# APPEND_ENV: append a variables list to specified variable
# SET_ENV: set a variable with given value
# DEFAULT_ENV: SET_ENV but not override if not empty
# Important note: PREPEND/APPEND must give the seperator in the first element
# Internal substitution:
# %ROOT%: Absoulte path to ingredients root

export PREPEND_ENV__LD_LIBRARY_PATH=(":" "%ROOT%/lib")
export PREPEND_ENV__QT_PLUGIN_PATH=(":" "%ROOT%/plugins")
export PREPEND_ENV__CMAKE_PREFIX_PATH=(":" "%ROOT%")

export SET_ENV__QT5PREFIX="%ROOT%"
