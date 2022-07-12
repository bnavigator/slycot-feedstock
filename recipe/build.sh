# override scikit-build handling for macOS arm platforn on conda-forge cross-compiling
if [ "$target_platform" = "osx-arm64" ]; then
  export CMAKE_OSX_ARCHITECTURES="arm64"
  # workaround for https://github.com/scikit-build/scikit-build/issues/589
  rm -rf $PREFIX/lib/libpython$PY_VER.dylib
  ln -sf $PREFIX/lib/libc++.dylib $PREFIX/lib/libpython$PY_VER.dylib
fi

export SKBUILD_CONFIGURE_OPTIONS="-DBLA_VENDOR=Generic"
$PYTHON -m pip install -v .
