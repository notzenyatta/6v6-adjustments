#!mainFile "../../dev_main.opy"

#!define ADJ_VENTURE_DRILL_DASH_COOLDOWN_BURROWED (ADJ_VENTURE_DRILL_DASH_COOLDOWN/2)

rule "[venture/drill_dash.opy]: Constrain Drill Dash Cooldown":
    @Event eachPlayer
	@Condition eventPlayer.getCurrentHero() == Hero.VENTURE
    @Condition eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE) > 0
	
	if eventPlayer.isUsingAbility1():
		eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, ADJ_VENTURE_DRILL_DASH_COOLDOWN_BURROWED)
	else:
		eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, ADJ_VENTURE_DRILL_DASH_COOLDOWN)
