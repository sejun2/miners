; global variables

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

; winidow frame
gui, show, w400 h400, Elancia-miner
return

start:
msgbox, �����߽��ϴ�
return

set_window:
gui, submit, nohide
if(checkWindowAvailable(WindowTitle)){
    msgbox, ������ �Ϸ�Ǿ����ϴ�
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