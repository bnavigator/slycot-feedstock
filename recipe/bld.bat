
:: correct FC, apparently pointed to host prefix??
set BLAS_ROOT=%PREFIX%
set LAPACK_ROOT=%PREFIX%
if exist %PREFIX%\Scripts\f2py.exe (
  set F2PY=%PREFIX%\Scripts\f2py.exe
) else (
  set F2PY=%PREFIX%\Scripts\f2py.bat
)

"%PYTHON%" setup.py install

if errorlevel 1 exit 1
