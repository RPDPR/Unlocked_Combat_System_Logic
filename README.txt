================================================================================
UNLOCKED COMBAT SYSTEM (UCS) v2.0
Copyright (c) 2026 RPD. All rights reserved.
================================================================================
HI, DEAR DEVELOPER! Thank you for choosing UCS plugin as your primary tool
for advanced damage pipeline management in ZenGin-based games, like Gothic I, Gothic II NoTR and their mods!

UCS (Unlocked Combat System) v2.0 is a major update that significantly expands 
the plugin's core functionality, adding an active standalone EFFECTS ENGINE on top of the 
robust damage pipeline hooks.
================================================================================

[ ABOUT UCS v2.0 ]

The plugin now supports:
- Passive pipeline hooks for damage interception (legacy v1.0).
- Instant and Loop (periodic) custom damage generation.
- Complete lifecycle management of internal effect contexts (ctx).
- Automatic memory cleanup on game load/save events.
- Full integration with Daedalus scripts via external functions.


Below is the list of all available script functions with their argument layouts, which should help you with your majestic stuff.

--------------------------------------------------------------------------------
0. SYSTEM INITIALIZATION & STARTUP
--------------------------------------------------------------------------------
To ensure everything loads in the correct engine state, UCS exposes a dedicated 
startup callback function that is automatically triggered by the core.

func void UCS_Init()
{
    // The engine automatically invokes this function during game startup.
    // This is the CORRECT and SAFE place to register your FX Prototypes!
    
    UCS_CreateFXProto( MyPoisonFXP,  10, DT_POISON, -1, -1, "", 0, 1000.0, 5, 1000.0, vf );
    UCS_CreateFXProto( MyLightningFXP, 100, DT_LIGHTNING, -1, -1, "SPELLFX_LIGHTNINGFLASH_TARGET_CLOUD", 1, 300.0, 3, 0.0, isParalyzed );
    UCS_CreateFXProto( MyBurnFXP,    25, DT_FIRE,  -1, -1, "",   1, 500.0,  10, 5000.0, vf );
};


[ DAEDALUS EXTERNALS REFERENCE: UCS_PACKET ]

--------------------------------------------------------------------------------
1. CORE EFFECT CREATION
--------------------------------------------------------------------------------

/* UCS_CreateFXProto(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11)
    1: FxPrototype- [int] Reference to the declared FX Prototype (must be constant! e.g: const int LightningFXP = 0;)
    2: damage        - [int] Amount of damage per iteration
    3: damageIndex   - [int] Damage type index (can be custom)
    4: spellID       - [int] Associated spell ID (-1 if none)
    5: spellLevel       - [int] Associated spell level (-1 if none)
    6: visualFXName  - [string] Name of PFX/VisualFX to play on target
    7: dontKill      - [int] Boolean (0/1). If 1, damage won't instantly kill target
    8: loopInterval  - [float] Time between ticks in milliseconds (min 100.0)
    9: iterationCount- [int] Total number of damage ticks (-1 for infinite)
    10: startDelay    - [float] Total delay before the ticks start (-1.0 or 0.0 if none)
    11: exitCondition - [func] Daedalus function name acting as early stop condition (any void function if none, 'vf' by default)
    Returns: [void]. Registers a new FX PROTOTYPE and attaches it to the ref.
*/
/* UCS_Hit(1, 2, 3, 4, 5, 6, 7, 8)
    1: damageSender  - [instance/C_NPC] Attacker instance
    2: damageReceiver- [instance/C_NPC] Victim instance
    3: damage        - [int] Amount of one-time damage
    4: damageIndex   - [int] Damage type index (can be custom)
    5: spellID       - [int] Associated spell ID (-1 if none)
    6: spellLevel       - [int] Associated spell level (-1 if none)
    7: visualFXName  - [string] Name of PFX/VisualFX to play on target
    8: dontKill      - [int] Boolean (0/1). If 1, damage won't instantly kill target
    Returns: [void]. Immediately deals damage.
*/

/* UCS_StartFX(1, 2, 3, 4)
    1: fxInstance - [int] Reference to the declared FX Instance (must be variable! e.g: var int lightningFX;)
    2: FxPrototype- [int] Pre-created CONST INT reference registered via UCS_CreateFXProto
    3: damageSender  - [instance/C_NPC] Attacker instance
    4: damageReceiver- [instance/C_NPC] Victim instance
    Returns: [void]. Starts prototype-based FX. Idempotent (ignores active).
*/

