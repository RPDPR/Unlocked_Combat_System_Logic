// ================================================================================
// UNLOCKED COMBAT SYSTEM (UCS) v2.1 - EXTERNAL FUNCTIONS (EXTERNALS)
// Copyright (c) 2026 RPD. All rights reserved.
// ================================================================================

// --------------------------------------------------------------------------------
// 1. CORE EFFECT CREATION
// --------------------------------------------------------------------------------
func void UCS_CreateFXProto(var int fxPrototype, var int damage, var int damageIndex, var int spellID, var int spellLevel, var string visualFXName, var int dontKill, var float loopInterval, var int iterationCount, var float startDelay, var func exitCondition);
func void UCS_Hit(var C_NPC damageSender, var C_NPC damageReceiver, var int damage, var int damageIndex, var int spellID, var int spellLevel, var string visualFXName, var int dontKill);
func void UCS_StartFX(var int fxInstance, var int fxPrototype, var C_NPC damageSender, var C_NPC damageReceiver);
func void UCS_StartFXEX(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver, var int damage, var int damageIndex, var int spellID, var int spellLevel, var string visualFXName, var int dontKill, var float loopInterval, var int iterationCount, var float startDelay, var func exitCondition);
func void UCS_RefreshFX(var int fxInstance, var int fxPrototype, var C_NPC damageSender, var C_NPC damageReceiver);
func void UCS_RefreshFXEX(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver, var int damage, var int damageIndex, var int spellID, var int spellLevel, var string visualFXName, var int dontKill, var float loopInterval, var int iterationCount, var float startDelay, var func exitCondition);
func void UCS_RestartFX(var int fxInstance, var int fxPrototype, var C_NPC damageSender, var C_NPC damageReceiver);
func void UCS_RestartFXEX(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver, var int damage, var int damageIndex, var int spellID, var int spellLevel, var string visualFXName, var int dontKill, var float loopInterval, var int iterationCount, var float startDelay, var func exitCondition);
func void UCS_StopFX(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver);

// --------------------------------------------------------------------------------
// 2. RUNTIME CONTEXT INSPECTION (GETTERS)
// --------------------------------------------------------------------------------
func int   UCS_IsRunning(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver);
func int   UCS_IsCompleted(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver);
func int   UCS_GetRefreshCount(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver);
func int   UCS_GetDamage(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver);
func int   UCS_GetDamageIndex(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver);
func int   UCS_GetSpellID(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver);
func int   UCS_GetSpellLevel(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver);
func string UCS_GetVisualFX(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver);
func int   UCS_GetDontKill(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver);
func float UCS_GetLoopInterval(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver);
func int   UCS_GetIterCount(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver);
func float UCS_GetStartDelay(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver);
func int   UCS_GetExitCondition(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver);
func int   UCS_GetCurrentIter(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver);
func float UCS_GetLastIterTime(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver);

// --------------------------------------------------------------------------------
// 3. RUNTIME CONTEXT MODIFICATION (SETTERS)
// --------------------------------------------------------------------------------
func void UCS_SetDamage(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver, var int newDamage);
func void UCS_SetDamageIndex(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver, var int newDamageIndex);
func void UCS_SetSpellID(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver, var int newSpellID);
func void UCS_SetSpellLevel(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver, var int newSpellLevel);
func void UCS_SetVisualFX(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver, var string newVisualFXName);
func void UCS_SetDontKill(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver, var int newDontKill);
func void UCS_SetLoopInterval(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver, var float newLoopInterval);
func void UCS_SetIterCount(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver, var int newIterCount);
func void UCS_SetStartDelay(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver, var float newStartDelay);
func void UCS_SetExitCondition(var int fxInstance, var C_NPC damageSender, var C_NPC damageReceiver, var func newExitCondition);


// --------------------------------------------------------------------------------
// 4. PIPELINE CORE (CONTEXT DELIVERY)
// --------------------------------------------------------------------------------
func C_NPC UCS_GetDamageSender();
func C_NPC UCS_GetDamageReceiver();

// --------------------------------------------------------------------------------
// 5. DAMAGE TYPE USAGE
// --------------------------------------------------------------------------------
func int  Npc_GetLastHitDT(var C_NPC targetNpc);

// --------------------------------------------------------------------------------
// 6. MATHEMATICAL & STRUCTURAL HELPERS
// --------------------------------------------------------------------------------
func int   Hlp_MultInt(var int value, var float x);
func float Hlp_MultInt_F(var int value, var float x);
func int   Hlp_IsItemEquipped(var C_ITEM itemInstance, var C_NPC targetNpc);
func int   Hlp_GetItemInstanceID(var C_ITEM targetItem);
