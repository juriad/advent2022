(argv Filename)
(set 'F (in Filename (till NIL)))
(set 'Lines (split (filter '((C) (<> C ":")) (trim F)) "^J"))
(set 'Input (mapcar '((L)
    (set 'I (mapcar pack (split L " ")))
    (set 'N (format (cadr I)))
    (if N (list (car I) N) I)
) Lines))

# (println Input)

(de assign (Eqns Var Num)
    (filter
        '((Eqn) (or (<> (car Eqn) Var) (= (car Eqn) "root")))
        (mapcar '((Eqn)
            (ifn (cddr Eqn) Eqn
                (set 'M (car Eqn))
                (set 'A (cadr Eqn))
                (set 'Op (caddr Eqn))
                (set 'B (cadddr Eqn))
                (when (= A Var) (set 'A Num))
                (when (= B Var) (set 'B Num))

                (if (and (num? A) (num? B))
                    (list M (case Op
                        ("+" (+ A B))
                        ("-" (- A B))
                        ("*" (* A B))
                        ("/" (/ A B))
                    ))
                    (list M A Op B)
                )
            )
        )
        Eqns)
    )
)

(de assignall (Eqns Used)
    (set 'Unassigned (find '((Eqn)
        (and
            (not (cddr Eqn))
            (not (find '((A)
                (= (car Eqn) A)
            ) Used))
        )
    ) Eqns))
    # (println Unassigned)
    (ifn Unassigned Eqns
        (set 'Assigned (assign Eqns (car Unassigned) (cadr Unassigned)))
        # (println Assigned)
        (assignall Assigned (cons (car Unassigned) Used))
    )
)

(de simplifyVar (Eqns Var Const)
    (set 'Simp (find '((Eqn) (= (car Eqn) Var)) Eqns))
    (set 'ConstA (num? (cadr Simp)))
    (set 'C (if ConstA (cadr Simp) (cadddr Simp)))
    (set 'V (ifn ConstA (cadr Simp) (cadddr Simp)))
    # (println "simp" Simp)

    (set 'Simplified (list (car Simp) V "="
        (if ConstA
            (case (caddr Simp)
                ("+" (- Const C)) -- Const = C + V
                ("-" (- C Const)) -- Const = C - V
                ("*" (/ Const C)) -- Const = C * V
                ("/" (/ C Const)) -- Const = C / V
            )
            (case (caddr Simp)
                ("+" (- Const C)) -- Const = V + C
                ("-" (+ Const C)) -- Const = V - C
                ("*" (/ Const C)) -- Const = V * C
                ("/" (* Const C)) -- Const = V / C
            )
        )
    ))
    # (println Simplified)
    (mapcar '((Eqn) (if (= (car Eqn) (car Simp)) Simplified Eqn)) Eqns)
)

(de simplify (Eqns)
    (set 'Match (find '((Eqn) (= (caddr Eqn) "=")) Eqns))
    (set 'ConstA (num? (cadr Match)))
    (set 'Const (if ConstA (cadr Match) (cadddr Match)))
    (set 'Var (ifn ConstA (cadr Match) (cadddr Match)))
    # (println "match" Match)

    (if (= Var "humn") Eqns
        (set 'Simplified (simplifyVar (filter '((Eqn) (<> (car Eqn) (car Match))) Eqns) Var Const))
        # (println Simplified)
        (simplify Simplified)
    )
)

(set 'AllAssigned (assignall Input (list)))
(println (cadar AllAssigned))

(set 'Input2 (mapcar
    '((Eqn) (ifn (= (car Eqn) "root") Eqn (list (car Eqn) (cadr Eqn) "=" (cadddr Eqn) )))
     (filter '((Eqn) (<> (car Eqn) "humn")) Input )
))
# (println Input2)

(set 'PartiallyAssigned (assignall Input2 (list)))
# (println PartiallyAssigned)

(set 'Simple (simplify PartiallyAssigned))
(println (cadddr (car Simple)))

(bye)