/* UCS_StartFXEX(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13)
    1: fxInstance - [int] Reference to the declared FX Instance
    2: damageSender  - [instance/C_NPC] Attacker instance
    3: damageReceiver- [instance/C_NPC] Victim instance
    4: damage        - [int] Amount of one-time damage
    5: damageIndex   - [int] Damage type index (can be custom)
    6: spellID       - [int] Associated spell ID (-1 if none)
    7: spellLevel       - [int] Associated spell level (-1 if none)
    8: visualFXName  - [string] Name of PFX/VisualFX to play on target
    9: dontKill      - [int] Boolean (0/1). If 1, damage won't instantly kill target
    10: loopInterval  - [float] Time between ticks in milliseconds (min 100.0)
    11: iterationCount- [int] Total number of damage ticks (-1 for infinite)
    12: startDelay    - [float] Total delay before the ticks start (-1.0 or 0.0 if none)
    13: exitCondition - [func] Daedalus function name acting as early stop condition (any void function if none, 'vf' by default)
    Returns: [void]. Starts inline FX. Idempotent (ignores active).
*/

/* UCS_RefreshFX(1, 2, 3, 4)
    1: fxInstance - [int] Reference to the declared FX Instance
    2: FxPrototype- [int] Pre-created CONST INT reference registered via UCS_CreateFXProto
    3: damageSender  - [instance/C_NPC] Attacker instance
    4: damageReceiver- [instance/C_NPC] Victim instance
    Returns: [void]. Starts/refreshes prototype-based FX. Keeps runtime params (resets current iteration only). Non-idempotent.
*/

/* UCS_RefreshFXEX(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13)
    1: fxInstance - [int] Reference to the declared FX Instance
    2: damageSender  - [instance/C_NPC] Attacker instance
    3: damageReceiver- [instance/C_NPC] Victim instance
    4: damage        - [int] Amount of one-time damage
    5: damageIndex   - [int] Damage type index (can be custom)
    6: spellID       - [int] Associated spell ID (-1 if none)
    7: spellLevel       - [int] Associated spell level (-1 if none)
    8: visualFXName  - [string] Name of PFX/VisualFX to play on target
    9: dontKill      - [int] Boolean (0/1). If 1, damage won't instantly kill target
    10: loopInterval  - [float] Time between ticks in milliseconds (min 100.0)
    11: iterationCount- [int] Total number of damage ticks (-1 for infinite)
    12: startDelay    - [float] Total delay before the ticks start (-1.0 or 0.0 if none)
    13: exitCondition - [func] Daedalus function name acting as early stop condition (any void function if none, 'vf' by default)
    Returns: [void]. Starts/refreshes inline FX. Keeps runtime params (resets current iteration only). Non-idempotent.
*/

/* UCS_RestartFX(1, 2, 3, 4)
    1: fxInstance - [int] Reference to the declared FX Instance
    2: FxPrototype- [int] Pre-created CONST INT reference registered via UCS_CreateFXProto
    3: damageSender  - [instance/C_NPC] Attacker instance
    4: damageReceiver- [instance/C_NPC] Victim instance
    Returns: [void]. Starts/restarts prototype-based FX. Resets runtime params to default. Non-idempotent.
*/

/* UCS_RestartFXEX(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13)
    1: fxInstance - [int] Reference to the declared FX Instance
    2: damageSender  - [instance/C_NPC] Attacker instance
    3: damageReceiver- [instance/C_NPC] Victim instance
    4: damage        - [int] Amount of one-time damage
    5: damageIndex   - [int] Damage type index (can be custom)
    6: spellID       - [int] Associated spell ID (-1 if none)
    7: spellLevel       - [int] Associated spell level (-1 if none)
    8: visualFXName  - [string] Name of PFX/VisualFX to play on target
    9: dontKill      - [int] Boolean (0/1). If 1, damage won't instantly kill target
    10: loopInterval  - [float] Time between ticks in milliseconds (min 100.0)
    11: iterationCount- [int] Total number of damage ticks (-1 for infinite)
    12: startDelay    - [float] Total delay before the ticks start (-1.0 or 0.0 if none)
    13: exitCondition - [func] Daedalus function name acting as early stop condition (any void function if none, 'vf' by default)
    Returns: [void]. Starts/restarts inline FX. Resets runtime params to default. Non-idempotent.
*/

/* UCS_StopFX(1, 2, 3)
    1: fxInstance - [int] Reference to the declared FX Instance
    2: damageSender  - [instance/C_NPC] Attacker instance
    3: damageReceiver- [instance/C_NPC] Victim instance
    Returns: [void]. Stops the running effect and kills it's context
*/

