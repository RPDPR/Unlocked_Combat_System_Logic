
// Damage Types (You can add custom damage types here) /////
const int DT_BARRIER = 0;
const int DT_BLUNT = 1;
const int DT_EDGE = 2;
const int DT_FIRE = 3;
const int DT_FLY = 4;
const int DT_MAGIC = 5;
const int DT_POINT = 6;
const int DT_FALL = 7;
const int DT_PIERCING = 8;

// Element Types (You can add custom element types here) /////
const int ET_FIRE = 0;
const int ET_ICE = 1;
const int ET_DARKNESS = 2;
const int ET_WIND = 3;


func int SwitchByDT(var int damageType, var int barrier, var int blunt, var int edge, var int fire, var int fly, var int magic, var int point, var int fall, var int piercing)
{
	if(damageType == DT_BARRIER){ return barrier; };
	if(damageType == DT_BLUNT){ return blunt; };
	if(damageType == DT_EDGE){ return edge; };
	if(damageType == DT_FIRE){ return fire; };
	if(damageType == DT_FLY){ return fly; };
	if(damageType == DT_MAGIC){ return magic; };
	if(damageType == DT_POINT){ return point; };
	if(damageType == DT_FALL){ return fall; };
	if(damageType == DT_PIERCING){ return piercing; };
	
	return -1;
};

func int SwitchByET(var int elementType, var int fire, var int ice, var int darkness, var int wind)
{
	if(elementType == ET_FIRE){ return fire; };
	if(elementType == ET_ICE){ return ice; };
	if(elementType == ET_DARKNESS){ return darkness; };
	if(elementType == ET_WIND){ return wind; };
	
	return -1;
};

func int SwitchByCrit(var int isCrit, var int nonCrit, var int crit)
{
	if(isCrit) { return crit; };
	if(!isCrit) { return nonCrit; };
	
	return -1;
};

func int GetET(var int spellID)
{
	if(spellID == SPL_Geyser) { return ET_ICE; };
	if(spellID == SPL_Icebolt) { return ET_ICE; };
	if(spellID == SPL_IceCube) { return ET_ICE; };
	if(spellID == SPL_IceLance) { return ET_ICE; };
	if(spellID == SPL_Thunderstorm) { return ET_ICE; };
	if(spellID == SPL_WaterFist) { return ET_ICE; };
	if(spellID == SPL_Whirlwind) { return ET_WIND; };
	if(spellID == SPL_BreathOfDeath) { return ET_DARKNESS; };
	if(spellID == SPL_ChargeZap) { return ET_DARKNESS; };
	if(spellID == SPL_Deathball) { return ET_DARKNESS; };
	if(spellID == SPL_Deathbolt) { return ET_DARKNESS; };
	if(spellID == SPL_LightningFlash) { return ET_DARKNESS; };
	if(spellID == SPL_MassDeath) { return ET_DARKNESS; };
	if(spellID == SPL_PierceArrow) { return ET_DARKNESS; };
	if(spellID == SPL_SuckEnergy) { return ET_DARKNESS; };
	if(spellID == SPL_Zap) { return ET_DARKNESS; };
	if(spellID == SPL_ChargeFireball) { return ET_FIRE; };
	if(spellID == SPL_DestroyUndead) { return ET_FIRE; };
	if(spellID == SPL_Firebolt) { return ET_FIRE; };
	if(spellID == SPL_Firerain) { return ET_FIRE; };
	if(spellID == SPL_Firestorm) { return ET_FIRE; };
	if(spellID == SPL_InstantFireball) { return ET_FIRE; };
	
	return -1;
};

