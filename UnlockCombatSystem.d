
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

func int SwitchByDT(var int damageType, var int barrier, var int blunt, var int edge, var int fire, var int fly, var int magic, var int point, var int fall, var int piercing)
{
	if(damageType == DT_BARRIER){ return barrier; };
	if(damageType == DT_BLUNT){ return blunt; };
	if(damageType == DT_EDGE){ return edge; };
	if(damageType == DT_EDGE){ return edge; };
	if(damageType == DT_FIRE){ return fire; };
	if(damageType == DT_FLY){ return fly; };
	if(damageType == DT_MAGIC){ return magic; };
	if(damageType == DT_POINT){ return point; };
	if(damageType == DT_FALL){ return fall; };
	if(damageType == DT_PIERCING){ return piercing; };
};

// Element Types (You can add custom element types here) /////
const int ET_FIRE = 0;
const int ET_ICE = 1;
const int ET_DARKNESS = 2;
const int ET_WIND = 3;

func int SwitchByET(var int elementType, var int fire, var int ice, var int darkness, var int wind)
{
	if(elementType == ET_FIRE){ return fire; };
	if(elementType == ET_ICE){ return ice; };
	if(elementType == ET_DARKNESS){ return darkness; };
	if(elementType == ET_WIND){ return wind; };
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

func int CalcDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int isTotalDamage, var int damageType, var int initialDamage, var int spellID)
{
	var int i; i = initialDamage; // i - initial damage
	
	var int resultDamage; resultDamage = i; // i - initial damage
	
	if(!isTotalDamage)
	{
		// Calculating damage for mobs /////
		
		if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM)
		{
			resultDamage = SwitchByDT(damageType, i, Hlp_MultiplyInt(i, 2.00), 0, i, i, Hlp_MultiplyInt(i, 3.00), /* SwitchByET(elementType, 0, 0, 0, 0), */ i, i, i); //0, 0, 0, 0
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
			
			resultDamage = SwitchByDT(damageType, i, Hlp_MultiplyInt(i, multiplier), 0, i, i, Hlp_MultiplyInt(i, 3.00), /* SwitchByET(elementType, 0, 0, 0, 0), */ i, i, i); //0, 0, 0, 0
		};
	};
	if(isTotalDamage)
	{
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
		return SwitchByDT(damageType, 0, 0, 0, 0, 0, 0, /* SwitchByET(elementType, 10, 0, 0, 0), */ 0, 0, 0); //10, 0, 0, 0
	};
	if(itemInstanceID == ItAm_PROT_MAGIC_ICE_01)
	{
		return SwitchByDT(damageType, 0, 0, 0, 0, 0, 0, /* SwitchByET(elementType, 0, 10, 0, 0), */ 0, 0, 0); //0, 10, 0, 0
	};
	if(itemInstanceID == ItAm_PROT_MAGIC_DARKNESS_01)
	{
		return SwitchByDT(damageType, 0, 0, 0, 0, 0, 0, /* SwitchByET(elementType, 0, 0, 10, 0), */ 0, 0, 0); //0, 0, 10, 0
	};
	if(itemInstanceID == ItAm_PROT_MAGIC_WIND_01)
	{
		return SwitchByDT(damageType, 0, 0, 0, 0, 0, 0, /* SwitchByET(elementType, 0, 0, 0, 10), */ 0, 0, 0); //0, 0, 0, 10
	};
	
	// Armor
	if(itemInstanceID == ItAr_Nikita)
	{
		return SwitchByDT(damageType, 0, 0, 0, 0, 0, 0, /* SwitchByET(elementType, 75, 100, 125, 0), */ 0, 0, 0); //75, 100, 125, 0
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
		i += GetCustomProtectionOfItem(ItAm_PROT_MAGIC_FIRE_01, damageType, ET_FIRE);
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
func int GetDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int isTotalDamage, var int damageType, var int initialDamage, var int spellID)
{
	var int resultDamage;
	
	resultDamage = CalcDamage(damageSender, damageReceiver, isTotalDamage, damageType, initialDamage, spellID);
	
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

// The functions below are engine-based, DON'T CHANGE THEM! /////
/* func int PullCustomMagicDamage(var int damageSender_ID, var int damageReceiver_ID, var int spellID)
{
	var C_NPC damageSender; damageSender = Hlp_GetNpc(damageSender_ID);
	var C_NPC damageReceiver; damageReceiver = Hlp_GetNpc(damageReceiver_ID);
	
	return SwitchBySpellID(damageSender, damageReceiver, spellID, AT_DAMAGE);
};

func int PullCustomMagicProtection(var int damageSender_ID, var int damageReceiver_ID, var int spellID)
{
	var C_NPC damageSender; damageSender = Hlp_GetNpc(damageSender_ID);
	var C_NPC damageReceiver; damageReceiver = Hlp_GetNpc(damageReceiver_ID);
	
	return SwitchBySpellID(damageSender, damageReceiver, spellID, AT_PROTECTION);
}; */

func int PullIsCustomDamageType(var int damageSender_ID, var int damageReceiver_ID, var int itemInstance_ID)
{
	// DT_PIERCING /////
	if(itemInstance_ID == ItMw_Meisterdegen)
	{
		return DT_PIERCING;
	};
	
	return -1;
};

func int PullMinimalDamage(var int damageSender_ID, var int damageReceiver_ID, var int damageType, var int spellID)
{
	var C_NPC damageSender; damageSender = Hlp_GetNpc(damageSender_ID);
	var C_NPC damageReceiver; damageReceiver = Hlp_GetNpc(damageReceiver_ID);
	
	return GetMinimalDamage(damageSender, damageReceiver, damageType, spellID);
};

func int PullCustomDamage(var int damageSender_ID, var int damageReceiver_ID, var int isTotalDamage, var int damageType, var int initialDamage, var int spellID) // spellID can be -1 if the damage type is not magic. 
{
	var C_NPC damageSender; damageSender = Hlp_GetNpc(damageSender_ID);
	var C_NPC damageReceiver; damageReceiver = Hlp_GetNpc(damageReceiver_ID);
	
	return GetDamage(damageSender, damageReceiver, isTotalDamage, damageType, initialDamage, spellID);
};

func int PullCustomProtection(var int damageSender_ID, var int damageReceiver_ID, var int damageType, var int initialProtection, var int spellID) // spellID can be -1 if the damage type is not magic.
{
	var C_NPC damageSender; damageSender = Hlp_GetNpc(damageSender_ID);
	var C_NPC damageReceiver; damageReceiver = Hlp_GetNpc(damageReceiver_ID);
	
	return GetProtection(damageSender, damageReceiver, damageType, initialProtection, spellID);
};
