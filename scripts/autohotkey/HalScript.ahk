;Key			Function
;-------------------------------------------
;Alt+Click 		Moves
;Alt+RClick	 	Resizes
;Alt+S 			Shows the titlebar
;Alt+H 			Hides the titlebar
;Alt+Left		Snaps Window Left
;Alt+Right		Snaps Window Right
;Alt+Up			Snaps Window Top
;Alt+Down		Snaps Window Bottom
;Alt+C			Closes Window
;Alt+M			Maximize Window
;Alt+N			Minimize Window
;Alt+# 			Stack window to the bottom left, # is its
;				 place in the stack
;Alt+Shift+#	Stack window to the bottom right, # is
;				 its place in the stack	

CoordMode,Mouse,Screen
!LButton::
	WinGetPos X,Y,,,A
	MouseGetPos aX,aY
	OffsetX := aX - X
	OffsetY := aY - Y
	WHILE GetKeyState("LButton","P") {
		MouseGetPos aX,aY
		nX := aX - OffsetX
		nY := aY - OffsetY
		WinMove A,, %nX%,%nY%
	}
	RETURN
!RButton::
	WinGetPos X,Y,,,A
	WHILE GetKeyState("RButton","P") {
		MouseGetPos aX,aY
		bX := aX - X
		bY := aY - Y
		WinMove A,,%X%,%Y%,%bX%,%bY%
	}
	RETURN
!H::
	WinSet, Style, -0xC00000, A
	RETURN
!S::
	WinSet, Style, +0xC00000, A
	RETURN
!C::
	WinClose A
	RETURN
!Left::
	SysGet Mon,MonitorWorkArea
	Width := MonRight/2
	WinMove A,,0,0,%Width%,%MonBottom%
	RETURN
!Right::
	SysGet Mon,MonitorWorkArea
	Width := MonRight/2
	WinMove A,,%Width%,0,%Width%,%MonBottom%
	RETURN
!Up::
	SysGet Mon,MonitorWorkArea
	Height := MonBottom/2
	WinMove A,,0,0,%MonRight%,%Height%
	RETURN
!Down::
	SysGet Mon,MonitorWorkArea
	Height := MonBottom/2
	WinMove A,,0,%Height%,%MonRight%,%Height%
	RETURN
!M::
	SysGet Mon,MonitorWorkArea
	WinMove A,,0,0,%MonRight%,%MonBottom%
	RETURN
!N::
	WinMinimize A
	RETURN
!1::
	
	SysGet Mon,MonitorWorkArea
	WinGetPos oX,oY,oW,oH,A
	nY := MonBottom-oH-4
	WinMove A,,4,%nY%
	RETURN
!2::
	
	SysGet Mon,MonitorWorkArea
	WinGetPos tX,tY,tW,tH,A
	nY := MonBottom-oH-8-tH
	WinMove A,,4,%nY%
	RETURN
!3::
	
	SysGet Mon,MonitorWorkArea
	WinGetPos thX,thY,thW,thH,A
	nY := MonBottom-oH-12-tH-thH
	WinMove A,,4,%nY%
	RETURN

!+1::
	
	SysGet Mon,MonitorWorkArea
	WinGetPos oX,oY,oW,oH,A
	nY := MonBottom-oH-4
	WinMove A,,MonRight-oW-4,%nY%
	RETURN
!+2::
	
	SysGet Mon,MonitorWorkArea
	WinGetPos tX,tY,tW,tH,A
	nY := MonBottom-oH-8-tH
	WinMove A,,MonRight-tW-4,%nY%
	RETURN
!+3::
	
	SysGet Mon,MonitorWorkArea
	WinGetPos thX,thY,thW,thH,A
	nY := MonBottom-oH-12-tH-thH
	WinMove A,,MonRight-thW-4,%nY%
	RETURN