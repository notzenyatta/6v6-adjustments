#!mainFile "../../../main.opy"

#!include "heroes/ramattra/nemesis.opy"


rule "[ramattra/init.opy]: Initialize Ramattra":
    @Event eachPlayer
    @Hero ramattra
    @Condition eventPlayer.call_init

    newHero(OW1_RAMATTRA_HEALTH, OW1_RAMATTRA_ARMOR, 0)
    removeTankPassive()
    
    eventPlayer.call_init = false