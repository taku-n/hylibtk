"The same window being created by window.hy but explicitly."

(require [hylibtk [*]])
(import [hylibtk [*]])

; Not Confirmed:
; If the scale setting of Windows is 150%, the window size will be "300x300" instead.
(tk root {:title "tk"  :geometry "200x200"})

(.mainloop root)
