#!mainFile "../../dev_main.opy"

##!define ADJ_VENTURE_DRILL_DASH_COOLDOWN 6
#!define ADJ_VENTURE_DRILL_DASH_COOLDOWN_BURROWED ADJ_VENTURE_DRILL_DASH_COOLDOWN / 2

playervar is_drill_dash_on_cd

rule "Debug: Monitor Secondary State":
	hudSubtext(localPlayer if localPlayer.hero_setup == Hero.VENTURE else null, "DD: {} ({})".format("ON CD" if 0 < localPlayer.getAbilityCooldown(Button.SECONDARY_FIRE) else "READY", localPlayer.getAbilityCooldown(Button.SECONDARY_FIRE)), HudPosition.TOP, 10, Color.AQUA, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)

rule "[venture/drill_dash.opy]: Constrain Drill Dash Cooldown":
    @Event eachPlayer
	@Condition eventPlayer.getCurrentHero() == Hero.VENTURE
    @Condition not 0 == eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE)
	eventPlayer.is_drill_dash_on_cd = true
	waitUntil(0 == eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE), Math.INFINITY)
	eventPlayer.is_drill_dash_on_cd = false

rule "[venture/drill_dash.opy]: Constrain Drill Dash Cooldown":
    @Event eachPlayer
	@Condition eventPlayer.getCurrentHero() == Hero.VENTURE
    @Condition not 0 == eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE)
	
	printLog("Initial use of DD")
	if eventPlayer.isUsingAbility1():
		printLog("Burrowed, Setting DD to {}".format(ADJ_VENTURE_DRILL_DASH_COOLDOWN_BURROWED))
		eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, ADJ_VENTURE_DRILL_DASH_COOLDOWN_BURROWED)
	else:
		printLog("Not Burrowed, Setting DD to {}".format(ADJ_VENTURE_DRILL_DASH_COOLDOWN))
		eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, ADJ_VENTURE_DRILL_DASH_COOLDOWN)