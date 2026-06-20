

/* var int poisonFX; */ // PROTOTYPE BASED FX INSTANCE
/* var int lightningFX; */
/* var int someFX; */
/* var int anotherFX; */

/* var int burnFX; */ // INLINE FX INSTANCE


// ACTIONS /////

func void OnPreDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int spellID, var int spellLevel)
{
};
func void OnPostDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int spellID, var int spellLevel)
{
	/* if(damageType == DT_MAGIC)
	{
		if(spellID == SPL_LIGHTNINGFLASH)
		{
			// PROTOTYPE BASED FX
			UCS_StartFX(lightningFX, LightningFXP, damageSender, damageReceiver);
		};
		if(spellID == SPL_CHARGEZAP)
		{
			if(spellLevel == 4)
			{
				// PROTOTYPE BASED AREA FX
				UCS_StartAreaFX(lightningFX, LightningFXP, 300, isLightningFXAreaIncludes, damageSender, damageReceiver);
			};
		};
		if(spellID == SPL_Firebolt)
		{
			// INLINE FX
			UCS_RestartFXEX(burnFX, damageSender, damageReceiver, 5, DT_FIRE, -1, -1, "", 0, 2000.0, 5, 2000.0, vf);
		};
	}; */
	
	/* if(damageType == DT_LIGHTNING)
	{
		if (UCS_GetCurrentIter(lightningFX, damageSender, damageReceiver) == 2)
		{
			// INLINE FX
			UCS_RefreshFXEX(burnFX, damageSender, damageReceiver, 5, DT_FIRE, -1, -1, "", 0, 2000.0, 5, 2000.0, vf);
		}
		if(UCS_GetCurrentIter(lightningFX, damageSender, damageReceiver) == 5)
		{
			// INSTANT ONE-TIME HIT
			UCS_Hit(damageSender, damageReceiver, 50, DT_FLY, -1, -1, "", 0);
		};
	}; */
	
	/* if(damageType == DT_FIRE)
	{
		if(UCS_GetRefreshCount(burnFX, damageSender, damageReceiver) >= 1)
		{
			UCS_SetDamage(burnFX, damageSender, damageReceiver, 10);
			UCS_SetVisualFX(burnFX, damageSender, damageReceiver, "SPELLFX_PYROKINESIS_SPREAD");
			UCS_SetLoopInterval(burnFX, damageSender, damageReceiver, 1000.0);
			UCS_SetIterCount(burnFX, damageSender, damageReceiver, 10);
			UCS_SetStartDelay(burnFX, damageSender, damageReceiver, 1000.0);
		};
	}; */
	
	/* if(damageType == DT_EDGE)
	{
		var int rnd; rnd = Hlp_Random(10) + 1;
		
		if(rnd < 3)
		{
			// PROTOTYPE BASED FX
			UCS_RefreshFX(poisonFX, PoisonFXP, damageSender, damageReceiver);
		};
	}; */
	
	/* if(damageType == DT_POISON)
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
	}; */
};


// CALCULATIONS /////

func int CalcMinimalDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialMinimalDamage, var int spellID, var int spellLevel)
{
	var int i; i = initialMinimalDamage; // i - initial minimal damage
	
	var int resultDamage; resultDamage = i;
	
	
	/* resultDamage = SwitchByDT(damageType, i, i, i, i, i, i, i, i, i, i); */
	
	return resultDamage;
};

func int CalcPureDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialPureDamage, var int spellID, var int spellLevel)
{
	var int i; i = initialPureDamage; // i - initial pure damage
	
	var int resultDamage; resultDamage = i;
	
	
	/* if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM)
	{
		resultDamage = SwitchByDT(damageType, i, Hlp_MultInt(i, 1.10), i, i, i, i, i, i, 0, i);
	}; */
	
	return resultDamage;
};

func int CalcTotalDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialTotalDamage, var int spellID, var int spellLevel)
{
	var int i; i = initialTotalDamage; // i - initial total damage
	
	var int resultDamage; resultDamage = i;
	
	
	/* if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM)
	{
		resultDamage = SwitchByDT(damageType, i, Hlp_MultInt(i, 1.50), i, i, i, i, i, i, 0, i);
	}; */
	
	return resultDamage;
};

