# Markdown Theme (Newsprint Custom)

个人自用的跨端 Markdown 统一阅读与排版主题配置，基于 **Newsprint (`PT Serif`)** 深度微调，同时适配 **VS Code / Antigravity / Cursor (Markdown Preview Enhanced)** 与 **Typora**。

## 核心排版与样式优化

相比原版 `newsprint.css`，做了以下 5 项针对中英文混排、列表层级与流程图渲染的定制：

1. **纸张背景与全局行距**：
   - 背景色由原版偏暗的 `#f3f2ee` 调整为更柔和清爽的暖白纸张色 `#FCFCFB`。
   - 全局、正文段落与列表行高由 `1.5em` 增大至 `1.75`，解决中英文长文阅读偏挤问题。
2. **列表缩进减半**：
   - 原版 `newsprint.css` 列表缩进约 `4em`（`margin-left: 1.5em` + `padding-left: 40px`），统一收敛为 `padding-left: 2em; margin-left: 0;`（约两个中文字符宽度），二级嵌套列表同样保持 `2em` 对齐。
3. **列表项行间距与间隙优化**：
   - 列表项 `li` 下边距设为 `0.35em`，嵌套列表上下边距设为 `0.35em`，任务复选框列表 `padding-left: 1.8em`。
4. **修复代码块首行缩进**：
   - 清除 `pre code` 从行内 `code { padding-left: 1ch; padding-right: 1ch; }` 继承的左右内边距与首行缩进假象。
5. **修复 Mermaid 节点与连线文字溢出**：
   - 锁定 `.mermaid` / `.md-diagram-panel` 内部 `p, .nodeLabel, .edgeLabel, .label` 的行高为 `1.4 !important` 并开启 `foreignObject { overflow: visible !important; }`，防止被正文 `p { line-height: 1.75 }` 命中后多行文字撑破节点边界。

---

## 目录结构

```text
.
├── sync.sh                          # 一键同步脚本（自动写入 MPE 与 Typora 目录）
├── vscode-mpe/
│   ├── style.less                   # Markdown Preview Enhanced (crossnote) 全局样式
│   └── settings.snippet.json        # VS Code / Antigravity / Cursor 配置片段
└── typora/
    ├── newsprint.user.css           # Typora Newsprint 主题叠加样式（升级不被覆盖）
    ├── newsprint.css                # Typora Newsprint 基础主题备份
    └── newsprint/                   # PT Serif 离线字体文件备份
```

---

## 快速同步（新设备一键安装）

克隆仓库并执行同步脚本即可同时应用到 VS Code MPE 与 Typora：

```bash
git clone https://github.com/nanzhi84/markdown-theme.git
cd markdown-theme
./sync.sh
```

### 手动配置说明

- **Typora**：
  1. 将 `typora/newsprint.user.css` 复制到 Typora 主题目录（macOS：`~/Library/Application Support/abnerworks.Typora/themes/`）。
  2. 在菜单栏选择 **主题 (Themes) -> Newsprint**。
- **VS Code / Antigravity / Cursor**：
  1. 在 `settings.json` 中合入 `vscode-mpe/settings.snippet.json`。
  2. 将 `vscode-mpe/style.less` 复制到 `~/.crossnote/style.less` 与 `~/.local/state/crossnote/style.less`。
