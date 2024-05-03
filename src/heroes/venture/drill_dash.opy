#!mainFile "../../dev_main.opy"

#!define ADJ_VENTURE_DRILL_DASH_COOLDOWN 6
#!define ADJ_VENTURE_DRILL_DASH_COOLDOWN_BURROWED 3

rule "[venture/drill_dash.opy]: Constrain Drill Dash Cooldown":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.isFiringSecondaryFire()

	waitUntil(0 < eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE) and not eventPlayer.isFiringSecondaryFire(), Math.INFINITY)
	if eventPlayer.isUsingAbility1():
		eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, ADJ_VENTURE_DRILL_DASH_COOLDOWN_BURROWED)
	else:
		eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, ADJ_VENTURE_DRILL_DASH_COOLDOWN)