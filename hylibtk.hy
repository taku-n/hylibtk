(import [tkinter [*]])

(defmacro get-attr [attr]
  `(try (. attrs [~attr])
        (except [e KeyError] None)))

(defmacro get-attr-or-default [attr default]
  `(try (. attrs [~attr])
        (except [e KeyError] ~default)))

(defmacro set-attr [attr setting]
  `(if ~setting (setv ~attr ~setting)))

(defmacro set-attrs [objname attrs]
  `(for [k ~attrs] (set-attr (. ~objname [(name k)]) (get-attr k)))

(defmacro tk [objname attrs &rest body]
  `(do (global ~objname)
       (setv ~objname (Tk))
       (setv attrs ~attrs)  ; for get-attr and get-attr-or-default
       (.title ~objname (get-attr-or-default :title "tk"))
       (setv parent ~objname)
       ((fn [] ~@body))))

(defmacro frame [objname attrs &rest body]
  `(do (global ~objname)
       (setv ~objname (Frame parent))
       (setv attrs ~attrs)  ; for get-attr and get-attr-or-default
       (.pack ~objname :side (get-attr-or-default :side TOP) :expand True :fill BOTH)
       ((fn [] (setv parent ~objname)
               ((fn [] ~@body))))))

(defmacro frame* [objname parent attrs &rest body]
  `(do (setv parent ~parent)
       (frame ~objname ~attrs ~@body)))

(defmacro label [objname attrs]
  `(do (global ~objname)
       (setv ~objname (Label parent))
       (setv attrs ~attrs)  ; for get-attr and get-attr-or-default
       (.pack ~objname :side (get-attr-or-default :side LEFT) :expand True :fill BOTH)
       (set-attrs ~objname ~attrs)
       (set-attr (. ~name ["text"]) (get-attr :text))
       (set-attr (. ~name ["fg"]) (get-attr :fg))
       (set-attr (. ~name ["bg"]) (get-attr :bg))
       (set-attr (. ~name ["font"]) (get-attr :font))))

(defmacro label* [name parent attr]
  `(do (setv parent ~parent)
       (label ~name ~attr)))

#_(defmacro button [name attr]
  `(do (global ~name)
       (setv ~name (Button parent))
       (setv attr ~attr)  ; for get-attr and get-attr-or-default
       (.pack ~name :side (get-attr :side LEFT) :expand True :fill BOTH)
       (setv (. ~name ["text"]) (get-attr :text "button"))
       (setv (. ~name ["command"]) (get-attr :command (fn [])))))

#_(defmacro button* [name parent attr]
  `(do (setv parent ~parent)
       (button ~name ~attr)))

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
