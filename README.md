# hylibtk

Before starting development in Windows, set an environment variable:  
`PYTHONDONTWRITEBYTECODE` `""`  
(In Linux, this might not work fine. That's why I don't support Linux).  
For more information, see https://github.com/hylang/hy/issues/1324.

***

hylibtk is a library of Hy for Tkinter.

To run from an icon of explorer.exe, associate *.hy with the hy.exe command being printed by ">where hy.exe" in Command Prompt.  
(But I don't know how I can show a GUI window without a Command Prompt window).

I tried "embeddable package", "cx_Freeze" and "PyInstaller" to distribute but I failed.

example/window.hy:
```
(require [hylibtk [*]])
(import [hylibtk [*]])

(tk root {})

(.mainloop root)
```
![window.hy](img/window.png)

example/label.hy:
```
(require [hylibtk [*]])
(import [hylibtk [*]])

(tk root {}
  (label hello {:text "hello, world"}))

(.mainloop root)
```
![label.hy](img/label.png)
