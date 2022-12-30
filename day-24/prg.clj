(require '[clojure.string :as str])
(use 'clojure.pprint)

(def filename (first *command-line-args*))

(def content (str/split-lines (slurp filename)))
(def world (let
    [flat (flatten (map-indexed
        (fn [row line]
            (map-indexed
                (fn [col c]
                    {:row row :col col :char c}
                )
                (str/split line #"")
            )
        )
        content
    ))

    min-row (reduce min (map :row flat))
    max-row (reduce max (map :row flat))
    min-col (reduce min (map :col flat))
    max-col (reduce max (map :col flat))

    start {:row min-row :col (+ min-col 1)}
    end {:row max-row :col (- max-col 1)}

    non-free (filter (fn [p] (not= (:char p) ".")) flat)
    trans (into {} (map (fn [p] [{:row (:row p) :col (:col p)} [(:char p)]]) non-free))
    gates {start ["g"] end ["g"]}
    m (merge trans gates)
    ]
    { :grid {:number 0 :map m
        :min-row min-row :max-row max-row
        :min-col min-col :max-col max-col
        :start start :end end}
        :start start
        :end end}
))

(defn wind [grid] (let
    [
    {n :number m :map
        min-row :min-row max-row :max-row
        min-col :min-col max-col :max-col
        } grid

    flat (mapcat (fn [[k vs]]
        (map (fn [v] [k v]) vs)
    ) (seq m))

    moved (map (fn [[k v]] (let
        [
        {r :row c :col} k

        mo (case v
            ">" {
                :row r
                :col (if (>= (+ c 1) max-col) (+ min-col 1) (+ c 1))
            }
            "<" {
                :row r
                :col (if (<= (- c 1) min-col) (- max-col 1) (- c 1))
            }
            "^" {
                :row (if (<= (- r 1) min-row) (- max-row 1) (- r 1))
                :col c
            }
            "v" {
                :row (if (>= (+ r 1) max-row) (+ min-row 1) (+ r 1))
                :col c
            }
            k
        )
        ]
        [mo v]
    )) flat)

    grouped (group-by (fn [[k v]] k) moved)

    next (into {} (map
        (fn [[k vs]]  [k (map (fn [[_k v]] v)   vs)]  )
        (seq grouped)
    ))
    ]

    (merge grid {:map next :number (+ n 1)})
))

(defn show-grid [grid pos] (let
    [
    {n :number m :map
        min-row :min-row max-row :max-row
        min-col :min-col max-col :max-col
        } grid
    ]
    (str/join "\n" (map (fn [r]
        (str/join "" (map (fn [c]
            (first (get m {:row r :col c} [(if (= {:row r :col c} pos) "E" ".")]))
        ) (range min-col (+ max-col 1))
        ))
    ) (range min-row (+ max-row 1))
    ))
))

(defn walk [grids start end] (letfn
    [
    (do-move [grids pos remaining best visited] (let
        [
            ; _c (pprint grids)
            [cur {m :map n :number
                min-row :min-row max-row :max-row
                min-col :min-col max-col :max-col
                :as grid
            } & rest] grids

            {r :row c :col} pos

            options (if (= pos start)
                [[{:row (if (== r min-row) (+ r 1) (- r 1)) :col c} "v"] [pos "*"]]
                [[{:row (+ r 1) :col c} "v"] [{:row r :col (+ c 1)} ">"]
                    [{:row (- r 1) :col c} "^"] [{:row r :col (- c 1)} "<"]
                    [pos "*"]]
            )

            filtered (filter (fn [[o _]]
                (case (get m o ".")
                    "." true
                    ["g"] true
                    false
                )
            ) options)

            ; _a (pprint [(:number cur) remaining pos filtered])
            ; _b (println (show-grid cur pos))
        ]

        (reduce (fn [b [o e]] (let
            [
                bb (move (cons grid rest) o (- remaining 1) b visited)
            ]
            (if (< b bb) b bb)
        )) best filtered)
    ))

    (move [grids pos remaining best visited] (let
        [
            {n :number} (first grids)
            {pr :row pc :col} pos
            {er :row ec :col} end
            visit {:row pr :col pc :number n}
        ]
        (if (contains? visited visit)
            1000000
            (let
                [
                    visited2 (conj! visited visit)
                    ; _a (println (count visited2))
                ]
                (cond
                    (= end pos) n ; (let [_a (println n)] n)
                    (<= remaining 0) 1000000
                    (> (+ (- er pr) (- ec pc)) best) 1000000
                    true (do-move grids pos remaining best visited2)
                )
            )
        )
    ))
    ]
    (let
    [
        w (move grids start 300 1000000 (transient #{}))
        n (:number (first grids))
    ]
    (- w n)
    )

))

(defn back-again [grids start end] (let
    [
         back (walk grids end start)
         ; _a (println back)
         rest (drop back grids)
         again (walk rest start end)
         ; _b (println again)
    ]
    (+ back again)
))

(def grids (take 1000 (iterate wind (:grid world))))

(def res (walk grids (:start world) (:end world)))
(pprint res)

(def ba (back-again (drop res grids) (:start world) (:end world)))
(pprint (+ res ba))

; (pprint (map (fn [g] (println (show-grid g (:start g)))) grids))

