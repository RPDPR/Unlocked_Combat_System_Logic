
// Action Types /////
const int T_DAMAGE = 0;
const int T_PROTECTION = 1;

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

func int GetCustomDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int initialDamage, var int damageType, var int elementType)
{
	var int i; i = initialDamage; // i - initial damage
	
	var int resultDamage; resultDamage = i; // i - initial damage
	
	// Calculating magic damage for mobs /////

	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_FIREGOLEM)
	{
		resultDamage = SwitchByDT(damageType, i, i, i, i, i, SwitchByET(elementType, 0, Hlp_MultiplyInt(i, 1.25), 0, 0), i, i, i); //0, 1.25x, 0, 0
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_ICEGOLEM)
	{
		resultDamage = SwitchByDT(damageType, i, i, i, i, i, SwitchByET(elementType, Hlp_MultiplyInt(i, 1.25), 0, 0, 0), i, i, i); //1.25x, 0, 0, 0
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM)
	{
		resultDamage = SwitchByDT(damageType, i, i, i, i, i, SwitchByET(elementType, 0, 0, 0, 0), i, i, i); //0, 0, 0, 0
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_Icewolf)
	{
		resultDamage = SwitchByDT(damageType, i, i, i, i, i, SwitchByET(elementType, Hlp_MultiplyInt(i, 1.75), 0, i, i), i, i, i); //1.75x, 0, i, i
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_SKELETON)
	{
		resultDamage = SwitchByDT(damageType, i, i, i, i, i, SwitchByET(elementType, Hlp_MultiplyInt(i, 1.50), i, 0, i), i, i, i); //1.50x, i, 0, i
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE)
	{
		resultDamage = SwitchByDT(damageType, i, i, i, i, i, SwitchByET(elementType, Hlp_MultiplyInt(i, 1.50), i, 0, i), i, i, i); //1.50x, i, 0, i
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE)
	{
		resultDamage = SwitchByDT(damageType, i, i, i, i, i, SwitchByET(elementType, Hlp_MultiplyInt(i, 1.50), i, 0, i), i, i, i); //1.50x, i, 0, i
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
		return SwitchByDT(damageType, 0, 0, 0, 0, 0, SwitchByET(elementType, 10, 0, 0, 0), 0, 0, 0, 0); //10, 0, 0, 0
	};
	if(itemInstanceID == ItAm_PROT_MAGIC_ICE_01)
	{
		return SwitchByDT(damageType, 0, 0, 0, 0, 0, SwitchByET(elementType, 0, 10, 0, 0), 0, 0, 0, 0); //0, 10, 0, 0
	};
	if(itemInstanceID == ItAm_PROT_MAGIC_DARKNESS_01)
	{
		return SwitchByDT(damageType, 0, 0, 0, 0, 0, SwitchByET(elementType, 0, 0, 10, 0), 0, 0, 0, 0); //0, 0, 10, 0
	};
	if(itemInstanceID == ItAm_PROT_MAGIC_WIND_01)
	{
		return SwitchByDT(damageType, 0, 0, 0, 0, 0, SwitchByET(elementType, 0, 0, 0, 10), 0, 0, 0, 0); //0, 0, 0, 10
	};
	
	// Armor
	if(itemInstanceID == ItAr_Nikita)
	{
		return SwitchByDT(damageType, 0, 0, 0, 0, 0, SwitchByET(elementType, 75, 100, 125, 0), 0, 0, 0, 0); //75, 100, 125, 0
	};
	
	// Rings
	
	// Belts
	
	return 0;
};

