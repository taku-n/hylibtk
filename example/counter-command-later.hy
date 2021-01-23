(require [hylibtk [*]])
(import [hylibtk [*]])

(tk root {}
  (label count {:side TOP  :text "0"})
  (button count-up {:text "Count Up"}))

(setv (. count-up ["command"])
      (fn [] (setv (. count ["text"])
                   (inc (int (. count ["text"]))))))

(.mainloop root)
