#include i_miner.ahk

if not A_IsAdmin {
   MsgBox, 관리자 권한으로 실행해주세요
   ExitApp
}


#SingleInstance, on
#NoEnv
#Persistent
#KeyHistory 0
#NoTrayIcon
#Warn All, Off

global map
global miner
global x
global y

; gui variables
; setting window info section
gui, add ,edit, w300 h20 vWindowTitle, 일랜시아 창 이름을 입력하세요
gui, add, button , w100 h30  vbutton_set_window  gset_window, 설정하기
gui, add, button , w100 h30 vbutton_start gstart,  , 시작하기

; select mineral section
global mineralList := Array()
global mineralIndex := -1

Gui, Add, CheckBox, w80 h30 vmuro gmuro, 무로
Gui, Add, CheckBox, w80 h30 vdelin gdelin, 델린

; select mineral map section
gui, add ,listbox, x150 y50 w100 h150 vmap gmap, 로랜시아|에필로리아

; information section
gui, add ,text, w200  vtext_map_position, 클릭한 미니맵 위치
gui, add, text ,w200  vtext_map_name, 맵 이름
gui, add, text, w200 vtext_position, 캐릭터위치
gui, add, text, w200 vtext_ismoving, 움직임 여부
gui, add ,text, w200 vtext_behaviour, 행동 상태 
gui, add, text, w200 vtext_minimapx, 미니맵x
gui, add, text, w200 vtext_minimapy, 미니맵y

; winidow frame
gui, show, w400 h400, Elancia-miner
return

start:
msgbox, 시작했습니다
init()
miner.mine()
loop{
    getCharacterStatus()
}
return

Stop_this:
	Coin:=0

    wall_remove_disable()
    floor_remove_disable()
    char_remove_disable()
	return



set_window:
gui, submit, nohide
if(checkWindowAvailable(WindowTitle)){
    msgbox, 설정이 완료되었습니다
    guicontrol, disabled, button_set_window
}
return

init(){
WinGetPos , x, y, Width, Height, %WindowTitle%
setMineralList()
; set miner
location := Get_Location()
GuiControl, , text_map_name, 현재 맵 : %location%

minerFactory := new MinerFactory()
miner := minerFactory.create(location, mineralList)

wall_remove_enable()
floor_remove_enable()
char_remove_enable()
}

getCharacterStatus(){
location := Get_Location()
GuiControl, , text_map_name, 현재 맵 : %location%

currentPosition := GetPos()
posX := currentPosition.PosX
posY := currentPosition.PosY
GuiControl, , text_position, 현재 위치 : %posX%, %PosY%

isMoving := is_moving()
GuiControl, , text_ismoving, 움직임 여부 : %isMoving%

minimapX = getMinimapPosX()
minimapY = getMinimapPosY()

;Click_CurrentMiniMapPos(50, 10)
;GuiControl, , text_map_position, 클릭한 미니맵 위치 : 50, 10
}

checkWindowAvailable(windowTitle){
    WinWait, %windowTitle%,,3
    if(errorlevel = 1){
    return false
    }else if(errorlevel = 0){
        return true
    }
}

setMineralList(){
    if(muro = true){
        mineralList.Push("muro")
    }
    if(delin = true){
        mineralList.Push("delin")
    }
}

muro:
gui, submit, nohide
return

delin:
gui, submit, nohide
return

map:
gui, submit, nohide
msgbox, %map%
return

guiClose:
ExitApp

F9::
 ExitApp