(import [tkinter [*]])

(defmacro get-attr [attr attrs]
  `(try (. ~attrs [~attr])
        (except [e KeyError] None)))

(defmacro get-attr-or-default [attr default attrs]
  `(try (. ~attrs [~attr])
        (except [e KeyError] ~default)))

(defmacro set-attr [attr setting]
  `(if ~setting (setv ~attr ~setting)))

(defmacro set-attrs [objname attrs]
  `(for [k ~attrs] (cond [(= k :side) (continue)]
                         [True (set-attr (. ~objname [(name k)]) (get-attr k ~attrs))])))

(defmacro tk [objname attrs &rest body]
  `(do (global ~objname)
       (setv ~objname (Tk))
       (.title ~objname (get-attr-or-default :title "tk" ~attrs))
       (setv parent ~objname)
       ((fn [] ~@body))))

(defmacro frame [objname attrs &rest body]
  `(do (global ~objname)
       (setv ~objname (Frame parent))
       (.pack ~objname :side (get-attr-or-default :side TOP ~attrs) :expand True :fill BOTH)
       ((fn [] (setv parent ~objname)
               ((fn [] ~@body))))))

(defmacro frame* [objname parent attrs &rest body]
  `(do (setv parent ~parent)
       (frame ~objname ~attrs ~@body)))

(defmacro label [objname attrs]
  `(do (global ~objname)
       (setv ~objname (Label parent))
       (.pack ~objname :side (get-attr-or-default :side LEFT ~attrs) :expand True :fill BOTH)
       (set-attrs ~objname ~attrs)))

(defmacro label* [objname parent attrs]
  `(do (setv parent ~parent)
       (label ~objname ~attrs)))

(defmacro button [objname attrs]
  `(do (global ~objname)
       (setv ~objname (Button parent))
       (.pack ~objname :side (get-attr-or-default :side LEFT ~attrs) :expand True :fill BOTH)
       (set-attrs ~objname ~attrs)))

(defmacro button* [objname parent attrs]
  `(do (setv parent ~parent)
       (button ~objname ~attrs)))
