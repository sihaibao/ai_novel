@echo off
chcp 65001 >nul 2>&1
echo ===================================================
echo           启动AI群聊核心引擎
echo ===================================================

cd /d "%~dp0"

echo 检查.NET环境...
dotnet --version >nul 2>&1
if errorlevel 1 (
    echo 错误: 未检测到.NET环境
    echo 请安装.NET 8.0或更高版本
    echo 下载地址: https://dotnet.microsoft.com/download
    pause
    exit /b 1
)

echo 当前.NET版本:
dotnet --version

echo.
echo 还原NuGet包...
dotnet restore start.csproj
if errorlevel 1 (
    echo 警告: NuGet包还原失败，尝试继续运行...
)

echo.
echo ===================================================
echo           AI群聊核心引擎配置
echo ===================================================
echo 支持的AI平台:
echo 1. OpenAI (需要API Key)
echo 2. 智谱AI (需要API Key) 
echo 3. 其他兼容OpenAI接口的平台
echo.
echo 请确保已配置相应的API密钥
echo ===================================================
echo.

echo 构建并启动应用程序...
dotnet run --project start.csproj

if errorlevel 1 (
    echo.
    echo 启动失败，尝试其他方式...
    echo 编译项目...
    dotnet build start.csproj
    if errorlevel 1 (
        echo 编译失败，请检查代码错误
        pause
        exit /b 1
    )
    
    echo 运行编译后的程序...
    dotnet bin\Debug\net8.0\start.dll
)

echo.
echo ===================================================
echo           群聊核心引擎已关闭
echo ===================================================
pause
