(import [tkinter [*]])

(defmacro get-attr [attr default]
  `(try (. attr [~attr])
        (except [e KeyError]
          ~default)))

;(defmacro tk [name attr &rest body]
;  `(do (setv ~name (Tk))
;       (setv attr ~attr)
;       (.title ~name (get-attr :title "tk"))
;       (as-> ~name parent @body)))

(defmacro tk [name attr]
  `(do (setv ~name (Tk))
       (setv attr ~attr)
       (.title ~name (get-attr :title "tk"))))

;(defmacro tk [name attr &rest body]
;  `(do (setv ~name (Tk))
;       (setv attr ~attr)
;       (.title ~name (get-attr :title "tk"))
;       (as-> ~name parent @body)))

;(defmacro frame [name parent attr &rest body]
;  `(do (setv ~name (Frame ~parent))
;       (.pack ~name :side TOP :expand True :fill BOTH)
;       (as-> ~name parent @body)
;       ~parent))

;(defmacro label [name parent attr]
;  `(do (setv ~name (Label parent))
;       (.pack ~name :side LEFT :expand True :fill BOTH)
;       ~parent))

;(defmacro label [name parent attr &rest body]
;  `(do ;(global ~name)
;       (setv ~name (Label parent))
;       (.pack ~name :side LEFT :expand True :fill BOTH)
;       ~@body))

;(defmacro frame [name parent &rest body]
;  `(do (setv ~name (Frame ~parent))
;       (.pack ~name :side TOP :expand True :fill BOTH)
;       (as-> ~name parent ~@body)
;       ~parent))

;(defn tk [name &rest body &kwonly [title "tk"]]
;  (

;(defmacro tk [name &rest body &kwonly [title "tk"]]
;  `(do (setv ~name (Tk))
;       (.title ~name ~title)
;       (as-> ~name parent @body)))

;(defmacro tk [name attribute &rest body]

;(defmacro tk [name &rest body &optional [title "tk"]]
;(defmacro tk [name &optional [title "tk"] &rest body]
;  `(do (setv ~name (Tk))
;       (.title ~name ~title)
;       (as-> ~name parent @body)))

;(defmacro tk [name &optional [title "tk"] &rest body]
;  `(do (setv ~name (Tk))
;       (setv parent ~name)
;       (.title ~name ~title)
;       ~@body))

;(defmacro frame [name &optional parent-arg &rest body]
;  `(do (setv ~name (Frame ~parent))
;       (.pack ~name :side TOP :expand True :fill BOTH)
;       ~@body))

;(defmacro frame [name parent &rest body]
;  `(do (setv ~name (Frame ~parent))
;       (.pack ~name :side TOP :expand True :fill BOTH)
;       (as-> ~name parent ~@body)
;       ~parent))

;(defmacro label [name &rest body]
;  `(do ;(global ~name)
;       (setv ~name (Label parent))
;       (.pack ~name :side LEFT :expand True :fill BOTH)
;       ~@body))