func int GetProtectionOfEquipment(var C_NPC damageReceiver, var int damageType, var int spellID, var int spellLevel)
{
	var int resultProtection; resultProtection = 0;
	
	
	/* if(Hlp_IsItemEquipped(ItAm_PROT_POISON_01, damageReceiver))
	{
		resultProtection += SwitchByDT(damageType, 0, 0, 0, 0, 0, 0, 0, 0, 30, 0);
	}; */
	
	return resultProtection;
};

func int CalcProtection(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialProtection, var int spellID, var int spellLevel)
{
	var int i; i = initialProtection; // i - initial protection
	
	if(i != -1) // -1 - immunity
	{
		i += GetProtectionOfEquipment(damageReceiver, damageType, spellID, spellLevel);
	};
	
	var int resultProtection; resultProtection = i;
	
	
	/* if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM)
	{
		resultProtection = SwitchByDT(damageType, i, 0, -1, i, i, i, i, i, i, i);
	}; */
	
	/* if(damageType == DT_POISON)
	{
		if(Npc_IsPlayer(damageReceiver))
		{
			resultProtection = damageReceiver.aivar[ATR_HITPOINTS_MAX] / 2;
		};
	}; */
	
	return resultProtection;
};


func int GetMultiplier(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int isCrit)
{
	var int resultMultiplier; resultMultiplier = -1;
	
	
	/* if(!isCrit)
	{
		if(damageType == DT_BLUNT)
		{
			resultMultiplier = 200; // 0.2x
		};
		if(damageType == DT_POISON)
		{
			resultMultiplier = 1000; // 1.0x
		};
		if(damageType == DT_LIGHTNING)
		{
			resultMultiplier = 1000; // 1.0x
		};
	};
	if(isCrit)
	{
		if(damageType == DT_BLUNT)
		{
			resultMultiplier = 1000; // 1.0x
		};
		if(damageType == DT_POISON)
		{
			resultMultiplier = 1000; // 1.0x
		};
		if(damageType == DT_LIGHTNING)
		{
			resultMultiplier = 1000; // 1.0x
		};
	}; */
	
	return resultMultiplier;
};
func int GetMinimalDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialMinimalDamage, var int spellID, var int spellLevel)
{
	var int resultDamage; resultDamage = -1;
	
	resultDamage = CalcMinimalDamage(damageSender, damageReceiver, damageType, initialMinimalDamage, spellID, spellLevel);
	
	return resultDamage;
};
func int GetPureDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialPureDamage, var int spellID, var int spellLevel)
{
	var int resultDamage; resultDamage = -1;
	
	resultDamage = CalcPureDamage(damageSender, damageReceiver, damageType, initialPureDamage, spellID, spellLevel);
	
	return resultDamage;
};
func int GetTotalDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialTotalDamage, var int spellID, var int spellLevel)
{
	var int resultDamage; resultDamage = -1;
	
	resultDamage = CalcTotalDamage(damageSender, damageReceiver, damageType, initialTotalDamage, spellID, spellLevel);
	
	return resultDamage;
};
func int GetProtection(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialProtection, var int spellID, var int spellLevel)
{
	var int resultProtection; resultProtection = -2;
	
	resultProtection = CalcProtection(damageSender, damageReceiver, damageType, initialProtection, spellID, spellLevel);
	
	return resultProtection;
};
func int GetCustomDamageType(var C_NPC damageSender, var C_NPC damageReceiver, var int itemInstance_ID)
{
	var int resultDamageType; resultDamageType = -1;
	
	/* if(damageSender.aivar[AIV_MM_REAL_ID] == ID_WARAN || damageSender.aivar[AIV_MM_REAL_ID] == ID_BLOODFLY)
	{
		resultDamageType = DT_POISON;
	}; */
	
	return resultDamageType;
};
func int GetCustomDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialPureDamage, var int isCrit, var int spellID, var int spellLevel)
{
	var int pureDamage; pureDamage = GetPureDamage(damageSender, damageReceiver, damageType, initialPureDamage, spellID, spellLevel);
	var int protection; protection = GetProtection(damageSender, damageReceiver, damageType, 0, spellID, spellLevel);
	var int minimalDamage; minimalDamage = GetMinimalDamage(damageSender, damageReceiver, damageType, 0, spellID, spellLevel);
	var float multiplier; multiplier = Hlp_MultInt_F(GetMultiplier(damageSender, damageReceiver, damageType, isCrit), 0.001);
	
	if(protection == -1)
	{
		return 0;
	};
	
	var int totalDamage; totalDamage = initialPureDamage;
	
	/* if(damageType == DT_POISON)
	{
		var int initialTotalDamage; initialTotalDamage = pureDamage + ((damageReceiver.attribute[ATR_HITPOINTS_MAX] - protection) / 100);
		
		totalDamage = GetTotalDamage(damageSender, damageReceiver, damageType, initialTotalDamage, spellID, spellLevel);
	}; */
	/* if(damageType == DT_LIGHTNING)
	{
		var int initialTotalDamage; initialTotalDamage = pureDamage + (damageSender.attribute[ATR_MANA_MAX] / 10);
		
		totalDamage = GetTotalDamage(damageSender, damageReceiver, damageType, initialTotalDamage, spellID, spellLevel);
	}; */
	
	totalDamage = Hlp_MultInt(totalDamage, multiplier);
	
	if((minimalDamage >= 0) && (totalDamage < minimalDamage))
	{
		totalDamage = minimalDamage;
	};
	
	return totalDamage;
};


