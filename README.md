# hylibtk

Before starting development in Windows, set an environment variable:  
`PYTHONDONTWRITEBYTECODE` `""`  
(In Linux, this might not work fine. That's why I don't support Linux).

***

hylibtk is a library of Hy for Tkinter.

example/window.hy:
```
(require [hylibtk [*]])
(import [hylibtk [*]])

(tk root {})

(.mainloop root)
```
![window.hy](img/window.png)
