@echo off
Setlocal enabledelayedexpansion
::CODER BY H605367 POWERD BY iBAT 1.6::

::head::
echo ping_ok>success.txt
date/t>>success.txt
time/t>>success.txt
echo ping_fail>fail.txt
date/t>>fail.txt
time/t>>fail.txt
date/t>result.txt
time/t>>result.txt

::clean the text&sent the time infor::
type memo.txt
pause
ip_source.txt
pause
set /P COLUMN=ip 地址在所粘贴文档的第几列:
echo ip地址在所粘贴文档的第%column%列
pause
::main program::
::notice ,you can change "for"prarmeter at next line::  
FOR /F "skip=10 tokens=%column% delims=," %%a IN (ip_source.txt) DO (
 ping %%a -n 1 >testtext.txt
 findstr "TTL" testtext.txt
  if ERRORLEVEL 1 (
    findstr "%%a" ip_source.txt>>fail.txt
    echo %%a 未PING通) else (
    findstr "%%a" ip_source.txt>>success.txt)
 type testtext.txt >>result.txt)

goto abcdefghijk 
skip first 10 lines,(use,as delims,)set every  column element equal a ,ping every a and save the result to test.txt . then check if there is a ttl in the test.txt.if dont then means the ping command fail ,sent the line where the a from to fail.txt.balabala ::  .
:abcdefghijk 

echo 批量测试完成
type success.txt>final.txt
type fail.txt>>final.txt
final.txt
pause