func int SwitchBySpellID(var int spellID, var int geyser, var int icebolt, var int icecube, var int icelance, 
var int thunderstorm, var int waterfist, var int whirlwind, var int breathofdeath, var int chargezap, 
var int deathball, var int deathbolt, var int lightningflash, var int massdeath, var int piercearrow,
var int suckenergy, var int zap, var int chargefireball, var int destroyundead, var int firebolt,
var int firerain, var int firestorm, var int instantfireball)
{
	if(spellID == SPL_Geyser) { return geyser; };
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
	if(spellID == SPL_PierceArrow) { return piercearrow; };
	if(spellID == SPL_SuckEnergy) { return suckenergy; };
	if(spellID == SPL_Zap) { return zap; };
	if(spellID == SPL_ChargeFireball) { return chargefireball; };
	if(spellID == SPL_DestroyUndead) { return destroyundead; };
	if(spellID == SPL_Firebolt) { return firebolt; };
	if(spellID == SPL_Firerain) { return firerain; };
	if(spellID == SPL_Firestorm) { return firestorm; };
	if(spellID == SPL_InstantFireball) { return instantfireball; };
	
	return -1;
};

func int CalcMinimalDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int spellID)
{
	var int minimalDamage;
	
	minimalDamage = SwitchByDT(damageType, 0, 0, 5, 0, 100, 0, 5, 100, 1000);
	
	if(damageType == DT_EDGE)
	{
		if(Hlp_GetInstanceID(damageReceiver) == Hlp_GetInstanceID(NONE_8987_NIKITA))
		{
			minimalDamage = 23; 
		};
	};
	if(damageType == DT_BLUNT)
	{
		if(Hlp_GetInstanceID(damageReceiver) == Hlp_GetInstanceID(NONE_8987_NIKITA))
		{
			minimalDamage = 2; 
		};
	};
	
	return minimalDamage;
};

func int CalcPureDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialDamage, var int spellID)
{
	var int i; i = initialDamage; // i - initial damage
	
	if(damageType == DT_MAGIC)
	{
		i = SwitchBySpellID
		(
			spellID,
			i, i, i, i, i, i, i, i, i, i, i,
			i, i, i, i, i, i, i, i, 633, i, i
		);
	};
	
	var int resultDamage; resultDamage = i; // i - initial damage
	
	// Calculating damage for mobs /////
	
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM)
	{
		resultDamage = SwitchByDT(damageType, i, Hlp_MultiplyInt(i, 2.00), 0, i, i, SwitchByET(GetETBySpellID(spellID), i, i, 0, 0), i, i, i); //0, 0, 0, 0
	};
	
	// Calculating damage for npcs /////
	
	if(Hlp_GetInstanceID(damageReceiver) == Hlp_GetInstanceID(NONE_8987_NIKITA))
	{
		var int curHP;
		var int maxHP;
		var int hpPercent;
		
		var float multiplier;
		
		curHP = damageReceiver.attribute[ATR_HITPOINTS];
		maxHP = damageReceiver.attribute[ATR_HITPOINTS_MAX];
		
		multiplier = 1.0;
		
		if (maxHP > 0)
		{
			hpPercent = curHP * 100 / maxHP;
			if (hpPercent <= 20)
			{
				multiplier = 3.0;
			}
			else if (hpPercent <= 40)
			{
				multiplier = 2.0;
			}
			else if (hpPercent <= 60)
			{
				multiplier = 1.5;
			}
			else if (hpPercent <= 80)
			{
				multiplier = 1.25;
			}
			else
			{
				multiplier = 1.0;
			};
		};
		
		resultDamage = SwitchByDT(damageType, i, Hlp_MultiplyInt(i, multiplier), 0, i, i, Hlp_MultiplyInt(i, 3.00), i, i, i); /* SwitchByET(elementType, 0, 0, 0, 0), */  //0, 0, 0, 0
	};
	
	// You can write your own logic to send a custom spell damage below /////
	
	// Dont forget to return the resultDamage variable in the end of your script /////
	
	return resultDamage;
};

