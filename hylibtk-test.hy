(require [hylibtk [*]])
(import [hylibtk [*]])

; get-attr
(assert (= (get-attr :foo {:foo "hoge"  :bar "fuga"  :baz "piyo"})
           "hoge"))
(assert (= (get-attr :qux {:foo "hoge"  :bar "fuga"  :baz "piyo"})
           None))

; get-attr-or-default
(assert (= (get-attr-or-default :foo {:foo "hoge"  :bar "fuga"  :baz "piyo"} "hogehoge")
           "hoge"))
(assert (= (get-attr-or-default :qux {:foo "hoge"  :bar "fuga"  :baz "piyo"} "hogehoge")
           "hogehoge"))

; set-attr
(assert (= (do (setv d {"foo" "hoge"  "bar" "fuga"  "baz" "piyo"})
               (set-attr (. d ["foo"]) "hogehoge")
               d)
           {"foo" "hogehoge"  "bar" "fuga"  "baz" "piyo"}))
(assert (= (do (setv d {"foo" "hoge"  "bar" "fuga"  "baz" "piyo"})
               (set-attr (. d ["foo"]) None)
               d)
           {"foo" "hoge"  "bar" "fuga"  "baz" "piyo"}))

; set-attrs
(assert (= (do (setv d {"foo" "hoge"  "bar" "fuga"  "baz" "piyo"})
               (setv d-to-be-set {:foo "hogehoge"  :side "This will be ignored."})
               (set-attrs d d-to-be-set)
               d)
           {"foo" "hogehoge"  "bar" "fuga"  "baz" "piyo"}))
