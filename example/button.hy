(require [hylibtk [*]])
(import [hylibtk [*]])

(tk root {}
  (button hello {:text "hello, world"}))

(.mainloop root)