func int CalcTotalDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialDamage, var int spellID)
{
	var int i; i = initialDamage; // i - initial damage
	
	var int resultDamage; resultDamage = i; // i - initial damage
	
	
	// Calculating damage for mobs /////
	
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_FIREGOLEM)
	{
		resultDamage = SwitchByDT(damageType, i, i, i, i, i, i, /* SwitchByET(elementType, 0, Hlp_MultiplyInt(i, 1.25), 0, 0), */ i, i, i); //0, 1.25x, 0, 0
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_ICEGOLEM)
	{
		resultDamage = SwitchByDT(damageType, i, i, i, i, i, i, /* SwitchByET(elementType, Hlp_MultiplyInt(i, 1.25), 0, 0, 0), */ i, i, i); //1.25x, 0, 0, 0
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM)
	{
		resultDamage = SwitchByDT(damageType, i, Hlp_MultiplyInt(i, 1.25), 0, i, i, i, /* SwitchByET(elementType, 0, 0, 0, 0), */ i, i, i); //0, 0, 0, 0
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_Icewolf)
	{
		resultDamage = SwitchByDT(damageType, i, i, Hlp_MultiplyInt(i, 2.00), i, i, i, /* SwitchByET(elementType, Hlp_MultiplyInt(i, 1.75), 0, i, i), */ i, i, Hlp_MultiplyInt(i, 4.00)); //1.75x, 0, i, i
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_SKELETON)
	{
		resultDamage = SwitchByDT(damageType, i, i, i, i, i, i, /* SwitchByET(elementType, Hlp_MultiplyInt(i, 1.50), i, 0, i), */ i, i, 0); //1.50x, i, 0, i
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE)
	{
		resultDamage = SwitchByDT(damageType, i, i, i, i, i, i, /* SwitchByET(elementType, Hlp_MultiplyInt(i, 1.50), i, 0, i), */ i, i, i); //1.50x, i, 0, i
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE)
	{
		resultDamage = SwitchByDT(damageType, i, i, i, i, i, i, /* SwitchByET(elementType, Hlp_MultiplyInt(i, 1.50), i, 0, i), */ i, i, i); //1.50x, i, 0, i
	};
	
	/*if(damageType == DT_POINT)
	{
		var int distToTarget; distToTarget = Npc_GetDistToNpc(damageSender, damageReceiver);
		
		PrintScreen(IntToString(distToTarget), -1, -1, FONT_SCREEN, 1);
		
		resultDamage = Hlp_MultiplyInt(i, 0.1);
		
		if(distToTarget > 250)
		{
			resultDamage = Hlp_MultiplyInt(i, 0.25);
		};
		if(distToTarget > 500)
		{
			resultDamage = Hlp_MultiplyInt(i, 0.5);
		};
		if(distToTarget > 750)
		{
			resultDamage = Hlp_MultiplyInt(i, 0.75);
		};
		if(distToTarget > 1000)
		{
			resultDamage = i;
		};
		if(distToTarget > 2000)
		{
			resultDamage = Hlp_MultiplyInt(i, 1.12);
		};
		if(distToTarget > 2250)
		{
			resultDamage = Hlp_MultiplyInt(i, 1.25);
		};
		if(distToTarget > 2500)
		{
			resultDamage = Hlp_MultiplyInt(i, 1.37);
		};
		if(distToTarget > 2750)
		{
			resultDamage = Hlp_MultiplyInt(i, 1.5);
		};
	};*/
	
	if(damageType == DT_MAGIC)
	{
		resultDamage = SwitchBySpellID
		(
			spellID,
			i, i, i, 20, i, i, i, i, i, i, i,
			i, i, 10000, i, i, i, i, i, Hlp_MultiplyInt(i, 3.00), i, i
		);
	};
	
	// You can write your own logic to send a custom spell damage below /////
	
	// Dont forget to return the resultDamage variable in the end of your script /////
	
	return resultDamage;
};

