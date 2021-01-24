(require [hylibtk [*]])
(import [hylibtk [*]])

(tk root {}
  (label hello1 {:side TOP  :text "hello, world"  :fg "white"  :bg "black"})
  (label hello2 {:side TOP  :text "hello, world"  :font (,)})
  (label hello3 {:side TOP  :text "hello, world"  :font (, "System")})
  (label hello4 {:side TOP  :text "hello, world"  :font (, "System" 20)})
  (label hello5 {:side TOP  :text "hello, world"  :font (, "" 20)})  ; size only
  (label hello6
    {:side TOP  :text "hello, world"
      :font (, "System" 20 "normal" "normal" "normal" "normal")})
  (label hello7
    {:side TOP  :text "hello, world"
      :font (, "System" 20 "bold" "italic" "underline" "overstrike")}))

(.mainloop root)
