; global variables

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

; winidow frame
gui, show, w400 h400, Elancia-miner
return

start:
msgbox, 시작했습니다
return

set_window:
gui, submit, nohide
if(checkWindowAvailable(WindowTitle)){
    msgbox, 설정이 완료되었습니다
    guicontrol, disabled, button_set_window
}
return

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