func int GetCustomProtectionOfItem(var int itemInstanceID, var int damageType, var int elementType)
{
	// Amulets
	if(itemInstanceID == ItAm_PROT_MAGIC_FIRE_01)
	{
		return SwitchByDT(damageType, 0, 0, 0, 0, 0, SwitchByET(elementType, 10, 0, 0, 0), 0, 0, 0); //10, 0, 0, 0
	};
	if(itemInstanceID == ItAm_PROT_MAGIC_ICE_01)
	{
		return SwitchByDT(damageType, 0, 0, 0, 0, 0, SwitchByET(elementType, 0, 10, 0, 0), 0, 0, 0); //0, 10, 0, 0
	};
	if(itemInstanceID == ItAm_PROT_MAGIC_DARKNESS_01)
	{
		return SwitchByDT(damageType, 0, 0, 0, 0, 0, SwitchByET(elementType, 0, 0, 10, 0), 0, 0, 0); //0, 0, 10, 0
	};
	if(itemInstanceID == ItAm_PROT_MAGIC_WIND_01)
	{
		return SwitchByDT(damageType, 0, 0, 0, 0, 0, SwitchByET(elementType, 0, 0, 0, 10), 0, 0, 0); //0, 0, 0, 10
	};
	
	// Armor
	if(itemInstanceID == ItAr_Nikita)
	{
		return SwitchByDT(damageType, 0, 0, 0, 0, 0, SwitchByET(elementType, 75, 100, 125, 0), 0, 0, 0); //75, 100, 125, 0
	};
	
	// Rings
	
	// Belts
	
	return 0;
};

