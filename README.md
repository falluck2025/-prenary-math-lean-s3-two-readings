[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.23446224.svg)](https://doi.org/10.5281/zenodo.23446224)

# 偏元数学 · Day30 · 表里两读法（S-009 对应）

## 声明
本仓库为「偏元数学」系列 Lean 4 形式化验证仓之一（`s4` 段首仓），对应数学侧 `NEW(S)-009` 的验证线。全部内容为**内部研究记录的形式化**，供同行审阅与复现；不构成对任何物理结论的断言。

## DOI
`待回填`（Zenodo 发布后回填；⚠️ 回填共三处：第 0 行徽章内 **2 处**（URL 与链接）+ 本节 **1 处**，不得变形）

## 摘要
本仓把「表里两读法」在 Lean 4 中形式化。设定两层：**动作层** `ℂ`（`a ⊖ b = a − b + ε`，`a ⊕ b = a + b + ε`）；**对象层** `ℂ × ℝ`（值作差作和留 `ε`，相位正常加减）。核心结果是**对角嵌入 `D x = (x, 0)` 是表里同态**：`D (x ⊖ y) = (D x) ⊖ (D y)`。在此基础上证：**自减** `(x,φ) ⊖ (x,φ) = (ε, 0)` 与**异态相减** `(x,φ) ⊖ (x,ψ) = (ε, φ − ψ)`（同值异向时差只剩方向）；**退化**（`ε = 0` 时逐条退回经典）；**零 ≠ 单位元**（`a ⊖ a = (ε,0)`，而 `⊕` 的单位元为 `(−ε,0)`）；**偏元加法群**（结合、交换、单位元、逆元）；以及**标架不变性**（`⊖` 在相位整体平移下不变，而 `D` 依赖所选标架）。

## Abstract
We formalize, in Lean 4, the *two readings* of a single residual equation `a ⊖ a = ε`: the **action layer** `ℂ` and the **object layer** `ℂ × ℝ`. The central result is that the diagonal embedding `D x = (x,0)` is a *surface–interior homomorphism*: `D (x ⊖ y) = (D x) ⊖ (D y)`. We then prove self-subtraction `= (ε,0)`, hetero-state subtraction `= (ε, φ−ψ)`, degeneration back to the classical case at `ε = 0`, the distinction between the residual `(ε,0)` and the additive unit `(−ε,0)`, the abelian-group laws of prenary addition, and frame invariance of `⊖` together with the frame dependence of `D`.

## 关键词
偏元数学；表里两读法；动作层与对象层；残差 `ε`；表里同态；自减与异态相减；退化；零与单位元；标架；Lean 4；形式化验证。

## 概述
同一式 `a ⊖ a = ε`，在**动作层**读作「这个动作的残留」，在**对象层**读作「这一层的零」。本仓把这两层与它们之间的**同态** `D` 落成机器可检的形式，并给出「相减两读法」（自减／异态相减）、退化关、零与单位元之别、以及偏元加法群公理。

## 核心定义
- `subC ε a b := a − b + ε`（动作层偏元减法）
- `subP ε (x,φ) (y,ψ) := (x − y + ε, φ − ψ)`（对象层偏元减法）
- `addP ε (x,φ) (y,ψ) := (x + y + ε, φ + ψ)`（对象层偏元加法）
- `D x := (x, 0)`（对角嵌入，动作层 → 对象层）
- `shift c (x,φ) := (x, φ + c)`（相位平移＝换标架）

## 定理清单（17 条，分三件）
- **-01（4）**：命题 A 表里同态 `D (x ⊖ y) = (D x) ⊖ (D y)`／`D` 的像落在 `ℂ × {0}`／标架不变性 `⊖`／`D` 的标架依赖 `shift c (D x) = (x, c)`
- **-02（6）**：命题 B 自减 `= (ε,0)`／命题 B′ 异态相减 `= (ε, φ−ψ)`／自减的向分量 `= 0`／异态的向分量 `= φ−ψ`／异态的值分量 `= ε`／解耦（值分量不随相位变）
- **-03（7）**：命题 C 退化回经典／结合／交换／单位元 `(−ε,0)`／逆元 `(−a.1 − 2ε, −a.2)`／自减的值分量 `= ε`／命题 D 零 ≠ 单位元（`ε ≠ 0` 时 `(ε,0) ≠ (−ε,0)`）

## 验证记录
三件内核均为 `No goals` ＋ `All Messages (0)`；Comparator 独立二次验证通过，**落盘 SHA256 ＝ Challenge Hash**（三件全一致）。截图见 `evidence/`。

**逐件 SHA256**：
- `Day30-01`（对象层模型与同态）：`a76b74ecf59570bc38a8caa7f723a5533f02bcf73d2e3b3057b3be007d308099`
- `Day30-02`（自减与异态相减）：`973b1eedc2946e3bffa78ab12b821af99e98b850ac7a09d480f531709f395996`
- `Day30-03`（退化零与单位元结合）：`18a3b6c390e8bb81742a34100ee4f63c3c6ea40261ecbcac580a586f3b4eab24`

## 文件说明
`Day30-01…-03_*.lean` ＋ `README.md` ＋ `LICENSE`（CC BY-NC-ND 4.0）＋ `evidence/`（内核与 Comparator 截图）。

## 复现方式
1. 打开 live.lean-lang.org；2. 逐件整份粘贴（Ctrl+A）；3. 看文件末尾 `All Messages (0)`；4. 点 `Can I Trust This Proof?` 看 `Successfully validated`。

## 可证伪条件
- 若把 `ε` 取 0，本仓各命题**逐条退回经典**（退化关）——这是本仓的自洽底线；
- **本仓不主张**：`φ₀` 的绝对位置（本稿取 `φ₀ := 0` 为**规范选择**，所有命题只依赖相位差）；相位用 `ℝ` 承载（**不商 `2π`**，只保和差）。

## 作者 / 致谢 / 许可
作者：陈松（Chen Song）｜ORCID 0009-0002-9510-2239｜全体协作：老陈与AI的深夜实验室。
许可：**CC BY-NC-ND 4.0**。

## 作者备注
本仓为 `NEW(S)-009` 的验证件（`Day30`），随 `S-009` 迭代；下接 `Day31`（`prenary-math-lean-s3-fold-in-witness`）。DOI 待回填。

---

老陈与AI的深夜实验室 发布 请笑纳
