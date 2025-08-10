@echo off
chcp 65001 >nul 2>&1
echo ===================================================
echo           启动AI拆书分析引擎
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
    echo langchain==0.1.7 > requirements.txt
    echo openai >> requirements.txt
    echo python-dotenv >> requirements.txt
)

pip install -r requirements.txt
if errorlevel 1 (
    echo 尝试手动安装核心依赖...
    pip install langchain==0.1.7 -i https://mirrors.aliyun.com/pypi/simple
)

echo.
echo ===================================================
echo           拆书分析引擎已就绪
echo ===================================================
echo 功能说明:
echo 1. 自动分割小说章节
echo 2. AI智能分析剧情、人物、行动线
echo 3. 生成时间线和分析报告
echo.
echo 使用方法:
echo 1. 将小说txt文件放入dataChai文件夹
echo 2. 运行分析程序
echo ===================================================
echo.

python test.py

if errorlevel 1 (
    echo.
    echo 程序执行出错，请检查:
    echo 1. 是否正确配置了API密钥
    echo 2. 是否有要分析的小说文件
    echo 3. 网络连接是否正常
)

echo.
echo 分析完成！结果保存在dataChai文件夹中
pause
