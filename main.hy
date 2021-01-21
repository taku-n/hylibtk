(import sys)
(setv (. sys dont_write_bytecode) True)

; Do these 3 lines of comment get this program run correctly?
; This program makes an error although sometimes works correctly.
; The error is "NameError: name 'hyx_Xcommercial_atXbody' is not defined".

(require [hylibtk [*]])
(import [hylibtk [*]])

(tk root {})

;(tk root {:hoge "foo"  :title "title"})

;(tk root {:hoge "foo"  :title "title"})

;(tk root {} (frame frame)
;         (frame frame-second))

;(tk root (frame frame (label label))
;         (frame frame-second (label label-second)))

;(tk root (frame frame-first (label label-first))
;         (frame frame-second (label label-second)))

;(tk root "hylibtk")
;(.title root "hylibtk")

;(setv frame (Frame root))
;(.pack frame :side TOP :expand True :fill BOTH)

;(setv label (Label frame))
;(.pack label :side LEFT :expand True :fill BOTH)

;(.text label "hello, world")
;(setv (. label text) "hello, world")
;(setv (:text label) "hello, world")
;;(assoc label-first "text" "hello, world")
;(assoc label-second "text" "hello, second")
;(assoc label :text "hello, world")
;;(setv (. label-second ["text"]) "hello, second")

(.mainloop root)
