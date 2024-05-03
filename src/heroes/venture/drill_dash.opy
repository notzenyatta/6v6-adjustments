#!mainFile "../../dev_main.opy"

#!define ADJ_VENTURE_DRILL_DASH_COOLDOWN 6

rule "[venture/drill_dash.opy]: Constrain Drill Dash Cooldown":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition ADJ_VENTURE_DRILL_DASH_COOLDOWN < eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE)

    eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, 6)