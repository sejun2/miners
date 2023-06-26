#include helper_methods.ahk

global WindowTitle
global map

; gui variables
; setting window info section
gui, add ,edit, w300 h20 vWindowTitle, �Ϸ��þ� â �̸��� �Է��ϼ���
gui, add, button , w100 h30  vbutton_set_window  gset_window, �����ϱ�
gui, add, button , w100 h30 vbutton_start gstart,  , �����ϱ�

; select mineral section
global mineralList := Array()
global mineralIndex := -1

Gui, Add, CheckBox, w80 h30 vmuro gmuro, ����
Gui, Add, CheckBox, w80 h30 vdelin gdelin, ����

; select mineral map section
gui, add ,listbox, x150 y50 w100 h150 vmap gmap, �η��þ�|���ʷθ���

; information section
gui, add ,text, w200  vtext_map_position, Ŭ���� �̴ϸ� ��ġ
gui, add, text ,w200  vtext_map_name, �� �̸�
gui, add, text, w200 vtext_position, ĳ������ġ
gui, add, text, w200 vtext_ismoving, ������ ����

; winidow frame
gui, show, w400 h400, Elancia-miner
return

start:
msgbox, �����߽��ϴ�

loop{
    getCharacterStatus()
}
return

Stop_this:
	Coin:=0
	return



set_window:
gui, submit, nohide
if(checkWindowAvailable(WindowTitle)){
    msgbox, ������ �Ϸ�Ǿ����ϴ�
    guicontrol, disabled, button_set_window
}
return

getCharacterStatus(){
location := Get_Location()
GuiControl, , text_map_name, ���� �� : %location%

currentPosition := GetPos()
posX := currentPosition.PosX
posY := currentPosition.PosY
GuiControl, , text_position, ���� ��ġ : %posX%, %PosY%

isMoving := is_moving()
GuiControl, , text_ismoving, ������ ���� : %isMoving%
;Click_CurrentMiniMapPos(50, 10)
;GuiControl, , text_map_position, Ŭ���� �̴ϸ� ��ġ : 50, 10
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