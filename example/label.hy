(require [hylibtk [*]])
(import [hylibtk [*]])

(tk root {}
  (label hello {:text "hello, world"}))

(.mainloop root)
