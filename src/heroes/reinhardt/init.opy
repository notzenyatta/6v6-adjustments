#!mainFile "../../../main.opy"

#!include "heroes/reinhardt/firestrike.opy"
#!include "heroes/reinhardt/charge.opy"
#!include "heroes/reinhardt/shatter.opy"


rule "[reinhardt/init.opy]: Initialize Reinhardt":
    @Event eachPlayer
    @Hero reinhardt
    @Condition eventPlayer.call_init

    newHero(OW1_REINHARDT_HEALTH, OW1_REINHARDT_ARMOR, 0)
    eventPlayer.call_init = false