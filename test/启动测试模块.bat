@echo off
chcp 65001 >nul 2>&1
echo ===================================================
echo           启动AI测试模块
echo ===================================================

cd /d "%~dp0"

if not exist venv (
    echo 创建虚拟环境...
    python -m venv venv
    if errorlevel 1 (
        echo 错误: 无法创建虚拟环境，请确保已安装Python
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
if not exist requirements.txt (
    echo 创建requirements.txt文件...
    echo dashscope > requirements.txt
    echo requests >> requirements.txt
    echo python-dotenv >> requirements.txt
)

pip install -r requirements.txt
if errorlevel 1 (
    echo 使用国内镜像重试...
    pip install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple
)

echo.
echo ===================================================
echo           AI测试模块说明
echo ===================================================
echo 当前模块功能:
echo 1. 阿里通义千问API测试 (zhaiyao.py)
echo 2. 其他AI接口测试
echo.
echo 注意事项:
echo 1. 请确保已配置有效的API密钥
echo 2. 检查网络连接状态
echo 3. 注意API调用频率限制
echo ===================================================
echo.

:menu
echo 请选择要运行的测试:
echo 1. 运行阿里通义千问摘要测试
echo 2. 退出
echo.
set /p choice=请输入选择 (1-2): 

if "%choice%"=="1" (
    echo 启动阿里通义千问测试...
    python zhaiyao.py
    echo.
    goto menu
) else if "%choice%"=="2" (
    goto end
) else (
    echo 无效选择，请重新输入
    goto menu
)

:end
echo.
echo ===================================================
echo           测试模块已退出
echo ===================================================
pause
