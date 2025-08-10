@echo off
chcp 65001 >nul 2>&1
title AI小说创作平台 - 多样智能

:main_menu
cls
echo ===================================================
echo                AI小说创作平台
echo                   多样智能
echo ===================================================
echo.
echo        🚀 请选择要启动的模块:
echo.
echo   1. 📖 拆书分析引擎    - 智能分析小说结构
echo   2. 💬 AI群聊核心      - 多角色对话系统  
echo   3. 🌐 WebUI界面       - 网页创作界面
echo   4. 🔍 向量化处理      - 文本语义检索
echo   5. 🧪 测试模块        - API接口测试
echo   6. ❓ 帮助信息        - 查看使用说明
echo   0. 🚪 退出程序
echo.
echo ===================================================
set /p choice=请输入您的选择 (0-6): 

if "%choice%"=="1" goto chaishu
if "%choice%"=="2" goto group  
if "%choice%"=="3" goto webui
if "%choice%"=="4" goto vector
if "%choice%"=="5" goto test
if "%choice%"=="6" goto help
if "%choice%"=="0" goto exit
goto invalid_choice

:chaishu
echo.
echo 正在启动拆书分析引擎...
cd /d "%~dp0\chaishu"
if exist "启动拆书分析.bat" (
    call "启动拆书分析.bat"
) else (
    echo 错误: 启动脚本不存在，请检查chaishu目录
    pause
)
goto main_menu

:group
echo.
echo 正在启动AI群聊核心...
cd /d "%~dp0\group"
if exist "启动群聊核心.bat" (
    call "启动群聊核心.bat"
) else (
    echo 错误: 启动脚本不存在，请检查group目录
    pause
)
goto main_menu

:webui
echo.
echo 正在启动WebUI界面...
cd /d "%~dp0\open-webui"
if exist "启动WebUI界面.bat" (
    call "启动WebUI界面.bat"
) else (
    echo 错误: 启动脚本不存在，请检查open-webui目录
    pause
)
goto main_menu

:vector
echo.
echo 正在启动向量化处理...
cd /d "%~dp0\vector"
if exist "启动向量化处理.bat" (
    call "启动向量化处理.bat"
) else (
    echo 错误: 启动脚本不存在，请检查vector目录
    pause
)
goto main_menu

:test
echo.
echo 正在启动测试模块...
cd /d "%~dp0\test"
if exist "启动测试模块.bat" (
    call "启动测试模块.bat"
) else (
    echo 错误: 启动脚本不存在，请检查test目录
    pause
)
goto main_menu

:help
cls
echo ===================================================
echo                使用说明
echo ===================================================
echo.
echo 📖 拆书分析引擎:
echo    - 将小说txt文件放入chaishu/dataChai目录
echo    - 自动分割章节并进行AI分析
echo    - 生成人物、剧情、时间线分析报告
echo.
echo 💬 AI群聊核心:
echo    - C#编写的高性能AI对话引擎
echo    - 支持多角色群聊功能
echo    - 需要配置AI平台API密钥
echo.
echo 🌐 WebUI界面:
echo    - 基于FastAPI的网页界面
echo    - 支持30+语言，中文优化
echo    - 访问地址: http://localhost:8080
echo.
echo 🔍 向量化处理:
echo    - 文本语义向量化转换
echo    - 支持语义搜索和相似度计算
echo    - 用于知识库检索
echo.
echo 🧪 测试模块:
echo    - API接口功能测试
echo    - 支持多种AI平台测试
echo.
echo ===================================================
echo 环境要求:
echo - Python 3.8+ (拆书、WebUI、向量化、测试)
echo - .NET 8.0+   (群聊核心)
echo - 有效的AI平台API密钥
echo ===================================================
echo.
pause
goto main_menu

:invalid_choice
echo.
echo ⚠️  无效的选择，请输入 0-6 之间的数字
pause
goto main_menu

:exit
echo.
echo 👋 感谢使用AI小说创作平台！
echo    项目地址: https://github.com/duoyang666/ai_novel
echo.
pause
exit
