@echo off

rem author: laplaciannin102
rem this bat file converts python script to exe file.

echo _________________________________________________________________________________________
echo this bat file converts python script to exe file.
echo _________________________________________________________________________________________
echo.

echo.
echo ========================================
echo compile start.
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

rem exe化対象のpythonスクリプトファイル名
set python_script_fname=%fname%.py


rem set requirements fname
set pkgs_list_fname=requirements.txt
set pkgs_list_fpath=.\%pkgs_list_fname%

rem constants
set compile_env_name=compile_env

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
echo ^>^>python ^-m venv %compile_env_name%
echo ========================================
echo.

call python -m venv %compile_env_name%

echo.
echo _________________________________________________________________________________________
echo.

rem activate
echo ========================================
echo Python仮想環境をactive化.
echo ^>^>^.^\%compile_env_name%^\Scripts^\activate^.bat
echo ========================================
echo.

call .\%compile_env_name%\Scripts\activate.bat

echo.
echo _________________________________________________________________________________________
echo.


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

rem call .\%compile_env_name%\Scripts\python.exe -m pip install --upgrade pip
call python -m pip install --upgrade pip

echo.
echo _________________________________________________________________________________________
echo.


echo ========================================
echo Python仮想環境上のinstall済ライブラリを確認.
echo ^>^>pip list
echo ========================================
echo.

call pip list

echo.
echo _________________________________________________________________________________________
echo.


rem pip install pyinstaller
echo ========================================
echo Python仮想環境に
echo Pythonスクリプトをexe化するライブラリ
echo pyinstallerをinstall.
echo ^>^>%pip_install_cmd% pyinstaller
echo ========================================
echo.

call %pip_install_cmd% pyinstaller

echo.
echo _________________________________________________________________________________________
echo.


echo ========================================
echo requirements.txtからinstall予定のライブラリを確認.
echo ^>^>type %pkgs_list_fpath%
echo ========================================
echo.

call type %pkgs_list_fpath%

echo.
echo _________________________________________________________________________________________
echo.


rem run pip install line by line from the file
for /f %%l in (%pkgs_list_fpath%) do (

    rem pip install
    echo ========================================
    echo Python仮想環境にライブラリをinstall.
    echo ^>^>%pip_install_cmd% "%%l"
    echo ========================================
    echo.

    call %pip_install_cmd% "%%l"

    echo.
    echo _________________________________________________________________________________________
    echo.

)


echo ========================================
echo Python仮想環境上のinstall済ライブラリを確認.
echo ^>^>pip list
echo ========================================
echo.

call pip list

echo.
echo _________________________________________________________________________________________
echo.


echo ========================================
echo pyinstallerのパスを確認.
echo ^>^>where pyinstaller
echo ========================================
echo.

call where pyinstaller

echo.
echo _________________________________________________________________________________________
echo.


echo ========================================
echo Pythonスクリプトをexe化.
echo ^>^>pyinstaller %python_script_fpath% ^-^-onefile
echo ========================================
echo.

rem call pyinstaller %python_script_fpath% --onefile --noconsole
call pyinstaller %python_script_fpath% --onefile

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
echo ^>^>rmdir ^/s ^/q ^.^\%compile_env_name%
echo ========================================
echo.

call rmdir /s /q .\%compile_env_name%

echo.
echo _________________________________________________________________________________________
echo.


echo.
echo ========================================
echo compile end.
echo ========================================
echo.

pause