--------------------------------------------------------------------------------
2. RUNTIME CONTEXT INSPECTION (GETTERS)
--------------------------------------------------------------------------------
All getters require explicit fxInstance + sender + receiver matching for safety. 

/* UCS_IsRunning(1, 2, 3)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    Returns: [int]. 1 if the effect is currently active; 0 otherwise.
*/

/* UCS_IsCompleted(1, 2, 3)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    Returns: [int]. 1 if the effect has ended; 0 otherwise.
*/

/* UCS_GetRefreshCount(1, 2, 3)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    Returns: [int]. Current FX refresh count (This count increments with each FX refresh until it ends); -1 otherwise.
*/

/* UCS_GetDamage(1, 2, 3)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    Returns: [int]. Current FX damage value; -1 otherwise.
*/

/* UCS_GetDamageIndex(1, 2, 3)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    Returns: [int]. Current FX damageIndex (can be custom); -1 otherwise.
*/

/* UCS_GetSpellID(1, 2, 3)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    Returns: [int]. Current embedded spell ID; -1 otherwise.
*/

/* UCS_GetSpellLevel(1, 2, 3)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    Returns: [int]. Current embedded spell level; -1 otherwise.
*/

/* UCS_GetVisualFX(1, 2, 3)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    Returns: [string]. Current active visualFX name string identifier; empty string otherwise.
*/

/* UCS_GetDontKill(1, 2, 3)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    Returns: [int]. 1 if "dont kill victim" flag is active; 0 otherwise.
*/

/* UCS_GetLoopInterval(1, 2, 3)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    Returns: [float]. Current delay step window between ticks in milliseconds; -1.0 otherwise.
*/

/* UCS_GetIterCount(1, 2, 3)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    Returns: [int]. Current absolute number of iterations configured; -1 otherwise.
*/

/* UCS_GetStartDelay(1, 2, 3)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    Returns: [float]. Current delay before the FX starts; -1.0 otherwise.
*/

/* UCS_GetCurrentIter(1, 2, 3)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    Returns: [int]. Current processing FX iteration; -1 otherwise.
*/

/* UCS_GetExitCondition(1, 2, 3)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    Returns: [int]. Current exit condition function index; -1 otherwise.
*/

/* UCS_GetLastIterTime(1, 2, 3)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    Returns: [float]. Timestamp in milliseconds since the exact last damage tick occurred; -1.0 otherwise. 
*/


--------------------------------------------------------------------------------
3. RUNTIME CONTEXT MODIFICATION (SETTERS)
--------------------------------------------------------------------------------
All setters require explicit fxInstance + sender + receiver matching for safety.
They allows you to dynamically mutate internal values of active loops over time.
This only works during direct damage application! Therefore, the setters won't apply valid values at any other time.

/* UCS_SetDamage(1, 2, 3, 4)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    4: newDamage     - [int] Modifies damage value for upcoming FX iterations.
*/

/* UCS_SetDamageIndex(1, 2, 3, 4)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    4: newDamageIndex      - [int] Modifies damageIndex for upcoming FX iterations.
*/

/* UCS_SetSpellID(1, 2, 3, 4)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    4: newSpellID    - [int] Modifies spellID for upcoming FX iterations.
*/

/* UCS_SetSpellLevel(1, 2, 3, 4)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    4: newSpellLevel    - [int] Modifies spellLevel for upcoming FX iterations.
*/

/* UCS_SetVisualFX(1, 2, 3, 4)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    4: newVisualFXName     - [string] Modifies visualFX name for upcoming FX iterations.
*/

/* UCS_SetDontKill(1, 2, 3, 4)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    4: newDontKillFlag - [int] Modifies dontKill flag for upcoming FX iterations.
*/

/* UCS_SetLoopInterval(1, 2, 3, 4)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    4: newLoopInterval   - [float] Modifies loop interval for upcoming FX iterations.
*/

/* UCS_SetIterCount(1, 2, 3, 4)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    4: newIterCount      - [int] Modifies iteration count for upcoming FX iterations.
*/

/* UCS_SetStartDelay(1, 2, 3, 4)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    4: newStartDelay   - [float] Modifies start delay for upcoming FX iterations.
*/

/* UCS_SetExitCondition(1, 2, 3, 4)
    1: fxInstance, 2: damageSender, 3: damageReceiver
    4: newExitConditionFunc - [func] Modifies exit condition function for upcoming FX iterations
*/



