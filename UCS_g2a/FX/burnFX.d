
/* const int burnFX_Damage = 5;
const int burnFX_DT = DT_FIRE;
const int burnFX_SpellID = -1;
const int burnFX_SpellLevel = -1;
const string burnFX_VFX = "";
const int burnFX_DontKill = 0;
const float burnFX_LoopInterval = 2000.0;
const int burnFX_IterCount = 5;
const float burnFX_StartDelay = 2000.0;

func int burnFX_ExitCnd(var int fxID) // exit condition
{
	// fxID - fx instance
	// self - damage receiver
	// other - damage sender
	
	return false;
};

var int burnFX; // FX INSTANCE

func void startBurnFX(var C_NPC damageSender, var C_NPC damageReceiver)
{
	// INLINE FX
	UCS_RestartFXEX
	(
		burnFX, damageSender, damageReceiver,
		burnFX_Damage, burnFX_DT, burnFX_SpellID,
		burnFX_SpellLevel, burnFX_VFX, burnFX_DontKill,
		burnFX_LoopInterval, burnFX_IterCount, burnFX_StartDelay,
		burnFX_ExitCnd
	);
};

func void modifyBurnFX(var C_NPC damageSender, var C_NPC damageReceiver)
{
	if(UCS_GetRefreshCount(burnFX, damageSender, damageReceiver) >= 1)
	{
		UCS_SetDamage(burnFX, damageSender, damageReceiver, 10);
		UCS_SetVisualFX(burnFX, damageSender, damageReceiver, "SPELLFX_PYROKINESIS_SPREAD");
		UCS_SetLoopInterval(burnFX, damageSender, damageReceiver, 1000.0);
		UCS_SetIterCount(burnFX, damageSender, damageReceiver, 10);
		UCS_SetStartDelay(burnFX, damageSender, damageReceiver, 1000.0);
	}; 
};

func void stopBurnFX(var C_NPC damageSender, var C_NPC damageReceiver)
{
	UCS_StopFX(burnFX, damageSender, damageReceiver);
};

func int isBurnFXSpell(var int spellID)
{
	if(spellID == SPL_Firebolt){ return true; };
	if(spellID == SPL_InstantFireball){ return true; };
	if(spellID == SPL_ChargeFireball){ return true; };
	if(spellID == SPL_Firestorm){ return true; };
	if(spellID == SPL_Deathbolt){ return true; };
	if(spellID == SPL_Deathball){ return true; };
	if(spellID == SPL_Pyrokinesis){ return true; };
	if(spellID == SPL_Firerain){ return true; };
	
	return false;
};

func void processBurnFX(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int spellID)
{
	if(damageType == DT_MAGIC && isBurnFXSpell(spellID))
	{
		startBurnFX(damageSender, damageReceiver);
	};
	
	if(UCS_IsApplying(burnFX, damageSender, damageReceiver))
	{
		modifyBurnFX(damageSender, damageReceiver);
	};
}; */