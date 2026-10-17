import Mathlib

/-! ================================================================
   偏元数学 · Day30 · 表里两读法 · 退化、零与单位元、结合
   ------------------------------------------------------------------
   核心：值层每次运算（加或减）都留 ε；相位层正常加减。
       偏元加法 ⊕：(x,φ) ⊕ (y,ψ) = (x + y + ε, φ + ψ)。
       命题 C（退化）    ：ε = 0 时 ⊖ 退回经典 (x − y, φ − ψ)。
       命题 D（零≠单位元）：a ⊖ a = (ε, 0)，而 ⊕ 的单位元 = (−ε, 0)；
                            ε ≠ 0 时两者不同。
       命题 E（结合）    ：(ℂ × ℝ, ⊕) 满足结合、交换、有单位元、有逆元。
   本稿范围：证 C；证 D；证 ⊕ 的结合、交换、单位元、逆元。
   不做：不替 ε 取值；不证 A／B／B′（见 Day30-01／-02）。
   注：上承 Day30-01／Day30-02（同仓）。
       本稿取 φ₀ := 0（规范选择）——所有命题只依赖相位差。
   日期：2026-10-14
   纪律：逐字提交 —— 抬头是提交原文的一部分，改动即改 SHA256。
   ================================================================ -/

namespace PrenaryS009

-- ① 偏元残差（显式参数；本稿不替 ε 取值）
variable (ε : ℂ)

-- ② 对象层偏元减法（值作差留 ε、向作差）
def subP (p q : ℂ × ℝ) : ℂ × ℝ := (p.1 - q.1 + ε, p.2 - q.2)

-- ③ 对象层偏元加法（值作和留 ε、向作和）
def addP (p q : ℂ × ℝ) : ℂ × ℝ := (p.1 + q.1 + ε, p.2 + q.2)

-- 定理1（命题 C·退化）：ε = 0 时 ⊖ 退回经典逐分量作差
theorem subP_degenerate (p q : ℂ × ℝ) : subP 0 p q = (p.1 - q.1, p.2 - q.2) := by
  simp only [subP]
  ext <;> ring

-- 定理2（命题 E·结合）
theorem addP_assoc (a b c : ℂ × ℝ) :
    addP ε (addP ε a b) c = addP ε a (addP ε b c) := by
  simp only [addP]
  ext <;> ring

-- 定理3（命题 E·交换）
theorem addP_comm (a b : ℂ × ℝ) : addP ε a b = addP ε b a := by
  simp only [addP]
  ext <;> ring

-- 定理4（命题 D·单位元）：单位元为 (−ε, 0)（左单位）
theorem addP_zero (a : ℂ × ℝ) : addP ε (-ε, (0 : ℝ)) a = a := by
  simp only [addP]
  ext <;> ring

-- 定理5（命题 E·逆元）：a 的逆元为 (−a.1 − 2ε, −a.2)
theorem addP_neg (a : ℂ × ℝ) :
    addP ε a (-a.1 - 2 * ε, -a.2) = (-ε, (0 : ℝ)) := by
  simp only [addP]
  ext <;> ring

-- 定理6（自减的值分量恒为 ε）
theorem subP_self_fst (x : ℂ) (φ : ℝ) : (subP ε (x, φ) (x, φ)).1 = ε := by
  simp only [subP]
  ring

-- 定理7（命题 D·零 ≠ 单位元）：ε ≠ 0 时，⊖ 的留差 (ε,0) 不等于单位元 (−ε,0)
theorem eps_ne_neg_eps (hε : ε ≠ 0) :
    ((ε, (0 : ℝ)) : ℂ × ℝ) ≠ (-ε, (0 : ℝ)) := by
  intro h
  have hf : ε = -ε := by simpa using congrArg Prod.fst h
  have h2 : ε + ε = 0 := by
    have h3 : ε - (-ε) = 0 := sub_eq_zero.mpr hf
    simpa using h3
  exact hε (add_self_eq_zero.mp h2)

end PrenaryS009
