# annn convert py2exe

- author: laplaciannin102(Kosuke Asada)
- date: 2021/05/10
- version: 0.0.1

---

## Table of Contents

- [annn convert py2exe](#annn-convert-py2exe)
  - [Table of Contents](#table-of-contents)
  - [annn_convert_py2exe説明](#annn_convert_py2exe説明)
  - [ファイル説明](#ファイル説明)
  - [使用手順](#使用手順)

---

## annn_convert_py2exe説明

- Windows10向けbatファイル.
- py2exeと書いてあるが, ライブラリpy2exeは使用していない.
- pyinstallerを使用している.

---

## ファイル説明

- get_python_requirements.bat
  - Pythonスクリプトの依存ライブラリをrequirements.txtとして出力する.
  - 内部ではdephellライブラリを使用.

- convert_py2exe.bat
  - Pythonスクリプトをexe化するbatファイル.
  - exe化対象のPythonスクリプトをドラッグアンドドロップして使用.
  - 同じディレクトリ内に必要なライブラリのリストが記載されたrequirements.txtが必要.
  - 内部ではpyinstallerライブラリを使用.

- convert_py2exe_with_log.bat
  - convert_py2exe.batをログ出力ありで実行する.
  - exe化対象のPythonスクリプトをドラッグアンドドロップして使用.
  - 同じディレクトリ内に必要なライブラリのリストが記載されたrequirements.txtが必要.
  - 内部ではpyinstallerライブラリを使用.

---

## 使用手順

1. get_python_requirements.batにexe化対象のPythonスクリプトをドラッグアンドドロップ.
2. 出力されたrequirements.txtを一部編集する.
   - 例えばpandas.DataFrameのto_excel()関数を使用した場合は別途openpyxlをrequirements.txtに追記しておく必要あり.
3. convert_py2exe_with_log.batにexe化対象のPythonスクリプトをドラッグアンドドロップ.
4. distディレクトリ内部にexeファイルが出力される.