func int GetCustomProtection(var C_NPC damageSender, var C_NPC damageReceiver, var int initialProtection, var int damageType, var int elementType)
{
	var int i; i = initialProtection; // i - initial protection
	
	// Amulets
	if(Hlp_IsItemEquipped(ItAm_PROT_MAGIC_FIRE_01, damageReceiver))
	{
		i += GetCustomProtectionOfItem(ItAm_PROT_MAGIC_FIRE_01, damageType, elementType);
	};
	if(Hlp_IsItemEquipped(ItAm_PROT_MAGIC_ICE_01, damageReceiver))
	{
		i += GetCustomProtectionOfItem(ItAm_PROT_MAGIC_ICE_01, damageType, elementType);
	};
	if(Hlp_IsItemEquipped(ItAm_PROT_MAGIC_DARKNESS_01, damageReceiver))
	{
		i += GetCustomProtectionOfItem(ItAm_PROT_MAGIC_DARKNESS_01, damageType, elementType);
	};
	if(Hlp_IsItemEquipped(ItAm_PROT_MAGIC_WIND_01, damageReceiver))
	{
		i += GetCustomProtectionOfItem(ItAm_PROT_MAGIC_WIND_01, damageType, elementType);
	};
	
	// Armor
	if(Hlp_IsItemEquipped(ItAr_Nikita, damageReceiver))
	{
		i += GetCustomProtectionOfItem(Hlp_GetItemInstanceID(ItAr_Nikita), damageType, elementType);
	};
	
	// Rings
	
	// Belts
	
	var int resultProtection; resultProtection = i; // i - initial protection
	
	// Calculating magic protection for mobs /////
	
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_FIREGOLEM)
	{
		resultProtection = SwitchByDT(damageType, i, i, i, i, i, SwitchByET(elementType, immune, 0, i, i), i, i, i); //immune, 0, i, i
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_ICEGOLEM)
	{
		resultProtection = SwitchByDT(damageType, i, i, i, i, i, SwitchByET(elementType, 0, immune, i, i), i, i, i); //0, immune, i, i
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM)
	{
		resultProtection = SwitchByDT(damageType, i, i, i, i, i, SwitchByET(elementType, immune, immune, immune, immune), i, i, i); //immune, immune, immune, immune
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_Icewolf)
	{
		resultProtection = SwitchByDT(damageType, i, i, i, i, i, SwitchByET(elementType, i, i, i, i), i, i, i); //i, i, i, i
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_SKELETON)
	{
		resultProtection = SwitchByDT(damageType, i, i, i, i, i, SwitchByET(elementType, Hlp_MultiplyInt(i, 0.70), i, immune, i), i, i, i); //0.70x, i, immune, i
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE)
	{
		resultProtection = SwitchByDT(damageType, i, i, i, i, i, SwitchByET(elementType, Hlp_MultiplyInt(i, 0.70), i, immune, i), i, i, i); //0.70x, i, immune, i
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE)
	{
		resultProtection = SwitchByDT(damageType, i, i, i, i, i, SwitchByET(elementType, Hlp_MultiplyInt(i, 0.70), i, immune, i), i, i, i); //0.70x, i, immune, i
	};
	if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_ORCELITE)
	{
		resultProtection = SwitchByDT(damageType, i, i, i, i, i, SwitchByET(elementType, i, i, 0, i), i, i, i); //i, i, 0, i
	};
	
	// Calculating magic protection for npcs /////
	
	if(Hlp_GetInstanceID(damageReceiver) == Hlp_GetInstanceID(NONE_8987_NIKITA))
	{
		resultProtection = SwitchByDT(damageType, i, i, i, i, i, SwitchByET(elementType, Hlp_MultiplyInt(i, 0.80), i, immune, 0), i, i, i); //0.80x, i, immune, 0
	};
	
	// You can write your own logic to send a custom protection below /////
	
	// Dont forget to return the resultProtection variable in the end of your script /////
	
	return resultProtection;
};

func int SwitchByActionType(var C_NPC damageSender, var C_NPC damageReceiver, var int actionType)
{
	var int resultValue;
	
	if(actionType == T_DAMAGE)
	{
		resultValue = GetCustomDamage(damageSender, damageReceiver, SPL_DAMAGE_Geyser, DT_ MT_ICE);
	};
	if(actionType == T_PROTECTION)
	{
		resultValue = GetCustomProtection(damageSender, damageReceiver, damageReceiver.protection[PROT_MAGIC], ET_ICE);
	};

	return resultValue;	
};

func string BuildCustomMagicProtectionString(var C_ITEM item)
{
	var string f; f = IntToString(GetCustomProtectionOfItem(Hlp_GetItemInstanceID(item), MT_FIRE));
	var string i; i = IntToString(GetCustomProtectionOfItem(Hlp_GetItemInstanceID(item), MT_ICE));
	var string d; d = IntToString(GetCustomProtectionOfItem(Hlp_GetItemInstanceID(item), MT_DARKNESS));
	var string w; w = IntToString(GetCustomProtectionOfItem(Hlp_GetItemInstanceID(item), MT_WIND));
	
	var string separator; separator = " | ";
	
	return ConcatStrings("Защита от магии: ", Concat5StringsWithSeparator(f, i, d, w, "", " | "));
};

// The functions below are engine-based, DON'T CHANGE THEM! /////
func int PullCustomMagicDamage(var int damageSender_ID, var int damageReceiver_ID, var int spellID)
{
	var C_NPC damageSender; damageSender = Hlp_GetNpc(damageSender_ID);
	var C_NPC damageReceiver; damageReceiver = Hlp_GetNpc(damageReceiver_ID);
	
	return SwitchBySpellID(damageSender, damageReceiver, spellID, T_DAMAGE);
};

func int PullCustomMagicProtection(var int damageSender_ID, var int damageReceiver_ID, var int spellID)
{
	var C_NPC damageSender; damageSender = Hlp_GetNpc(damageSender_ID);
	var C_NPC damageReceiver; damageReceiver = Hlp_GetNpc(damageReceiver_ID);
	
	return SwitchBySpellID(damageSender, damageReceiver, spellID, T_PROTECTION);
};

func int PullCustomDamage(var int damageSender_ID, var int damageReceiver_ID, var int  var int spellID)
{
	var C_NPC damageSender; damageSender = Hlp_GetNpc(damageSender_ID);
	var C_NPC damageReceiver; damageReceiver = Hlp_GetNpc(damageReceiver_ID);
	
	return SwitchByActionType(damageSender, damageReceiver, spellID, T_DAMAGE);
};

func int PullCustomProtection(var int damageSender_ID, var int damageReceiver_ID, var int spellID)
{
	var C_NPC damageSender; damageSender = Hlp_GetNpc(damageSender_ID);
	var C_NPC damageReceiver; damageReceiver = Hlp_GetNpc(damageReceiver_ID);
	
	return SwitchByActionType(damageSender, damageReceiver, spellID, T_PROTECTION);
};