Pack ← {
    h ← <˘ 2‿∘ ⥊ 𝕩
    l ← 0⊑ h
    r ← 1⊑ h
    i ← ⊑(⊐⟜1 l ∊ r)
    i ⊑ l
}

Prio ← {
    l ← 0⊸<⊸× 1 + 𝕩 - 'a'
    u ← 53⊸>⊸× 27 + 𝕩 - 'A'
    l+u
}

Badge ← {
    a ← 0⊑𝕩
    b ← 1⊑𝕩
    c ← 2⊑𝕩
    ab ← a(∊/⊣)b
    ⊑ab(∊/⊣)c
}

lines ← •FLines ⊑ •args
groups ← <˘ ∘‿3 ⥊ lines

•Show +´ Prio ¨ Pack ¨ lines
•Show +´ Prio ¨ Badge ¨ groups
