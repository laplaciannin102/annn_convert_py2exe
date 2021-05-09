@echo off

rem author: laplaciannin102
rem this bat file get python script requirements.txt file.

echo _________________________________________________________________________________________
echo this bat file get python script requirements.txt file.
echo _________________________________________________________________________________________
echo.

echo.
echo ========================================
echo process start.
echo ========================================
echo.

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

set python_script_fname=%fname%.py


rem set requirements fname
set pkgs_list_fname=requirements.txt
set pkgs_list_fpath=.\%pkgs_list_fname%

rem constants
set getreq_env_name=getreq_env

rem pip install command
set pip_install_cmd=pip install



echo ========================================
echo exe化対象のPythonスクリプトファイル名を確認.
echo ========================================
echo.

echo target python script:
echo %python_script_fpath%

echo.
echo _________________________________________________________________________________________
echo.


rem create env
echo ========================================
echo compile用のPython仮想環境を作成.
echo ^>^>python ^-m venv %getreq_env_name%
echo ========================================
echo.

call python -m venv %getreq_env_name%

echo.
echo _________________________________________________________________________________________
echo.

rem activate
echo ========================================
echo Python仮想環境をactive化.
echo ^>^>^.^\%getreq_env_name%^\Scripts^\activate^.bat
echo ========================================
echo.

call .\%getreq_env_name%\Scripts\activate.bat

echo.
echo _________________________________________________________________________________________
echo.


rem change current directory
cd /d %dpath%


echo ========================================
echo Pythonのversionを確認.
echo ^>^>python ^-V
echo ========================================
echo.

call python -V

echo.
echo _________________________________________________________________________________________
echo.


rem update pip
echo ========================================
echo pipをupdate.
echo ^>^>python ^-m pip install ^-^-upgrade pip
echo ========================================
echo.

rem call .\%getreq_env_name%\Scripts\python.exe -m pip install --upgrade pip
call python -m pip install --upgrade pip

echo.
echo _________________________________________________________________________________________
echo.


rem install dephell
rem reference: https://dephell.readthedocs.io/installation.html
echo ========================================
echo Pythonスクリプトの依存ライブラリをテキスト出力するライブラリdephellをinstall.
echo ^>^>python ^-m pip install dephell[full]
echo ========================================
echo.

call python -m pip install dephell[full]

echo.
echo _________________________________________________________________________________________
echo.


echo ========================================
echo Pythonスクリプトの依存ライブラリをテキスト出力.
echo ^>^>python -m dephell deps convert ^-^-from^=%python_script_fname% ^-^-to^=%pkgs_list_fname%
echo ========================================
echo.

call python -m dephell deps convert --from=%python_script_fname% --to=%pkgs_list_fname%

echo.
echo _________________________________________________________________________________________
echo.


echo ========================================
echo Python仮想環境を非active化.
echo ^>^>deactivate
echo ========================================
echo.

call deactivate

echo.
echo _________________________________________________________________________________________
echo.


echo ========================================
echo 不要ファイル・ディレクトリの削除.
echo ^>^>rmdir ^/s ^/q ^.^\%getreq_env_name%
echo ========================================
echo.

call rmdir /s /q .\%getreq_env_name%

echo.
echo _________________________________________________________________________________________
echo.


echo.
echo ========================================
echo process end.
echo ========================================
echo.

pause
