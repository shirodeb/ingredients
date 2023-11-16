export PREPEND_ENV__LD_LIBRARY_PATH=(":" "%ROOT%/lib/")

export INGREDIENT_BIND=(
    "/usr/lib/x86_64-linux-gnu/ld-2.28.so::%ROOT%/lib/ld-linux-x86-64.so.2"
    "/usr/lib/x86_64-linux-gnu/libc.so.6::%ROOT%/lib/libc.so.6"
)
