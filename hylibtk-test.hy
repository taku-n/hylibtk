(require [hylibtk [*]])
(import [hylibtk [*]])

(assert (= (get-attr :foo {:foo "hoge"  :bar "fuga"  :baz "piyo"})
           "hoge"))
(assert (= (get-attr :qux {:foo "hoge"  :bar "fuga"  :baz "piyo"})
           None))

(assert (= (get-attr-or-default :foo "quux" {:foo "hoge"  :bar "fuga"  :baz "piyo"})
           "hoge"))
(assert (= (get-attr-or-default :qux "quux" {:foo "hoge"  :bar "fuga"  :baz "piyo"})
           "quux"))
