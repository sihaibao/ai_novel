@echo off
chcp 65001 >nul 2>&1
echo ===================================================
echo           启动文本向量化处理引擎
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
    echo numpy > requirements.txt
    echo sentence-transformers >> requirements.txt
    echo faiss-cpu >> requirements.txt
    echo scikit-learn >> requirements.txt
    echo jieba >> requirements.txt
)

pip install -r requirements.txt
if errorlevel 1 (
    echo 使用国内镜像重试...
    pip install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple
)

echo.
echo ===================================================
echo           文本向量化处理引擎配置
echo ===================================================
echo 功能说明:
echo 1. 文本向量化转换
echo 2. 语义相似度计算
echo 3. 文档检索和匹配
echo 4. 知识库向量化存储
echo.
echo 支持的向量模型:
echo 1. m3e本地模型 (推荐)
echo 2. sentence-transformers在线模型
echo 3. 自定义向量化模型
echo ===================================================
echo.

echo 检查是否存在测试文件...
if exist "白马啸西风.txt" (
    echo 发现测试文件: 白马啸西风.txt
) else (
    echo 未发现测试文件，请准备txt格式的文本文件
)

echo.
echo 启动向量化处理程序...
python test.py

if errorlevel 1 (
    echo.
    echo 程序执行出错，可能的原因:
    echo 1. 缺少必要的依赖包
    echo 2. 文本文件格式问题
    echo 3. 向量模型未正确配置
    echo.
    echo 建议检查错误信息并重新配置
)

echo.
echo ===================================================
echo           向量化处理完成
echo ===================================================
pause
