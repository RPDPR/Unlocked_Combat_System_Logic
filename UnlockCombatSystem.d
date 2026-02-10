
// Damage Types (You can add custom damage types here) /////
const int DT_BARRIER = 0;
const int DT_BLUNT = 1;
const int DT_EDGE = 2;
const int DT_FIRE = 3;
const int DT_FLY = 4;
const int DT_MAGIC = 5;
const int DT_POINT = 6;
const int DT_FALL = 7;
const int DT_POISON = 8; // CUSTOM DAMAGE TYPE

func int SwitchByDT(var int damageType, var int barrier, var int blunt, var int edge, var int fire, var int fly, var int magic, var int point, var int fall, var int poison)
{
	/* if(damageType == DT_BARRIER){ return barrier; };
	if(damageType == DT_BLUNT){ return blunt; };
	if(damageType == DT_EDGE){ return edge; };
	if(damageType == DT_FIRE){ return fire; };
	if(damageType == DT_FLY){ return fly; };
	if(damageType == DT_MAGIC){ return magic; };
	if(damageType == DT_POINT){ return point; };
	if(damageType == DT_FALL){ return fall; };
	if(damageType == DT_POISON){ return poison; }; */
	
	return -1;
};

func int SwitchBySpellID(var int spellID, var int geyser, var int icebolt, var int icecube, var int icelance, 
var int thunderstorm, var int waterfist, var int whirlwind, var int breathofdeath, var int chargezap, 
var int deathball, var int deathbolt, var int lightningflash, var int massdeath, var int suckenergy,
var int zap, var int chargefireball, var int destroyundead, var int firebolt,
var int firerain, var int firestorm, var int instantfireball)
{
	/* if(spellID == SPL_Geyser) { return geyser; };
	if(spellID == SPL_Icebolt) { return icebolt; };
	if(spellID == SPL_IceCube) { return icecube; };
	if(spellID == SPL_IceLance) { return icelance; };
	if(spellID == SPL_Thunderstorm) { return thunderstorm; };
	if(spellID == SPL_WaterFist) { return waterfist; };
	if(spellID == SPL_Whirlwind) { return whirlwind; };
	if(spellID == SPL_BreathOfDeath) { return breathofdeath; };
	if(spellID == SPL_ChargeZap) { return chargezap; };
	if(spellID == SPL_Deathball) { return deathball; };
	if(spellID == SPL_Deathbolt) { return deathbolt; };
	if(spellID == SPL_LightningFlash) { return lightningflash; };
	if(spellID == SPL_MassDeath) { return massdeath; };
	if(spellID == SPL_SuckEnergy) { return suckenergy; };
	if(spellID == SPL_Zap) { return zap; };
	if(spellID == SPL_ChargeFireball) { return chargefireball; };
	if(spellID == SPL_DestroyUndead) { return destroyundead; };
	if(spellID == SPL_Firebolt) { return firebolt; };
	if(spellID == SPL_Firerain) { return firerain; };
	if(spellID == SPL_Firestorm) { return firestorm; };
	if(spellID == SPL_InstantFireball) { return instantfireball; }; */
	
	return -1;
};


func int CalcMinimalDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int spellID)
{
	var int minimalDamage;
	
	/* minimalDamage = SwitchByDT(damageType, 5, 5, 5, 0, 5, 0, 5, 0, 0); */
	
	return minimalDamage;
};

func int CalcPureDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialPureDamage, var int spellID)
{
	var int i; i = initialPureDamage; // i - initial pure damage
	
	var int resultDamage; resultDamage = i;
	
	
	/* if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM)
	{
		resultDamage = SwitchByDT(damageType, i, Hlp_MultiplyInt(i, 1.10), i, i, i, i, i, i, 0);
	}; */
	
	return resultDamage;
};

func int CalcTotalDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialTotalDamage, var int spellID)
{
	var int i; i = initialTotalDamage; // i - initial total damage
	
	var int resultDamage; resultDamage = i;
	
	
	/* if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM)
	{
		resultDamage = SwitchByDT(damageType, i, Hlp_MultiplyInt(i, 1.50), i, i, i, i, i, i, 0);
	}; */
	
	return resultDamage;
};

func int GetProtectionOfEquipment(var C_NPC damageReceiver, var int damageType, var int spellID)
{
	var int resultProtection; resultProtection = 0;
	
	/* if(Hlp_IsItemEquipped(ItAm_PROT_POISON_01, damageReceiver))
	{
		resultProtection += SwitchByDT(damageType, 0, 0, 0, 0, 0, 0, 0, 0, 30);
	}; */
	
	return resultProtection;
};

func int CalcProtection(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialProtection, var int spellID)
{
	var int i; i = initialProtection; // i - initial protection
	
	if(i != -1) // -1 - immunity
	{
		i += GetProtectionOfEquipment(damageReceiver, damageType, spellID);
	};
	
	var int resultProtection; resultProtection = i;
	
	
	/* if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM)
	{
		resultProtection = SwitchByDT(damageType, i, 0, -1, i, i, i, i, i, i);
	}; */
	
	return resultProtection;
};