// ENGINE FUNCTIONS /////
// FUNCTIONS BELOW ARE CALLED BY THE ENGINE, BE CAREFUL WHEN CHANGING THEM! /////

func void PullPreDamage(var int damageType, var int spellID, var int spellLevel)
{
	var C_NPC damageSender; damageSender = UCS_GetDamageSender();
	var C_NPC damageReceiver; damageReceiver = UCS_GetDamageReceiver();
	
	OnPreDamage(damageSender, damageReceiver, damageType, spellID, spellLevel);
};
func void PullPostDamage(var int damageType, var int spellID, var int spellLevel)
{
	var C_NPC damageSender; damageSender = UCS_GetDamageSender();
	var C_NPC damageReceiver; damageReceiver = UCS_GetDamageReceiver();
	
	OnPostDamage(damageSender, damageReceiver, damageType, spellID, spellLevel);
};
func int PullCustomDamageType(var int itemInstance_ID)
{
	var C_NPC damageSender; damageSender = UCS_GetDamageSender();
	var C_NPC damageReceiver; damageReceiver = UCS_GetDamageReceiver();
	
	return GetCustomDamageType(damageSender, damageReceiver, itemInstance_ID);
};
func int PullCustomDamage(var int damageType, var int initialPureDamage, var int isCrit, var int spellID, var int spellLevel)
{
	var C_NPC damageSender; damageSender = UCS_GetDamageSender();
	var C_NPC damageReceiver; damageReceiver = UCS_GetDamageReceiver();
	
	return GetCustomDamage(damageSender, damageReceiver, damageType, initialPureDamage, isCrit, spellID, spellLevel);
};
func int PullMultiplier(var int damageType, var int isCrit)
{
	var C_NPC damageSender; damageSender = UCS_GetDamageSender();
	var C_NPC damageReceiver; damageReceiver = UCS_GetDamageReceiver();
	
	return GetMultiplier(damageSender, damageReceiver, damageType, isCrit);
};
func int PullMinimalDamage(var int damageType, var int initialMinimalDamage, var int spellID, var int spellLevel)
{
	var C_NPC damageSender; damageSender = UCS_GetDamageSender();
	var C_NPC damageReceiver; damageReceiver = UCS_GetDamageReceiver();
	
	return GetMinimalDamage(damageSender, damageReceiver, damageType, initialMinimalDamage, spellID, spellLevel);
};
func int PullPureDamage(var int damageType, var int initialPureDamage, var int spellID, var int spellLevel)
{
	var C_NPC damageSender; damageSender = UCS_GetDamageSender();
	var C_NPC damageReceiver; damageReceiver = UCS_GetDamageReceiver();
	
	return GetPureDamage(damageSender, damageReceiver, damageType, initialPureDamage, spellID, spellLevel);
};
func int PullTotalDamage(var int damageType, var int initialTotalDamage, var int spellID, var int spellLevel) 
{
	var C_NPC damageSender; damageSender = UCS_GetDamageSender();
	var C_NPC damageReceiver; damageReceiver = UCS_GetDamageReceiver();
	
	return GetTotalDamage(damageSender, damageReceiver, damageType, initialTotalDamage, spellID, spellLevel);
};
func int PullProtection(var int damageType, var int initialProtection, var int spellID, var int spellLevel)
{
	var C_NPC damageSender; damageSender = UCS_GetDamageSender();
	var C_NPC damageReceiver; damageReceiver = UCS_GetDamageReceiver();
	
	return GetProtection(damageSender, damageReceiver, damageType, initialProtection, spellID, spellLevel);
};