func int CalcProtection(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialProtection, var int spellID)
{
	var int i; i = initialProtection; // i - initial protection
	
	// Amulets
	if(Hlp_IsItemEquipped(ItAm_PROT_MAGIC_FIRE_01, damageReceiver))
	{
		i += GetCustomProtectionOfItem(ItAm_PROT_MAGIC_FIRE_01);
	};
	if(Hlp_IsItemEquipped(ItAm_PROT_MAGIC_ICE_01, damageReceiver))
	{
		i += GetCustomProtectionOfItem(ItAm_PROT_MAGIC_ICE_01, damageType, ET_ICE);
	};
	if(Hlp_IsItemEquipped(ItAm_PROT_MAGIC_DARKNESS_01, damageReceiver))
	{
		i += GetCustomProtectionOfItem(ItAm_PROT_MAGIC_DARKNESS_01, damageType, ET_DARKNESS);
	};
	if(Hlp_IsItemEquipped(ItAm_PROT_MAGIC_WIND_01, damageReceiver))
	{
		i += GetCustomProtectionOfItem(ItAm_PROT_MAGIC_WIND_01, damageType, ET_WIND);
	};
	
	// Armor
	if(Hlp_IsItemEquipped(ItAr_Nikita, damageReceiver))
	{
		i += GetCustomProtectionOfItem(Hlp_GetItemInstanceID(ItAr_Nikita), damageType, ET_DARKNESS);
	};
	
	// Rings
	
	// Belts
	
	var int resultProtection; resultProtection = i; // i - initial protection
	
	// Calculating magic protection for mobs /////
	
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_FIREGOLEM)
	{
		resultProtection = SwitchByDT(damageType, i, i, i, i, i, i, /* SwitchByET(elementType, immune, 0, i, i), */ i, i, i); //immune, 0, i, i
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_ICEGOLEM)
	{
		resultProtection = SwitchByDT(damageType, i, i, i, i, i, i, /* SwitchByET(elementType, 0, immune, i, i), */ i, i, i); //0, immune, i, i
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM)
	{
		resultProtection = SwitchByDT(damageType, i, Hlp_MultiplyInt(i, 0.70), i, i, i, i, /* SwitchByET(elementType, immune, immune, immune, immune), */ i, i, i); //immune, immune, immune, immune
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_Icewolf)
	{
		resultProtection = SwitchByDT(damageType, i, i, i, i, i, i, /* SwitchByET(elementType, i, i, i, i), */ i, i, i); //i, i, i, i
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_SKELETON)
	{
		resultProtection = SwitchByDT(damageType, i, i, i, i, i, i, /* SwitchByET(elementType, Hlp_MultiplyInt(i, 0.70), i, immune, i), */ i, i, i); //0.70x, i, immune, i
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE)
	{
		resultProtection = SwitchByDT(damageType, i, i, i, i, i, i, /* SwitchByET(elementType, Hlp_MultiplyInt(i, 0.70), i, immune, i), */ i, i, i); //0.70x, i, immune, i
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE)
	{
		resultProtection = SwitchByDT(damageType, i, i, i, i, i, i, /* SwitchByET(elementType, Hlp_MultiplyInt(i, 0.70), i, immune, i), */ i, i, i); //0.70x, i, immune, i
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_ORCELITE)
	{
		resultProtection = SwitchByDT(damageType, i, i, i, i, i, i, /* SwitchByET(elementType, i, i, 0, i), */ i, i, i); //i, i, 0, i
	};
	
	// Calculating magic protection for npcs /////
	
	if(Hlp_GetInstanceID(damageReceiver) == Hlp_GetInstanceID(NONE_8987_NIKITA))
	{
		resultProtection = SwitchByDT(damageType, i, i, i, i, i, i, /* SwitchByET(elementType, Hlp_MultiplyInt(i, 0.80), i, immune, 0), */ i, i, i); //0.80x, i, immune, 0
	};
	
	if(damageType == DT_POINT)
	{
		var int distToTarget; distToTarget = Npc_GetDistToNpc(damageSender, damageReceiver);
		
		PrintScreen(IntToString(distToTarget), -1, -1, FONT_SCREEN, 1);
		
		resultProtection = Hlp_MultiplyInt(i, 0.9);
		
		if(distToTarget > 250)
		{
			resultProtection = Hlp_MultiplyInt(i, 0.85);
		};
		if(distToTarget > 500)
		{
			resultProtection = Hlp_MultiplyInt(i, 0.76);
		};
		if(distToTarget > 750)
		{
			resultProtection = Hlp_MultiplyInt(i, 0.69);
		};
		if(distToTarget > 1000)
		{
			resultProtection = Hlp_MultiplyInt(i, 0.60);
		};
		if(distToTarget > 2000)
		{
			resultProtection = Hlp_MultiplyInt(i, 0.69);
		};
		if(distToTarget > 2250)
		{
			resultProtection = Hlp_MultiplyInt(i, 0.76);
		};
		if(distToTarget > 2500)
		{
			resultProtection = Hlp_MultiplyInt(i, 0.85);
		};
		if(distToTarget > 2750)
		{
			resultProtection = Hlp_MultiplyInt(i, 0.9);
		};
	};
	
	// You can write your own logic to send a custom protection below /////
	
	// Dont forget to return the resultProtection variable in the end of your script /////
	
	return resultProtection;
};

func int GetMinimalDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int spellID)
{
	var int resultDamage;
	
	resultDamage = CalcMinimalDamage(damageSender, damageReceiver, damageType, spellID);
	
	return resultDamage;
};
func int GetPureDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialDamage, var int spellID)
{
	var int resultDamage;
	
	resultDamage = CalcPureDamage(damageSender, damageReceiver, damageType, initialDamage, spellID);
	
	return resultDamage;
};
func int GetTotalDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialDamage, var int spellID)
{
	var int resultDamage;
	
	resultDamage = CalcTotalDamage(damageSender, damageReceiver, damageType, initialDamage, spellID);
	
	return resultDamage;
};
func int GetProtection(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialProtection, var int spellID)
{
	var int resultProtection;
	
	resultProtection = CalcProtection(damageSender, damageReceiver, damageType, initialProtection, spellID);
	
	return resultProtection;
};

