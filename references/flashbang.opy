#!define OW1_MCCREE_FLASHBANG_AOE_RADIUS 3
#!define OW1_MCCREE_FLASHBANG_COOLDOWN_TIME 10
#!define OW1_MCCREE_FLASHBANG_DAMAGE 25
#!define OW1_MCCREE_FLASHBANG_RANGE 7
#!define OW1_MCCREE_FLASHBANG_SPEED 30
#!define OW1_MCCREE_FLASHBANG_STUN_DURATION 0.8

rule "[mccree/init.opy]: Disallow throwing Magnetic Grenade":
    @Event eachPlayer
    @Hero mccree

    eventPlayer.disallowButton(Button.ABILITY_2)


rule "[mccree.opy]: Throw projectile when pressing e":
    @Event eachPlayer
    @Hero mccree
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_2)
    @Condition eventPlayer.getAbilityCooldown(Button.ABILITY_2) <= 0
    @Condition not eventPlayer.isUsingAbility1() # Ensure Cassidy is not rolling
    @Condition not eventPlayer.hasStatusEffect(Status.HACKED) # Ensure Cassidy is not hacked
    @Condition not eventPlayer.hasStatusEffect(Status.FROZEN) # Ensure Cassidy is not frozen
    @Condition not eventPlayer.hasStatusEffect(Status.KNOCKED_DOWN) # Ensure Cassidy is not knocked down
    @Condition not eventPlayer.hasStatusEffect(Status.ASLEEP) # Ensure Cassidy is not asleep
    @Condition not eventPlayer.hasStatusEffect(Status.STUNNED) # Ensure Cassidy is not stunned

    createProjectile(Projectile.ORB, 
                     eventPlayer, 
                     null, 
                     null, 
                     Relativity.TO_WORLD, 
                     ModifyHealth.DAMAGE, 
                     getOppositeTeam(eventPlayer.getTeam()), 
                     OW1_MCCREE_FLASHBANG_DAMAGE, 
                     1, 
                     OW1_MCCREE_FLASHBANG_AOE_RADIUS, 
                     DynamicEffect.BAD_EXPLOSION, 
                     DynamicEffect.EXPLOSION_SOUND, 
                     0, 
                     OW1_MCCREE_FLASHBANG_SPEED, 
                     OW1_MCCREE_FLASHBANG_RANGE/OW1_MCCREE_FLASHBANG_SPEED, 
                     0, 
                     0, 
                     1)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, OW1_MCCREE_FLASHBANG_COOLDOWN_TIME)


rule "[mccree.opy]: Stun flashed enemy":
    @Event playerDealtDamage
    @Hero mccree
    @Condition eventAbility == 0

    victim.setStatusEffect(eventPlayer, Status.STUNNED, OW1_MCCREE_FLASHBANG_STUN_DURATION)