[ DAEDALUS EXTERNALS REFERENCE: PIPELINE_PACKET ]

--------------------------------------------------------------------------------
4. PIPELINE CORE (CONTEXT DELIVERY)
--------------------------------------------------------------------------------
The functions below are designed to extract the active NPC context from
the UCS core directly into Daedalus scripts. 

When the engine triggers calculation 'Pull' functions, it passes basic 
parameters (damage, spellID, etc.) but cannot pass full NPC instances directly. 
Therefore, these two externals act as the only way for scripts to retrieve 
the actual attacker and victim.

The provided `UCS_OnDamage_gX.d` scripts come pre-configured with these calls 
inside the Pull-functions to deliver a ready-to-use, turnkey solution.

/* UCS_GetDamageSender()
    Returns: [instance/C_NPC]. Returns the active attacker entity inside the current 
             damage calculation frame. Returns empty/invalid NPC instance otherwise.
*/

/* UCS_GetDamageReceiver()
    Returns: [instance/C_NPC]. Returns the active victim entity inside the current 
             damage calculation frame. Returns empty/invalid NPC instance otherwise.
*/

[ HOW IT WORKS UNDER THE HOOD ]
The template script utilizes these functions to bridge the context like this:

func int PullTotalDamage(var int damageType, var int initialTotalDamage, var int spellID) 
{
    // The engine calls this function. We manually pull the NPC actors:
    var C_NPC damageSender;   damageSender   = UCS_GetDamageSender();
    var C_NPC damageReceiver; damageReceiver = UCS_GetDamageReceiver();
    
    // Now both variables are fully valid and ready for custom formulas:
    return GetTotalDamage(damageSender, damageReceiver, damageType, initialTotalDamage, spellID);
};



[ DAEDALUS EXTERNALS REFERENCE: DT_MANAGER_PACKET ]

--------------------------------------------------------------------------------
5. DAMAGE TYPE USAGE
--------------------------------------------------------------------------------

/* Npc_GetLastHitDT(1)
    1: targetNpc     - [instance/C_NPC] The NPC instance you want to inspect
    Returns: [int]. The damage type index (either regular or custom) of the last damage type that 
             hit this NPC. Returns -1 if the NPC is invalid or has no damage history.
*/



[ DAEDALUS EXTERNALS REFERENCE: HLP_PACKET ]

--------------------------------------------------------------------------------
6. MATHEMATICAL & STRUCTURAL HELPERS
--------------------------------------------------------------------------------
A pack of highly requested QoL mathematical and structural helper 
functions. They drastically simplify writing complex expressions inside damage 
calculation scripts, bypassing native Daedalus script limitations.

/* Hlp_MultInt(1, 2)
    1: value         - [int] Base integer value
    2: multiplier    - [float] Floating-point multiplier
    Returns: [int]. Multiplies int by float and returns a truncated integer.
    Example: resultDamage = SwitchByDT(damageType, i, Hlp_MultInt(i, 1.50), i...);
*/

/* Hlp_MultInt_F(1, 2)
    1: value         - [int] Base integer value
    2: multiplier    - [float] Floating-point multiplier
    Returns: [float]. Multiplies int by float and returns the exact float result.
    Example: multiplier = Hlp_MultInt_F(GetMultiplier(sender, receiver...), 0.001);
*/

/* Hlp_IsItemEquipped(1, 2)
    1: itemInstance  - [instance/C_ITEM] Target item instance or active object.
    2: targetNpc     - [instance/C_NPC] The NPC whose inventory is being scanned
    Returns: [int]. 1 if the specific item is currently equipped and active 
             (works for ALL categories: armor, weapons, rings, amulets); 0 otherwise.
    Example: Hlp_IsItemEquipped(ItAm_PROT_POISON_01, damageReceiver)
*/

/* Hlp_GetItemInstanceID(1)
    1: targetItem    - [instance/C_ITEM] A direct item variable reference
    Returns: [int]. The instance ID of the C_ITEM object; -1 otherwise.
    Example: itemIdx = Hlp_GetItemInstanceID(item, damageSender)
*/



================================================================================
[ SAFETY & BEST PRACTICES ]

- Under-the-hood engine safety checks prevent access violations. Passing 
  nullptr instances or invalid internal index integers will be discarded safely.
- Modifying loop intervals under 100.0f via script overrides will be rejected 
  automatically to preserve physics frame accuracy and performance integrity.
================================================================================