func string BuildCustomMagicProtectionString(var C_ITEM item)
{
	var string f; f = IntToString(GetCustomProtectionOfItem(Hlp_GetItemInstanceID(item), DT_MAGIC, ET_FIRE));
	var string i; i = IntToString(GetCustomProtectionOfItem(Hlp_GetItemInstanceID(item), DT_MAGIC, ET_ICE));
	var string d; d = IntToString(GetCustomProtectionOfItem(Hlp_GetItemInstanceID(item), DT_MAGIC, ET_DARKNESS));
	var string w; w = IntToString(GetCustomProtectionOfItem(Hlp_GetItemInstanceID(item), DT_MAGIC, ET_WIND));
	
	var string separator; separator = " | ";
	
	return ConcatStrings("               : ", Concat5StringsWithSeparator(f, i, d, w, "", " | "));
};


// THE FUNCTIONS BELOW ARE ENGINE-BASED, CHANGING THEM MAY LEAD TO UNPREDICTABLE CONSEQUENCES! /////

func int PullCustomDamageType(var int damageSender_ID, var int damageReceiver_ID, var int itemInstance_ID)
{
	var C_NPC damageSender; damageSender = Hlp_GetNpc(damageSender_ID);
	var C_NPC damageReceiver; damageReceiver = Hlp_GetNpc(damageReceiver_ID);
	
	// DT_PIERCING /////
	if(itemInstance_ID == ItMw_Meisterdegen)
	{
		return DT_PIERCING;
	};
	
	return -1;
};
func float PullCustomMultiplier(var int damageSender_ID, var int damageReceiver_ID, var int damageType, var int isCrit)
{
	var C_NPC damageSender; damageSender = Hlp_GetNpc(damageSender_ID);
	var C_NPC damageReceiver; damageReceiver = Hlp_GetNpc(damageReceiver_ID);
	
	if(!isCrit)
	{
		// DT_EDGE /////
		if(damageType == DT_EDGE)
		{
			return 0.7;
		};
		// DT_PIERCING /////
		if(damageType == DT_PIERCING)
		{
			return 0.5;
		};
	};
	
	return -1;
};

func int PullMinimalDamage(var int damageSender_ID, var int damageReceiver_ID, var int damageType, var int spellID)
{
	var C_NPC damageSender; damageSender = Hlp_GetNpc(damageSender_ID);
	var C_NPC damageReceiver; damageReceiver = Hlp_GetNpc(damageReceiver_ID);
	
	return GetMinimalDamage(damageSender, damageReceiver, damageType, spellID);
};

func int PullCustomPureDamage(var int damageSender_ID, var int damageReceiver_ID, var int damageType, var int initialDamage, var int spellID) // spellID can be -1 if the damage type is not magic. 
{
	var C_NPC damageSender; damageSender = Hlp_GetNpc(damageSender_ID);
	var C_NPC damageReceiver; damageReceiver = Hlp_GetNpc(damageReceiver_ID);
	
	return GetPureDamage(damageSender, damageReceiver, damageType, initialDamage, spellID);
};

func int PullCustomTotalDamage(var int damageSender_ID, var int damageReceiver_ID, var int damageType, var int initialDamage, var int spellID) // spellID can be -1 if the damage type is not magic. 
{
	var C_NPC damageSender; damageSender = Hlp_GetNpc(damageSender_ID);
	var C_NPC damageReceiver; damageReceiver = Hlp_GetNpc(damageReceiver_ID);
	
	return GetTotalDamage(damageSender, damageReceiver, damageType, initialDamage, spellID);
};

func int PullCustomProtection(var int damageSender_ID, var int damageReceiver_ID, var int damageType, var int initialProtection, var int spellID) // spellID can be -1 if the damage type is not magic.
{
	var C_NPC damageSender; damageSender = Hlp_GetNpc(damageSender_ID);
	var C_NPC damageReceiver; damageReceiver = Hlp_GetNpc(damageReceiver_ID);
	
	return GetProtection(damageSender, damageReceiver, damageType, initialProtection, spellID);
};
