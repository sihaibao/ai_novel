@echo off
chcp 65001 >nul 2>&1
echo ===================================================
echo           启动AI小说创作WebUI界面
echo ===================================================

cd /d "%~dp0\backend"

if not exist venv (
    echo 创建虚拟环境...
    python -m venv venv
    if errorlevel 1 (
        echo 错误: 无法创建虚拟环境，请确保已安装Python 3.8+
        pause
        exit /b 1
    )
)

echo 激活虚拟环境...
call venv\Scripts\activate.bat
if errorlevel 1 (
    echo 错误: 无法激活虚拟环境
    pause
    exit /b 1
)

echo 检查并安装依赖...
if exist requirements.txt (
    echo 安装项目依赖...
    pip install -r requirements.txt
    if errorlevel 1 (
        echo 使用国内镜像重试...
        pip install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple
    )
) else (
    echo 安装基础依赖...
    pip install fastapi uvicorn sqlite3 python-multipart
)

echo.
echo ===================================================
echo           魔改版Open WebUI配置
echo ===================================================
echo 功能特色:
echo 1. 30+语言支持，中文界面优化
echo 2. 支持多种AI模型接入
echo 3. 文档上传和知识库功能
echo 4. 对话历史管理
echo 5. 自定义模型配置
echo.
echo 访问地址: http://localhost:8080
echo ===================================================
echo.

set HOST=0.0.0.0
set PORT=8080

echo 启动WebUI服务器...
echo 启动命令: uvicorn main:app --host %HOST% --port %PORT% --forwarded-allow-ips '*'

python -m uvicorn main:app --host %HOST% --port %PORT% --forwarded-allow-ips '*'

if errorlevel 1 (
    echo.
    echo 启动失败，尝试其他端口...
    set PORT=8081
    echo 尝试端口: %PORT%
    python -m uvicorn main:app --host %HOST% --port %PORT% --forwarded-allow-ips '*'
)

echo.
echo ===================================================
echo           WebUI服务器已关闭
echo ===================================================
echo 如需重新启动，请重新运行此脚本
pause
