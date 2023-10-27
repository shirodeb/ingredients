# Ingredients 仓库

---

Ingredients（构建素材） 是一种尝试解决UOS V20、deepin V20中系统开发依赖过老的方案。

本项目是[ShiroDEB](https://github.com/shirodeb/shirodeb)的附属项目，仅作为“配置文件”来使用，并无逻辑代码。

每一个 构建素材 均为一个文件夹，文件夹名由包名、版本号、架构三元组构成，并在文件夹内*可选*地存在`base.sh`、`devel.sh`、`runtime.sh`文件，若文件不存在，则相应的值将会采用默认的设置。

## `base.sh`
`base.sh` 描述一个 构建素材 的基础信息，目前包含以下内容：

- INGREDIENT_ROOT
  - 构建素材 的绝对路径，例如deepin-shared-libs自建库依赖包的Qt5的内容则为`/opt/deepin-shared-libs/Qt5.15.10gles/`
- INGREDIENT_DEPENDS_DEVEL
  - 开发依赖列表，在使用sd make的时候会自动安装。例如`("qt5.15gles.devel.szbt")`
- INGREDIENT_DEPENDS_RUNTIME
  - 运行时依赖，在使用sd make的时候会将其写入DEPENDS域，生成的软件包将会依赖其中列出的依赖并于安装时自动解析。例如`("qt5.15gles-basic.runtime.szbt")`

## `devel.sh` 及 `runtime.sh`
`devel.sh` 及 `runtime.sh` 描述一个构建素材在开发时和运行时对环境变量的修改内容。在 `runtime.sh` 中的内容会自动生成包含对环境变量进行相应修改的启动脚本。在 `devel.sh` 中的内容将在构建过程中自动引入。

在这些文件中对环境变量的修改通过固定前缀的环境变量组实现。
例如`PREPEND_ENV__PATH=(":" "/custom/path")`将会将`/custom/path`追加到`PATH`的起始处，并以`:`分割。

前缀和环境变量名之间使用**双下划线**分割。

以下是目前可用的前缀：

- PREPEND_ENV: 列表，第一位为分隔符，剩下部分为需要追加到环境变量**头部**的内容
- APPEND_ENV：同上，但为追加到**尾部**
- SET_ENV：无条件设置环境变量
- DEFAULT_ENV：当目标环境变量为空时才设置环境变量

在内容部分可以使用以下替换模板：

- %ROOT%: 构建素材 的绝对路径，可在`INGREDIENT_ROOT`中指定。默认为这些文件的所在目录
  
注：请务必使用%ROOT%来指定环境变量路径，不要使用相对路径，脚本不会隐式解析相对路径。

注：目前尚未实现对替换模板的转义，所以如果你真的需要一个原始的替换模板字符串，推荐使用其他方式组合，或通知我实现转义。