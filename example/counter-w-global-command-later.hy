(require [hylibtk [*]])
(import [hylibtk [*]])

(setv x 0)

(tk root {}
  (label count {:side TOP  :text (str x)})
  (button count-up {:text "Count Up"}))

(setv (. count-up ["command"])
      (fn [] (global x)
             (setv x (inc x))
             (setv (. count ["text"]) x)))

(.mainloop root)
