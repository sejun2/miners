; This file is only for test it's fuctions work correctly
; should be removed after test

; check admin
if not A_IsAdmin
{
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}
global mapSectionIndex := 0

;map section container
global section := ""
; 0 - off
; 1 - on
global digFlag := 0

global WindowTitle := "이룬"

; default - "nomap"
global mapName := "nomap"

global wantItem := []

global itemList := [
    " muro", "delin"
]


global mapSectionFileName := "section1.png|section2.png|section3.png|section4.png|section5.png"

mine()
; 광물 캐기
mine(){
    ;MsgBox, "start mine"
    digFlag = 1
    Loop{
        if(digFlag = 0) {
            return
        } 
        ; 이미지 검색
        ImageSearch, FoundX, FoundY, x, y, 800, 600, muro.png ; *ImagePath*에 검색할 이미지의 경로를 입력하세요
        if ErrorLevel = 2
        {
            MsgBox, "이미지를 찾을 수 없어 종료합니다. 이미지 경로를 확인해주세요."
            ExitApp
        }
        else if ErrorLevel = 1
        {
            moveTo()
        } 
        else{
            ; 이미지가 검색되면 마우스 클릭
            ;mouseclick, left, FoundX, FoundY, 2
            PostClick(FoundX, FoundY)
            ;PostClick(FoundX, FoundY)
            sleep, 150
            ;  MouseClick, left, FoundX, FoundY
            ;PostMove(100,100)
            ;mousemove, 100, 100  
            Sleep, 6500 ; 클릭 후 잠시 대기  

            Send, {Space}
            Sleep, 200
            Send, {Space}
        }

    }
}

; 맵의 다른곳으로 이동
; 필요 param - 이동할곳의 미니맵 image list
; 해당 리스트의 가리키고있는 index 에서 +1 씩 더해주며 이동시킴  
; delay 는 일단 3000 * 60 ms
moveTo(){
    digFlag:=0

    ;Msgbox, %mapSectionIndex%

    if(mapSectionIndex = 0){
        section := "section1.png"
    }else if(mapSectionIndex = 1){
        section := "section2.png"
    } else if(mapSectionIndex =2){
        section := "section3.png" 
    }else if(mapSectionIndex = 3) {
        section := "section4.png"
    }else if(mapSectionIndex = 4){
        section := "section5.png"
    }

    ;msgbox, %section%
    ; 이미지 검색
    ImageSearch, FoundX, FoundY, x, y, 800, 600, %section% ; *ImagePath*에 검색할 이미지의 경로를 입력하세요
    if ErrorLevel = 2
    {
        MsgBox, "맵 이미지 찾기 실패"
        ExitApp
    }
    else if ErrorLevel = 1
    {
        mapSectionIndex = 0
        digFlag := 1
        sleep, 500
        return
    }
    else{
        ; 이미지가 검색되면 마우스 클릭
        PostClick(FoundX, FoundY)
        ;MouseClick, left, FoundX, FoundY , 3  
    }

    mapSectionIndex++
    if(mapSectionIndex =5) {
        mapSectionIndex = 0 
    }
    digFlag := 1
    ;mousemove, 600, 500
    PostMove(600, 500)
    sleep, 5500
}

PostMove(MouseX,MouseY){ 
    MousePos := MouseX | MouseY<< 16
    PostMessage, 0x200, 0, %MousePos% ,,%WindowTitle%
} 

PostClick(MouseX,MouseY){
    WinGetPos , x, y, Width, Height, %WindowTitle%

    correctX := MouseX 
    correctY := MouseY - 25

    MousePos := correctX | correctY<< 16
    PostMessage, 0x200, 0, %MousePos% ,,%WindowTitle%
    PostMessage, 0x201, 1, %MousePos% ,,%WindowTitle%
    PostMessage, 0x202, 0, %MousePos% ,,%WindowTitle%
}

PostClick_Right(MouseX,MouseY){
    WinGetPos , x, y, Width, Height, %WindowTitle%

    MouseY := MouseY - 12

    correctX := MouseX - x
    correctY := MouseY -y

    MousePos := correctX | correctY<< 16
    PostMessage, 0x200, 0, %MousePos% ,,%WindowTitle%
    PostMessage, 0x204, 1, %MousePos% ,,%WindowTitle%
    PostMessage, 0x205, 0, %MousePos% ,,%WindowTitle%
}

mine()
move:
    moveTo()

ExitApp