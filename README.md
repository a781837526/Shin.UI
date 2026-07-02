
## 🌈 项目介绍

`Shin.UI` 是 **Shin.NET** 通用权限开发框架的前端工程，基于 `Vue 3.5 + TypeScript + Vite 8 + Element Plus + Pinia + Vue Router` 技术栈构建，配套 Shin.NET 后端 API 提供开箱即用的中后台管理系统，覆盖 **系统管理、权限控制、代码生成、审批流、日志审计、消息推送、支付集成、可视化数据库、多语言、多租户** 等企业级能力，适配手机、平板、PC 多端展示。

> 项目脱胎于 `vue-next-admin` 优秀开源模板，围绕 Shin.NET 后端能力做了深度定制与扩展。

## ✨ 核心特性

- 🖼 **多种布局**：默认 / 经典 / 横向 / 分栏 四套布局，支持深浅色主题、菜单渐变、水印、锁屏
- 🔐 **权限体系**：支持前端 / 后端两种路由控制模式，按钮级权限指令 `v-auth / v-auths / v-auth-all`
- 🧩 **完整系统管理**：菜单、机构、岗位、角色、用户、租户、租户配置、字典、参数配置、通知公告、在线用户
- 🗂 **代码生成**：一键根据数据库表生成前后端代码（含实体、Controller、页面、表单），可视化数据库管理
- 🧱 **可视化设计**：VForm3 表单设计器、hiPrint 打印设计、LogicFlow 审批流设计、Monaco 代码编辑器
- 📊 **可视化图表**：Echarts 5 / Echarts-GL / 词云、大屏组件、CountUp 数字滚动
- 📨 **消息与实时通信**：SignalR 在线用户推送、MQTT 客户端、桌面 Push 通知、订阅消息模板
- 💰 **支付与三方**：微信支付 / 微信用户 / 支付宝 / 钉钉集成、GoView 大屏集成
- 🌍 **国际化**：Vue-i18n + Element Plus 语言包 + `vite-auto-i18n-plugin` 自动翻译 + 后端多语言词条
- 🔒 **国密加密**：内置 `sm-crypto` SM2 公钥加密登录
- 📝 **日志审计**：操作日志、异常日志、访问日志、差异日志（LogDiff）
- 🧰 **实用组件**：可编辑表格、下拉表格、图标选择、多语言输入、字典组件、拖拽验证、图片裁剪、富文本、JSON 编辑器等

## 🏭 环境支持

| Edge      | Firefox      | Chrome      | Safari      |
| --------- | ------------ | ----------- | ----------- |
| Edge ≥ 88 | Firefox ≥ 78 | Chrome ≥ 87 | Safari ≥ 13 |

> 由于 Vue 3 不再支持 IE11，故而 Element Plus 也不支持 IE11 及之前版本。

- Node.js：**>= 18.0.0**
- 包管理器：推荐 **pnpm 10.x**（`packageManager: pnpm@10.32.1`）
- 后端服务：Shin.NET API（默认地址 `http://localhost:5005`）

## 🚧 安装依赖

推荐使用 pnpm 进行依赖管理：

```bash
# 全局安装 pnpm（国内镜像）
npm install -g pnpm --registry=https://registry.npmmirror.com
```

## ⚡ 使用说明

```bash
# 安装依赖
pnpm install

# 本地开发（默认端口 8888，自动打开浏览器）
pnpm run dev

# 打包发布
pnpm run build

# ESLint 修复
pnpm run lint-fix

# Prettier 格式化
pnpm run format

# 多语言批量翻译（DeepSeek）
pnpm run translate
```

### 环境变量

根目录下的 `.env`、`.env.development`、`.env.production` 用于控制不同环境：

| 变量                        | 说明                                            |
| --------------------------- | ----------------------------------------------- |
| `VITE_PORT`                 | 本地开发端口，默认 `8888`                        |
| `VITE_OPEN`                 | 启动时是否自动打开浏览器                          |
| `VITE_OPEN_CDN`             | 打包是否启用 CDN 外链（配置见 `src/utils/build.ts`）|
| `VITE_PUBLIC_PATH`          | 部署时公共路径                                    |
| `VITE_API_URL`              | 后端 API 基础地址                                 |
| `VITE_DEFAULT_USER`         | 登录页默认账号（仅开发环境）                       |
| `VITE_DEFAULT_USER_PASSWORD`| 登录页默认密码（仅开发环境）                       |
| `VITE_SM_PUBLIC_KEY`        | 国密 SM2 公钥，用于登录密码加密                    |
| `DEEPSEEK_API_KEY`          | DeepSeek 翻译 API Key（建议放入 `.env.local`）    |

