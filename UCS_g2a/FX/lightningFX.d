
/* func int GetLightningFXArea(var int spellID, var int spellLevel) // inclusion area radius
{
	if(spellID == SPL_Zap){ return 0; };
	if(spellID == SPL_ChargeZap){ return SwitchBySpellLevel(spellLevel, 0, 0, 200, 400); };
	if(spellID == SPL_LightningFlash){ return 0; };
	
	return 0;
};

func int lightningFX_IncludeCnd(var int fxID) // include in area condition
{
	// fxID - fx instance
	// self - damage receiver
	// other - damage sender
	
	return true;
};

var int lightningFX; // FX INSTANCE

func void startLightningFX(var C_NPC damageSender, var C_NPC damageReceiver, var int spellID, var int spellLevel)
{
	var int lightningFX_Area; lightningFX_Area = GetLightningFXArea(spellID, spellLevel);
	
	// PROTOTYPE BASED AREA FX
	UCS_StartAreaFX(lightningFX, LightningFXP, lightningFX_Area, lightningFX_IncludeCnd, damageSender, damageReceiver);
};

func void modifyLightningFX(var C_NPC damageSender, var C_NPC damageReceiver)
{
	if (UCS_GetCurrentIter(lightningFX, damageSender, damageReceiver) == 2)
	{
		UCS_SetDamage(lightningFX, damageSender, damageReceiver, 20);
	}
	if(UCS_GetCurrentIter(lightningFX, damageSender, damageReceiver) == 5)
	{
		// INSTANT ONE-TIME HIT
		UCS_Hit(damageSender, damageReceiver, 50, DT_FLY, -1, -1, "", 0);
	};
};

func void stopLightningFX(var C_NPC damageSender, var C_NPC damageReceiver, var int spellID, var int spellLevel)
{
	var int lightningFX_Area; lightningFX_Area = GetLightningFXArea(spellID, spellLevel);
	
	UCS_StopAreaFX(lightningFX, lightningFX_Area, lightningFX_IncludeCnd, damageSender, damageReceiver);
};

func int isLightningFXSpell(var int spellID)
{
	if(spellID == SPL_Zap){ return true; };
	if(spellID == SPL_ChargeZap){ return true; };
	if(spellID == SPL_LightningFlash){ return true; };
	
	return false;
};

func void processLightningFX(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int spellID, var int spellLevel)
{
	if(damageType == DT_MAGIC && isLightningFXSpell(spellID))
	{
		startLightningFX(damageSender, damageReceiver, spellID, spellLevel);
	};
	
	if(UCS_IsApplying(lightningFX, damageSender, damageReceiver))
	{
		modifyLightningFX(damageSender, damageReceiver);
	};
}; */