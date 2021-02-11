(require [hylibtk [*]])
(import [hylibtk [*]])

(tk root {}
  (frame* frame1 root {}
    (label* label1 frame1 {:text "label1"})
    (tk-label* label2 frame1 {:text "label2"})
  (tk-frame* frame2 root {}
    (button* button1 frame2 {:text "button1"})
    (tk-button* button2 frame2 {:text "button2"}))))

;(print "Starting...")
;
;(setv x 0)
;
;(tk root {}
;  (frame frame {}
;    (combobox* combobox frame {})
;    (frame frame2 {}
;      (label label {:text "label"}))
;    (frame frame3 {}
;      (button button
;        {:command
;          (fn []
;            (global x)
;            (setv x (+ x 1))
;            (setv (. label1 ["text"]) x))}))))

;(setv (. button ["command"])
;      (fn []
;        (global x)
;        (setv x (+ x 1))
;        (setv (. label1 ["text"]) x)))

;(tk root {}
;  (frame frame {}
;    (label label1 {:text "label1"})
;    (frame frame2
;      (label label {:text "label"}))
;    (frame frame3
;      (button* button frame3 {})))
;            (frame frame-second {} (label label-second {:text "label-2nd"}) (label label-third {:text "label-3rd"})))

;(setv (. label-second ["text"]) "hoge")

;(defn f [name]
;  (global name)
;  (setv name (Tk)))

;(f 'root)

;(tk root {} (frame frame {}))

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