### API 客户端生成

后端接口通过 Swagger Codegen 生成 TypeScript-Axios 客户端代码，输出到 `src/api-services`、`src/api-plugins`。详细流程参见 [api_build/readme.md](file:///d:/Net/Vue/Shin/Shin.UI/api_build/readme.md)。

```bash
# 主 API（需先启动 Shin.NET 后端）
pnpm run build-api          # Windows
pnpm run build-api-ps       # PowerShell

# 插件 API
pnpm run build-approvalFlow-api
pnpm run build-dingTalk-api
pnpm run build-goView-api

# 一键生成全部
pnpm run build-all-api
pnpm run build-all-api-ps
```

## 📁 目录结构

```
Shin.UI
├─ api_build/               # Swagger Codegen 脚本（生成 api-services / api-plugins）
├─ lang/                    # 自动 i18n 翻译产物（vite-auto-i18n-plugin）
├─ public/                  # 静态资源与运行时配置 config.js
├─ scripts/                 # 清理与翻译辅助脚本
├─ src
│  ├─ api/                  # 手写业务 API（登录、菜单、微信支付等）
│  ├─ api-services/         # Swagger 生成的核心系统 API（apis / models）
│  ├─ api-plugins/          # Swagger 生成的插件 API（approvalFlow / dingTalk / goView）
│  ├─ assets/               # 图标（font-awesome / iconfont）、图片
│  ├─ components/           # 全局业务组件（表格、字典、图标选择、拖拽验证、富文本等）
│  ├─ directive/            # 自定义指令（v-auth / v-auths / v-auth-all 等）
│  ├─ layout/               # 布局：默认 / 经典 / 横向 / 分栏，含顶栏、菜单、TagsView
│  ├─ router/               # 路由：前端控制 frontEnd / 后端控制 backEnd
│  ├─ stores/               # Pinia：主题、用户信息、路由、语言、TagsView 等
│  ├─ theme/                # 全局样式（SCSS）：暗黑、element 覆盖、模块样式
│  ├─ types/                # 全局类型声明（axios、layout、mitt、pinia、views）
│  ├─ utils/                # 工具：request、axios-utils、加密、下载、Excel、水印等
│  ├─ views/                # 业务页面
│  │  ├─ approvalFlow/      # 审批流（基于 LogicFlow 的自定义节点/边）
│  │  ├─ home/              # 首页仪表盘、公告
│  │  ├─ login/             # 账号、手机、扫码、注册登录
│  │  ├─ system/            # 系统管理：菜单/机构/角色/用户/租户/字典/文件/...
│  │  │  ├─ codeGen/        # 代码生成
│  │  │  ├─ database/       # 可视化数据库
│  │  │  ├─ job/            # 定时任务与集群
│  │  │  ├─ log/            # 操作/异常/访问/差异日志
│  │  │  ├─ print/          # hiPrint 打印设计
│  │  │  ├─ formDes/        # VForm3 表单设计
│  │  │  ├─ weChatPay/      # 微信支付
│  │  │  └─ ...
│  │  ├─ elive/             # 视频监控（EZUIKit）
│  │  └─ mqttx/             # MQTT 客户端
│  ├─ App.vue
│  └─ main.ts
├─ .env / .env.development / .env.production
├─ eslint.config.mjs
├─ vite.config.ts
├─ package.json
└─ README.md
```

## 🔑 主要模块

| 模块        | 说明                                                            |
| ----------- | --------------------------------------------------------------- |
| 登录鉴权    | 支持账号 / 手机 / 扫码 / 注册；SM2 密码加密；旋转/滑动验证码       |
| 权限控制    | 前端 / 后端两种路由模式，指令级按钮权限，数据权限（机构/自定义）    |
| 系统管理    | 菜单、机构、岗位、角色、用户、租户、字典、配置、通知、在线用户等     |
| 代码生成    | 支持多库连接、表关联、模板渲染，可视化数据库（VisualDB）           |
| 审批流      | 基于 LogicFlow 的可视化流程设计（开始/审批/任务/SQL/结束节点）     |
| 表单设计    | VForm3 表单设计器 + 表单渲染                                    |
| 打印设计    | hiPrint 可视化打印模板 + 前端打印                                |
| 日志审计    | 操作日志、异常日志、访问日志、差异日志                            |
| 定时任务    | Job 详情 / 触发器 / 集群仪表盘                                   |
| 消息通知    | SignalR 推送、桌面 Push、微信订阅消息、短信、邮件模板             |
| 支付集成    | 微信支付（订单/退款/JSAPI 参数）、支付宝下单                     |
| 三方集成    | 钉钉（DingTalk）、GoView 大屏、企业微信、微信开放平台            |
| 多语言      | 静态词条自动翻译 + 后端多语言词条（SysLangText）                 |
| 多租户      | 租户管理、租户菜单授权、租户参数配置、租户切换                    |

## 🛠 技术选型

- **核心框架**：Vue 3.5、Vue Router、Pinia、TypeScript
- **构建工具**：Vite 8、Terser、rollup-plugin-visualizer、vite-plugin-compression2
- **UI 组件**：Element Plus 2.13、@element-plus/icons-vue、animate.css
- **图表可视化**：echarts / echarts-gl / echarts-wordcloud、countup.js、vue3-tree-org
- **可视化设计**：@logicflow/core、@logicflow/extension、vform3-builds、vue-plugin-hiprint、jsplumb、vue-grid-layout、relation-graph
- **编辑器**：monaco-editor、@wangeditor/editor、md-editor-v3、json-editor-vue
- **实时通信**：@microsoft/signalr、mqtt、mitt
- **文件与办公**：@vue-office/docx | excel | pdf、xlsx-js-style、cropperjs、print-js、js-table2excel
- **加密与工具**：sm-crypto-v2、js-cookie、lodash-es、qs、axios、qrcodejs2-fixes
- **国际化**：vue-i18n、vite-auto-i18n-plugin
- **代码质量**：ESLint 10、Prettier 3、TypeScript 6

## 📏 开发规范

- **别名**：`/@/` 指向 `src/`，避免使用相对路径 `../../`
- **组件命名**：PascalCase，`<script setup lang="ts" name="xxx">` 使用 `vite-plugin-vue-setup-extend` 声明 `name`（用于 KeepAlive 缓存）
- **样式**：SCSS + BEM，全局主题变量集中在 `src/theme`；深度选择器使用 `:deep(...)`
- **请求**：统一走 `src/utils/request.ts` / `axios-utils.ts`，业务接口优先使用 `src/api-services` 中 Swagger 生成的类型化 API
- **状态管理**：Pinia 模块化，一个业务一个 store，`storeToRefs` 解构使用
- **路由**：`meta` 字段遵循 [route.ts](file:///d:/Net/Vue/Shin/Shin.UI/src/router/route.ts) 中的约定（`title / isLink / isHide / isKeepAlive / isAffix / isIframe / roles / icon`）
- **权限**：模板中使用 `v-auth="'xxx:add'"`、`v-auths="['a','b']"`、`v-auth-all="['a','b']"`
- **国际化**：新增文案默认写中文，构建时由 `vite-auto-i18n-plugin` 输出到 `lang/index.json`
- **提交**：遵循 Angular 风格 commit（feat / fix / docs / style / refactor / perf / test / chore）

## ⚠ 注意事项

- 首次启动前请确保 Shin.NET 后端已运行，并在 `.env.development` 中正确配置 `VITE_API_URL`
- 修改后端接口后需要重新运行 `pnpm run build-api` 更新 `src/api-services`
- `sourcemap` 默认关闭；生产打包会 `drop_console`、`drop_debugger`
- Vite 8 不再支持 Node 12 / 13 / 15，请使用 **Node 18+**
- 部署到子路径时需同步设置 `VITE_PUBLIC_PATH`，并在 Nginx 配置 `try_files`，用于 Hash / History 路由回退
- 打包体积较大时可开启 `.env` 中 `VITE_OPEN_CDN=true`，CDN 外链配置见 [build.ts](file:///d:/Net/Vue/Shin/Shin.UI/src/utils/build.ts)
- 使用国密加密登录，务必确保前后端 `VITE_SM_PUBLIC_KEY` 与后端私钥匹配

## 📜 License

[MIT](./LICENSE)

## 🙏 致谢

- [vue-next-admin](https://gitee.com/lyt-top/vue-next-admin) — 基础模板
- [Element Plus](https://element-plus.org/)
- [LogicFlow](https://site.logic-flow.cn/)、[VForm3](https://www.vform666.com/)、[hiPrint](https://gitee.com/CcSimple/vue-plugin-hiprint) 等优秀开源项目
