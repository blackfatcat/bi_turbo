IF NOT EXIST "bin" mkdir "bin"
IF NOT EXIST "bin/wasm" mkdir "bin/wasm"

cmake --build build/wasm --target clean

cmake --build build/wasm

emcc -g build/wasm/libbi_turbo.core.a -o bin/wasm/bi_turbo.core.js

pause