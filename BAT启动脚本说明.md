# AI小说项目启动脚本说明

## 📁 创建的启动脚本列表

### 🚀 主启动脚本
- **`启动AI小说项目.bat`** - 主菜单，可选择启动任意子模块

### 📖 子项目启动脚本

1. **`chaishu/启动拆书分析.bat`**
   - 功能：启动Python拆书分析引擎
   - 环境：Python + LangChain
   - 用途：智能分析小说结构、人物、剧情

2. **`group/启动群聊核心.bat`**
   - 功能：启动C# AI群聊核心
   - 环境：.NET 8.0
   - 用途：多角色AI对话系统

3. **`open-webui/启动WebUI界面.bat`**
   - 功能：启动Web用户界面
   - 环境：Python + FastAPI
   - 用途：网页版创作界面 (http://localhost:8080)

4. **`vector/启动向量化处理.bat`**
   - 功能：启动文本向量化引擎
   - 环境：Python + Sentence-Transformers
   - 用途：文本语义检索和相似度计算

5. **`test/启动测试模块.bat`**
   - 功能：启动API测试模块
   - 环境：Python + DashScope
   - 用途：测试各种AI接口功能

## 🛠️ 环境要求

### Python环境 (3.8+)
需要安装Python的模块：
- chaishu（拆书分析）
- open-webui（Web界面）
- vector（向量化处理）
- test（测试模块）

### .NET环境 (8.0+)
需要安装.NET的模块：
- group（群聊核心）

## 📋 使用步骤

### 第一次使用
1. **运行主启动脚本**：双击 `启动AI小说项目.bat`
2. **选择要启动的模块**：输入对应数字(1-6)
3. **等待环境初始化**：脚本会自动创建虚拟环境并安装依赖
4. **配置API密钥**：根据提示配置相应的AI平台密钥

### 常规使用
1. 直接运行对应模块的bat文件
2. 或使用主启动脚本选择模块

## ⚙️ 配置说明

### API密钥配置
各模块需要配置的API密钥：

- **拆书分析引擎**：
  ```python
  # 在chaishu/test.py中修改
  openai_api_key="your_api_key_here"
  openai_api_base="https://api_base_url"
  ```

- **群聊核心**：
  ```csharp
  // 在group项目中配置API密钥
  ```

- **测试模块**：
  ```python
  # 在test/zhaiyao.py中修改
  api_key='your_dashscope_api_key'
  ```

### 端口配置
- **WebUI界面**：默认端口8080，如占用会自动尝试8081
- **其他模块**：根据具体配置而定

## 🔧 故障排除

### 常见问题

1. **Python环境问题**
   ```
   错误: 无法创建虚拟环境
   解决: 确保已安装Python 3.8+，并添加到系统PATH
   ```

2. **.NET环境问题**
   ```
   错误: 未检测到.NET环境
   解决: 安装.NET 8.0 SDK
   下载: https://dotnet.microsoft.com/download
   ```

3. **依赖安装失败**
   ```
   解决: 脚本会自动尝试使用国内镜像重试
   手动: pip install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple
   ```

4. **端口占用**
   ```
   WebUI默认使用8080端口，如被占用会自动尝试8081
   可手动修改脚本中的PORT变量
   ```

### 日志查看
每个启动脚本都包含详细的错误提示和状态信息，请根据控制台输出进行问题诊断。

## 📝 自定义修改

### 修改API配置
在各个项目的源代码中修改API密钥和接口地址。

### 修改启动参数
可以编辑对应的bat文件，调整启动参数，如端口号、模型配置等。

### 添加新的依赖
在对应的requirements.txt文件中添加新的Python包。

## 🎯 使用建议

1. **首次使用**：建议按顺序测试各个模块
2. **开发环境**：可以直接运行对应的Python/C#程序
3. **生产环境**：建议使用Docker或虚拟机部署
4. **性能优化**：根据硬件配置调整模型参数和并发数

---

## 📞 技术支持

如遇到问题，请参考：
- 项目README.md文档
- GitHub Issues
- 作者微信公众号：多样分享 (fyduoyang)
