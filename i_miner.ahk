#include helper_methods.ahk

; miner interface
 class IMiner{

    mapName := "null"

    mapSectionImages := []

    mineralList := []

     mine(){
     }

     move(){

     } 
 }

class RolanciaMiner extends IMiner{
         
        mapName := "Rolancia"
        mineralList := []
        
        baseImageDir := "images\map\mine\rolancia\"
        mapSectionImages := ["rolancia_section_1.png", "rolancia_section_2.png", "rolanica_section3.png", "rolancia_section_4.png", "rolancia_section_5.png", "rolancia_section_6.png"]

        __new(mineralList){
            this.mineralList := mineralList
        }

        mine(){
          msgbox Rolancia mine called 
        }
    
        move(){
            msgbox Rolancia move called
        }
}

class EpiloriaMiner extends IMiner{
             
            mapName := "Epiloria"

        baseImageDir := "images\map\mine\epiloria\"
        mapSectionImages := []

        __new(mineralList){
            this.mineralList := mineralList
        }
        
            mine(){
              msgbox Epiloria mine called
            }
        
            move(){
                msgbox Epiloria move called 
            }
}