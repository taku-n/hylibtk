"hylibtk is a library of Hy for Tkinter."

(import [tkinter [*]])
(import [tkinter.ttk :as ttk])

(defmacro get-attr [attr attrs]
  `(try (. ~attrs [~attr])
        (except [e KeyError] None)))

(defmacro get-attr-or-default [attr attrs default]
  `(try (. ~attrs [~attr])
        (except [e KeyError] ~default)))

(defmacro pack [objname attrs defaults]
  `(.pack ~objname
    :side   (get-attr-or-default :side   ~attrs (get-attr-or-default :side   ~defaults TOP))
    :expand (get-attr-or-default :expand ~attrs (get-attr-or-default :expand ~defaults False))
    :fill   (get-attr-or-default :fill   ~attrs (get-attr-or-default :fill   ~defaults NONE))
    :anchor (get-attr-or-default :anchor ~attrs (get-attr-or-default :anchor ~defaults CENTER))
    :padx   (get-attr-or-default :padx   ~attrs (get-attr-or-default :padx   ~defaults 0))
    :pady   (get-attr-or-default :pady   ~attrs (get-attr-or-default :pady   ~defaults 0))
    :ipadx  (get-attr-or-default :ipadx  ~attrs (get-attr-or-default :ipadx  ~defaults 0))
    :ipady  (get-attr-or-default :ipady  ~attrs (get-attr-or-default :ipady  ~defaults 0))))

(defmacro set-attr [attr setting]
  `(if ~setting (setv ~attr ~setting)))

(defmacro set-attrs [objname attrs]
  `(for [k ~attrs]
    (cond [(= k :side)   (continue)]
          [(= k :expand) (continue)]
          [(= k :fill)   (continue)]
          [(= k :anchor) (continue)]
          [(= k :padx)   (continue)]
          [(= k :pady)   (continue)]
          [(= k :ipadx)  (continue)]
          [(= k :ipady)  (continue)]
          [True (set-attr (. ~objname [(name k)]) (get-attr k ~attrs))])))

(defmacro tk [objname attrs &rest body]
"(tk root {}
  first-child
  second-child
  ...)
(.mainloop root)"
  `(do (global ~objname)
       (setv ~objname (Tk))
       (if (get-attr :title ~attrs) (.title ~objname (get-attr :title ~attrs)))
       ;(if (get-attr :iconphoto ~attrs) ...  ; Not implemented. Execute (.iconphoto root) manually.
       (if (get-attr :geometry ~attrs) (.geometry ~objname (get-attr :geometry ~attrs)))
       ;(if (get-attr :resizable ~attrs) ...  ; Not implemented. Execute (.resizable root) manually.
       ;(if (get-attr :minsize ~attrs) ...; Not implemented. Execute (.minsize root) manually.
       ;(if (get-attr :maxsize ~attrs) ...; Not implemented. Execute (.maxsize root) manually.
       (setv parent ~objname)
       ((fn [] ~@body))))

(defmacro frame [objname attrs &rest body]
  `(do (global ~objname)
       (setv ~objname (.Frame ttk parent))
       (pack ~objname ~attrs {:side TOP  :expand True  :fill BOTH})
       (set-attrs ~objname ~attrs)
       ((fn [] (setv parent ~objname)
               ((fn [] ~@body))))))

(defmacro frame* [objname parent attrs &rest body]
  `(do (setv parent ~parent)  ; Inside tk macro, setv must set the same value as what it was.
       (frame ~objname ~attrs ~@body)))

(defmacro tk-frame [objname attrs &rest body]
  `(do (global ~objname)
       (setv ~objname (Frame parent))
       (pack ~objname ~attrs {:side TOP  :expand True  :fill BOTH})
       (set-attrs ~objname ~attrs)
       ((fn [] (setv parent ~objname)
               ((fn [] ~@body))))))

(defmacro tk-frame* [objname parent attrs &rest body]
  `(do (setv parent ~parent)  ; Inside tk macro, setv must set the same value as what it was.
       (frame ~objname ~attrs ~@body)))

;(defmacro label [objname attrs]
;  `(do (global ~objname)
;       (setv ~objname (Label parent))
;       (.pack ~objname :side (get-attr-or-default :side LEFT ~attrs) :expand True :fill BOTH)
;       (set-attrs ~objname ~attrs)))
;
;(defmacro label* [objname parent attrs]
;  `(do (setv parent ~parent)
;       (label ~objname ~attrs)))
;
;(defmacro button [objname attrs]
;  `(do (global ~objname)
;       (setv ~objname (Button parent))
;       (.pack ~objname :side (get-attr-or-default :side LEFT ~attrs) :expand True :fill BOTH)
;       (set-attrs ~objname ~attrs)))
;
;(defmacro button* [objname parent attrs]
;  `(do (setv parent ~parent)
;       (button ~objname ~attrs)))
;
;(defmacro combobox [objname attrs]
;  `(do (global ~objname)
;       (setv ~objname (.Combobox ttk parent))
;       (.pack ~objname :side (get-attr-or-default :side LEFT ~attrs) :expand True :fill BOTH)
;       (set-attrs ~objname ~attrs)))
;
;(defmacro combobox* [objname parent attrs]
;  `(do (setv parent ~parent)
;       (combobox ~objname ~attrs)))