func float GetMultiplier(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int isCrit)
{
	var float resultMultiplier; resultMultiplier = -1.0;
	
	/* if(!isCrit)
	{
		if(damageType == DT_POISON)
		{
			resultMultiplier = 0.9;
		};
	};
	if(isCrit)
	{
		if(damageType == DT_POISON)
		{
			resultMultiplier = 1.0;
		};
	}; */
	
	return resultMultiplier;
};
func int GetMinimalDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int spellID)
{
	var int resultDamage; resultDamage = -1;
	
	resultDamage = CalcMinimalDamage(damageSender, damageReceiver, damageType, spellID);
	
	return resultDamage;
};
func int GetPureDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialPureDamage, var int spellID)
{
	var int resultDamage; resultDamage = -1;
	
	resultDamage = CalcPureDamage(damageSender, damageReceiver, damageType, initialPureDamage, spellID);
	
	return resultDamage;
};
func int GetTotalDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialTotalDamage, var int spellID)
{
	var int resultDamage; resultDamage = -1;
	
	resultDamage = CalcTotalDamage(damageSender, damageReceiver, damageType, initialTotalDamage, spellID);
	
	return resultDamage;
};
func int GetProtection(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialProtection, var int spellID)
{
	var int resultProtection; resultProtection = -1;
	
	resultProtection = CalcProtection(damageSender, damageReceiver, damageType, initialProtection, spellID);
	
	return resultProtection;
};


// THE FUNCTIONS BELOW ARE ENGINE-BASED, CHANGING THEM MAY LEAD TO UNPREDICTABLE CONSEQUENCES! /////

func int PullCustomDamageType(var int damageSender_ID, var int damageReceiver_ID, var int itemInstance_ID)
{
	var C_NPC damageSender; damageSender = Hlp_GetNpc(damageSender_ID);
	var C_NPC damageReceiver; damageReceiver = Hlp_GetNpc(damageReceiver_ID);
	
	/* if(damageSender.aivar[AIV_MM_REAL_ID] == ID_WARAN)
	{
		return DT_POISON;
	};
	if(damageSender.aivar[AIV_MM_REAL_ID] == ID_BLOODFLY)
	{
		return DT_POISON;
	}; */
	
	return -1;
};
func int PullCustomDamage(var int damageSender_ID, var int damageReceiver_ID, var int damageType, var int initialPureDamage, var int isCrit, var int spellID)
{
	var C_NPC damageSender; damageSender = Hlp_GetNpc(damageSender_ID);
	var C_NPC damageReceiver; damageReceiver = Hlp_GetNpc(damageReceiver_ID);
	
	var int pureDamage; pureDamage = GetPureDamage(damageSender, damageReceiver, damageType, initialPureDamage, spellID);
	var int protection; protection = GetProtection(damageSender, damageReceiver, damageType, 0, spellID);
	var int minimalDamage; minimalDamage = GetMinimalDamage(damageSender, damageReceiver, damageType, spellID);
	var float multiplier; multiplier = GetMultiplier(damageSender, damageReceiver, damageType, isCrit);
	
	var int totalDamage; totalDamage = 0;
	
	/* if(damageType == DT_POISON)
	{
		var int initialTotalDamage; initialTotalDamage = pureDamage + (Hlp_MultiplyInt(damageSender.attribute[ATR_HITPOINTS_MAX] / damageSender.attribute[ATR_HITPOINTS], 20.0) - Hlp_MultiplyInt(damageReceiver.attribute[ATR_HITPOINTS], 0.1)) - protection;
		
		totalDamage = GetTotalDamage(damageSender, damageReceiver, damageType, initialTotalDamage, spellID);
	}; */
	
	totalDamage = Hlp_MultiplyInt(totalDamage, multiplier);
	
	if((minimalDamage >= 0) && (totalDamage < minimalDamage))
	{
		totalDamage = minimalDamage;
	};
	
	return totalDamage;
};

func float PullMultiplier(var int damageSender_ID, var int damageReceiver_ID, var int damageType, var int isCrit)
{
	var C_NPC damageSender; damageSender = Hlp_GetNpc(damageSender_ID);
	var C_NPC damageReceiver; damageReceiver = Hlp_GetNpc(damageReceiver_ID);
	
	return GetMultiplier(damageSender, damageReceiver, damageType, isCrit);
};

func int PullMinimalDamage(var int damageSender_ID, var int damageReceiver_ID, var int damageType, var int spellID)
{
	var C_NPC damageSender; damageSender = Hlp_GetNpc(damageSender_ID);
	var C_NPC damageReceiver; damageReceiver = Hlp_GetNpc(damageReceiver_ID);
	
	return GetMinimalDamage(damageSender, damageReceiver, damageType, spellID);
};

func int PullPureDamage(var int damageSender_ID, var int damageReceiver_ID, var int damageType, var int initialDamage, var int spellID) // spellID can be -1 if the damage type is not magic. 
{
	var C_NPC damageSender; damageSender = Hlp_GetNpc(damageSender_ID);
	var C_NPC damageReceiver; damageReceiver = Hlp_GetNpc(damageReceiver_ID);
	
	return GetPureDamage(damageSender, damageReceiver, damageType, initialDamage, spellID);
};

func int PullTotalDamage(var int damageSender_ID, var int damageReceiver_ID, var int damageType, var int initialDamage, var int spellID) // spellID can be -1 if the damage type is not magic. 
{
	var C_NPC damageSender; damageSender = Hlp_GetNpc(damageSender_ID);
	var C_NPC damageReceiver; damageReceiver = Hlp_GetNpc(damageReceiver_ID);
	
	return GetTotalDamage(damageSender, damageReceiver, damageType, initialDamage, spellID);
};

func int PullProtection(var int damageSender_ID, var int damageReceiver_ID, var int damageType, var int initialProtection, var int spellID) // spellID can be -1 if the damage type is not magic.
{
	var C_NPC damageSender; damageSender = Hlp_GetNpc(damageSender_ID);
	var C_NPC damageReceiver; damageReceiver = Hlp_GetNpc(damageReceiver_ID);
	
	return GetProtection(damageSender, damageReceiver, damageType, initialProtection, spellID);
};
