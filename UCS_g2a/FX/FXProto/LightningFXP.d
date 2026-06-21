
/* const int LightningFXP = 0; // FX PROTOTYPE

const int LightningFXP_Damage = 10;
const int LightningFXP_DT = DT_LIGHTNING;
const int LightningFXP_SpellID = -1;
const int LightningFXP_SpellLevel = -1;
const string LightningFXP_VFX = "SPELLFX_LIGHTNINGFLASH_TARGET_CLOUD";
const int LightningFXP_DontKill = 0;
const float LightningFXP_LoopInterval = 500.0;
const int LightningFXP_IterCount = 5;
const float LightningFXP_StartDelay = 0.0;

func int LightningFXP_ExitCnd(var int fxID) // exit condition
{
	// fxID - fx instance
	// self - damage receiver
	// other - damage sender
	
	var int requiredMana;
	
	requiredMana = Hlp_MultInt(other.attribute[ATR_MANA_MAX], 0.75);
	
	if(other.attribute[ATR_MANA] < requiredMana)
	{
		return true;
	};
	
	return false;
};

func void InitLightningFXP()
{
	UCS_CreateFXProto(LightningFXP, LightningFXP_Damage, LightningFXP_DT, LightningFXP_SpellID, LightningFXP_SpellLevel, LightningFXP_VFX, LightningFXP_DontKill, LightningFXP_LoopInterval, LightningFXP_IterCount, LightningFXP_StartDelay, LightningFXP_ExitCnd);
}; */