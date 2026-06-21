
/* var int poisonFX; // FX INSTANCE

func void startPoisonFX(var C_NPC damageSender, var C_NPC damageReceiver)
{
	var int rnd; rnd = Hlp_Random(10) + 1;
	
	if(rnd < 3 && !UCS_HasReceiver(poisonFX, damageReceiver))
	{
		// PROTOTYPE BASED FX
		UCS_RefreshFX(poisonFX, PoisonFXP, damageSender, damageReceiver);
	};
};

func void modifyPoisonFX(var C_NPC damageSender, var C_NPC damageReceiver)
{
	if(UCS_GetRefreshCount(poisonFX, damageSender, damageReceiver) == 0)
	{
		if(UCS_GetCurrentIter(poisonFX, damageSender, damageReceiver) == 10)
		{
			UCS_SetDamage(poisonFX, damageSender, damageReceiver, 30);
		};
		if(UCS_GetCurrentIter(poisonFX, damageSender, damageReceiver) == 20)
		{
			UCS_SetDamage(poisonFX, damageSender, damageReceiver, 50);
		};
	};
	if(UCS_GetRefreshCount(poisonFX, damageSender, damageReceiver) >= 1)
	{
		UCS_SetDamage(poisonFX, damageSender, damageReceiver, 50);
	};
};

func void stopPoisonFX(var C_NPC damageSender, var C_NPC damageReceiver)
{
	UCS_StopFX(poisonFX, damageSender, damageReceiver);
};

func void processPoisonFX(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType)
{
	if(damageType == DT_EDGE)
	{
		startPoisonFX(damageSender, damageReceiver);
	};
	
	if(UCS_IsApplying(poisonFX, damageSender, damageReceiver))
	{
		modifyPoisonFX(damageSender, damageReceiver);
	};
}; */