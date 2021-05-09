@echo off

rem author: laplaciannin102(Kosuke Asada)
rem this bat file converts python script to exe file with log file.

rem change code UTF-8
chcp 65001

rem change code Shift_JIS
rem chcp 932


rem get command args
set arg1=%1
set python_script_fpath=%arg1%

rem ディレクトリ名取得
set dpath=%~dp1
set dpath=%dpath:~0,-1%

echo directory path is
echo %dpath%
echo.

rem change current directory
cd /d %dpath%

rem ファイル名取得
for /f %%i in ('echo %python_script_fpath%') do set fname=%%~ni

rem exe化対象のpythonスクリプトファイル名
set python_script_fname=%fname%.py

rem pythonをexe化するbatファイル
set convert_bat_fpath=.\convert_py2exe.bat

rem logファイル名
set log_fpath=.\convert_py2exe_result.log

echo.
echo ========================================
echo ログファイル出力ありでPythonスクリプトをexe化する.
echo ^>^>%convert_bat_fpath% %python_script_fname% ^> %log_fpath% 2^>^&1
echo ========================================
echo.

call %convert_bat_fpath% %python_script_fname% > %log_fpath% 2>&1

rem 追記パターン
rem call %convert_bat_fpath% %python_script_fname% >> %log_fpath% 2>&1

