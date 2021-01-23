(require [hylibtk [*]])
(import [hylibtk [*]])

(tk root {}
  (label hello {:text "hello, world"  :fg "red"}))

(.mainloop root)
