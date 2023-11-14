local WEAPONTYPE_KNIFE = 0
local WEAPONTYPE_PISTOL = 1
local WEAPONTYPE_SUBMACHINEGUN = 2
local WEAPONTYPE_RIFLE = 3
local WEAPONTYPE_SHOTGUN = 4
local WEAPONTYPE_SNIPER_RIFLE = 5
local WEAPONTYPE_MACHINEGUN = 6
local WEAPONTYPE_GRENADE = 8

-- Lines 19-641
function cso2_decide_praise()
	local TopAssistPlayerIndex = 0
	local TopAssistPoint = 0
	local TopKillPlayerIndex = 0
	local TopKillCount = 0
	local TopKADPlayerIndex = 0
	local TopKADRate = 0
	local TopKillChainPlayerIndex = 0
	local TopKillChainCount = 0
	local TopDamagePlayerIndex = 0
	local TopDamageValue = 0
	local TopAliveTimePlayerIndex = 0
	local TopAliveTime = 0
	local TopPistolKillPlayerIndex = 0
	local TopPistolKillCount = 0
	local TopHitRatePlayerIndex = 0
	local TopHitRate = 0
	local TopKnifeKillPlayerIndex = 0
	local TopKnifeKillCount = 0
	local TopSniperKillPlayerIndex = 0
	local TopSniperKillCount = 0
	local TopHeadShotKillPlayerIndex = 0
	local TopHeadShotKillCount = 0
	local TopGrenadeKillPlayerIndex = 0
	local TopGrenadeKillCount = 0
	local playerdata = GetAllPlayerList()

	for UserID, player in pairs(playerdata) do
		player:PushPraiseID(1001)
		player:PushPraiseID(1002)
		player:PushPraiseID(1003)
		player:PushPraiseID(1004)
		player:PushPraiseID(1005)

		if TopAssistPoint < player:GetAssistPoint() then
			TopAssistPlayerIndex = player:entindex()
			TopAssistPoint = player:GetAssistPoint()
		end

		if TopKillCount < player:GetKillCount() then
			TopKillPlayerIndex = player:entindex()
			TopKillCount = player:GetKillCount()
		end

		local MaxKillChainCount = player:GetMaxKillChainCount()

		if TopKillChainCount < MaxKillChainCount then
			TopKillChainPlayerIndex = player:entindex()
			TopKillChainCount = MaxKillChainCount
		end

		if MaxKillChainCount > 1 and MaxKillChainCount <= 3 then
			player:PushPraiseID(17)
		elseif MaxKillChainCount > 3 and MaxKillChainCount <= 6 then
			player:PushPraiseID(18)
		elseif MaxKillChainCount > 6 then
			player:PushPraiseID(19)
		end

		if TopDamageValue < player:GetTotalDamage() then
			TopDamagePlayerIndex = player:entindex()
			TopDamageValue = player:GetTotalDamage()
		end

		if TopAliveTime < player:GetTotalActiveTime() then
			TopAliveTimePlayerIndex = player:entindex()
			TopAliveTime = player:GetTotalActiveTime()
		end

		local fKAD = player:GetKAD()

		if TopKADRate < fKAD then
			TopKADPlayerIndex = player:entindex()
			TopKADRate = fKAD
		end

		if fKAD > 0.3 and fKAD <= 0.9 then
			player:PushPraiseID(2)
		elseif fKAD > 0.9 and fKAD <= 1.5 then
			player:PushPraiseID(3)
		elseif fKAD > 1.5 and fKAD <= 2 then
			player:PushPraiseID(4)
		elseif fKAD > 2 and fKAD <= 3 then
			player:PushPraiseID(5)
		elseif fKAD > 3 then
			player:PushPraiseID(6)
		end

		if player:GetPlayerKAD() < fKAD then
			player:PushPraiseID(7)
		end

		if player:IsKilledHigherLevelPlayer() == true then
			player:PushPraiseID(8)
		end

		local fHeadshotRate = tonumber(player:GetKillCountByHeadShot()) / tonumber(player:GetKillCount())

		if fHeadshotRate > 0.5 then
			player:PushPraiseID(16)
		end

		local nHeadShotCount = player:GetKillCountByHeadShot()

		if TopHeadShotKillCount < nHeadShotCount then
			TopHeadShotKillPlayerIndex = player:entindex()
			TopHeadShotKillCount = nHeadShotCount
		end

		if TopHitRate < player:GetHitRate() then
			TopHitRatePlayerIndex = player:entindex()
			TopHitRate = player:GetHitRate()
		end

		local nKnifeKillCount = player:GetKillCountByWeaponType(WEAPONTYPE_KNIFE)
		local nPistolKillCount = player:GetKillCountByWeaponType(WEAPONTYPE_PISTOL)
		local nSMGKillCount = player:GetKillCountByWeaponType(WEAPONTYPE_SUBMACHINEGUN)
		local nRifleKillCount = player:GetKillCountByWeaponType(WEAPONTYPE_RIFLE)
		local nShotgunKillCount = player:GetKillCountByWeaponType(WEAPONTYPE_SHOTGUN)
		local nSniperKillCount = player:GetKillCountByWeaponType(WEAPONTYPE_SNIPER_RIFLE)
		local nMachineGunKillCount = player:GetKillCountByWeaponType(WEAPONTYPE_MACHINEGUN)
		local nGrenadeKillCount = player:GetKillCountByWeaponType(WEAPONTYPE_GRENADE)
		local nTopKillCountOfWeaponType = 0
		local nTopKillWeaponType = -1

		if nTopKillCountOfWeaponType < nKnifeKillCount then
			local nTopKillCountOfWeaponType = nKnifeKillCount
			local nTopKillWeaponType = WEAPONTYPE_KNIFE
		end

		if nTopKillCountOfWeaponType < nPistolKillCount then
			local nTopKillCountOfWeaponType = nPistolKillCount
			local nTopKillWeaponType = WEAPONTYPE_PISTOL
		end

		if nTopKillCountOfWeaponType < nSMGKillCount then
			local nTopKillCountOfWeaponType = nSMGKillCount
			local nTopKillWeaponType = WEAPONTYPE_SUBMACHINEGUN
		end

		if nTopKillCountOfWeaponType < nRifleKillCount then
			local nTopKillCountOfWeaponType = nRifleKillCount
			local nTopKillWeaponType = WEAPONTYPE_RIFLE
		end

		if nTopKillCountOfWeaponType < nShotgunKillCount then
			local nTopKillCountOfWeaponType = nShotgunKillCount
			local nTopKillWeaponType = WEAPONTYPE_SHOTGUN
		end

		if nTopKillCountOfWeaponType < nSniperKillCount then
			local nTopKillCountOfWeaponType = nSniperKillCount
			local nTopKillWeaponType = WEAPONTYPE_SNIPER_RIFLE
		end

		if nTopKillCountOfWeaponType < nMachineGunKillCount then
			local nTopKillCountOfWeaponType = nMachineGunKillCount
			local nTopKillWeaponType = WEAPONTYPE_MACHINEGUN
		end

		if nTopKillCountOfWeaponType < nGrenadeKillCount then
			local nTopKillCountOfWeaponType = nGrenadeKillCount
			local nTopKillWeaponType = WEAPONTYPE_GRENADE
		end

		if nTopKillWeaponType == WEAPONTYPE_KNIFE then
			player:PushPraiseID(32)
		elseif nTopKillWeaponType == WEAPONTYPE_PISTOL then
			player:PushPraiseID(26)
		elseif nTopKillWeaponType == WEAPONTYPE_SUBMACHINEGUN then
			player:PushPraiseID(28)
		elseif nTopKillWeaponType == WEAPONTYPE_RIFLE then
			player:PushPraiseID(29)
		elseif nTopKillWeaponType == WEAPONTYPE_SHOTGUN then
			player:PushPraiseID(27)
		elseif nTopKillWeaponType == WEAPONTYPE_SNIPER_RIFLE then
			player:PushPraiseID(30)
		elseif nTopKillWeaponType == WEAPONTYPE_MACHINEGUN then
			player:PushPraiseID(31)
		end

		if TopKnifeKillCount < nKnifeKillCount then
			TopKnifeKillPlayerIndex = player:entindex()
			TopKnifeKillCount = nKnifeKillCount
		end

		if TopPistolKillCount < nPistolKillCount then
			TopPistolKillPlayerIndex = player:entindex()
			TopPistolKillCount = nPistolKillCount
		end

		if TopSniperKillCount < nSniperKillCount then
			TopSniperKillPlayerIndex = player:entindex()
			TopSniperKillCount = nSniperKillCount
		end

		if TopGrenadeKillCount < nGrenadeKillCount then
			TopGrenadeKillPlayerIndex = player:entindex()
			TopGrenadeKillCount = nGrenadeKillCount
		end
	end

	local TopAssistPlayer = GetPlayerByIndex(TopAssistPlayerIndex)

	if TopAssistPlayer ~= nil then
		TopAssistPlayer:PushPraiseID(1)
	end

	local TopKillPlayer = GetPlayerByIndex(TopKillPlayerIndex)

	if TopKillPlayer ~= nil then
		TopKillPlayer:PushPraiseID(10)
	end

	local TopKillChainPlayer = GetPlayerByIndex(TopKillChainPlayerIndex)

	if TopKillChainPlayer ~= nil then
		TopKillChainPlayer:PushPraiseID(12)
	end

	local TopDamagePlayer = GetPlayerByIndex(TopDamagePlayerIndex)

	if TopDamagePlayer ~= nil then
		TopDamagePlayer:PushPraiseID(14)
	end

	local TopAliveTimePlayer = GetPlayerByIndex(TopAliveTimePlayerIndex)

	if TopAliveTimePlayer ~= nil then
		TopAliveTimePlayer:PushPraiseID(15)
	end

	local TopKADPlayer = GetPlayerByIndex(TopKADPlayerIndex)

	if TopKADPlayer ~= nil then
		TopKADPlayer:PushPraiseID(11)
	end

	local TopHitRatePlayer = GetPlayerByIndex(TopHitRatePlayerIndex)

	if TopHitRatePlayer ~= nil then
		TopHitRatePlayer:PushPraiseID(23)
	end

	local TopKnifeKillPlayer = GetPlayerByIndex(TopKnifeKillPlayerIndex)

	if TopKnifeKillPlayer ~= nil then
		TopKnifeKillPlayer:PushPraiseID(20)
	end

	local TopPistolKillPlayer = GetPlayerByIndex(TopPistolKillPlayerIndex)

	if TopPistolKillPlayer ~= nil then
		TopPistolKillPlayer:PushPraiseID(22)
	end

	local TopSniperKillPlayer = GetPlayerByIndex(TopSniperKillPlayerIndex)

	if TopSniperKillPlayer ~= nil then
		TopSniperKillPlayer:PushPraiseID(21)
	end

	local TopHeadShotKillPlayer = GetPlayerByIndex(TopHeadShotKillPlayerIndex)

	if TopHeadShotKillPlayer ~= nil then
		TopHeadShotKillPlayer:PushPraiseID(24)
	end

	local TopGrenadeKillPlayer = GetPlayerByIndex(TopGrenadeKillPlayerIndex)

	if TopGrenadeKillPlayer ~= nil then
		TopGrenadeKillPlayer:PushPraiseID(25)
	end
end

CSWeaponList = {
	"weapon_dummy2",
	"weapon_dummy3",
	"weapon_dummy4",
	"weapon_cso2"
}
CSWeaponScriptList = {
	"weapon_dummy",
	"weapon_dummy",
	"weapon_dummy",
	"weapon_cso2"
}
CSWeaponMode = {
	"Primary_Mode",
	"Secondary_Mode"
}
CSWeaponID = {
	"WEAPON_NONE",
	"WEAPON_P228",
	"WEAPON_GLOCK",
	"WEAPON_SCOUT",
	"WEAPON_HEGRENADE",
	"WEAPON_XM1014",
	"WEAPON_MAC10",
	"WEAPON_AUG",
	"WEAPON_SMOKEGRENADE",
	"WEAPON_ELITE",
	"WEAPON_FIVESEVEN",
	"WEAPON_UMP45",
	"WEAPON_SG550",
	"WEAPON_GALIL",
	"WEAPON_FAMAS",
	"WEAPON_USP",
	"WEAPON_AWP",
	"WEAPON_MP5NAVY",
	"WEAPON_M249",
	"WEAPON_M3",
	"WEAPON_M4A1",
	"WEAPON_TMP",
	"WEAPON_G3SG1",
	"WEAPON_FLASHBANG",
	"WEAPON_DEAGLE",
	"WEAPON_SG552",
	"WEAPON_AK47",
	"WEAPON_KNIFE",
	"WEAPON_P90",
	"WEAPON_FNC",
	"WEAPON_ANACONDA",
	"WEAPON_MP7",
	"WEAPON_F2000",
	"WEAPON_CROWBAR",
	"WEAPON_DEFUSEKIT",
	"WEAPON_NVG",
	"WEAPON_KEVLAR",
	"WEAPON_ASSAULTSUIT",
	"WEAPON_C4",
	"WEAPON_DUMMY",
	"WEAPON_SHIELDGUN",
	"WEAPON_MG3",
	"WEAPON_XM214",
	"WEAPON_MOUNT_MG",
	"WEAPON_MAX"
}
IN_ATTACK = 1
IN_JUMP = 2
IN_DUCK = 4
IN_FORWARD = 8
IN_BACK = 16
IN_USE = 32
IN_CANCEL = 64
IN_LEFT = 128
IN_RIGHT = 256
IN_MOVELEFT = 512
IN_MOVERIGHT = 1024
IN_ATTACK2 = 2048
IN_RUN = 4096
IN_RELOAD = 8192
IN_ALT1 = 16384
IN_ALT2 = 32768
IN_SCORE = 65536
IN_SPEED = 131072
IN_WALK = 262144
IN_ZOOM = 524288
IN_WEAPON1 = 1048576
IN_WEAPON2 = 2097152
IN_BULLRUSH = 4194304
IN_GRENADE1 = 8388608
IN_GRENADE2 = 16777216
FL_ONGROUND = 1
FL_DUCKING = 2
FL_ANIMDUCKING = 4
FL_WATERJUMP = 8
FL_ONTRAIN = 16
FL_INRAIN = 32
FL_FROZEN = 64
FL_ATCONTROLS = 128
FL_CLIENT = 256
FL_FAKECLIENT = 512
FL_INWATER = 1024
PLAYER_FLAG_BITS = 11
FL_FLY = 2048
FL_SWIM = 4096
FL_CONVEYOR = 8192
FL_NPC = 16384
FL_GODMODE = 32768
FL_NOTARGET = 65536
FL_AIMTARGET = 131072
FL_PARTIALGROUND = 262144
FL_STATICPROP = 524288
FL_GRAPHED = 1048576
FL_GRENADE = 2097152
FL_STEPMOVEMENT = 4194304
FL_DONTTOUCH = 8388608
FL_BASEVELOCITY = 16777216
FL_WORLDBRUSH = 33554432
FL_OBJECT = 67108864
FL_KILLME = 134217728
FL_ONFIRE = 268435456
FL_DISSOLVING = 536870912
FL_TRANSRAGDOLL = 1073741824
FL_UNBLOCKABLE_BY_PLAYER = 2147483648.0

-- Lines 916-918
function WeaponDamageInitDone()
end

-- Lines 922-960
function CalcWeaponDamage(iMode, iWeaponID, pWeaponInfo)
	local iDamage = pWeaponInfo.m_iDamage
	local csWeaponMode = CSWeaponMode[iMode + 1]
	local csWeaponID = CSWeaponID[iWeaponID + 1]

	if csWeaponID == "WEAPON_GLOCK" then
		if csWeaponMode ~= "Primary_Mode" then
			iDamage = 18
		end
	elseif csWeaponID == "WEAPON_USP" and csWeaponMode ~= "Primary_Mode" then
		iDamage = 30
	end

	return iDamage
end

-- Lines 963-1005
function AK47Fire(_fSpread, _pWeapon)
	local weapon = ToWeaponCSBaseGun(_pWeapon)

	if weapon ~= nil then
		if weapon:CSBaseGunFire(flSpread, _pWeapon:GetCSWpnData().m_flCycleTime, true) == false then
			return
		end

		local pPlayer = _pWeapon:GetPlayerOwner()

		if pPlayer == nil then
			return
		end

		if pPlayer:GetAbsVelocity():Length2D() > 5 then
			pPlayer:KickBack(1.5, 0.45, 0.225, 0.05, 6.5, 2.5, 7)
		elseif EventManager:HasFlag(pPlayer:GetFlags(), FL_ONGROUND) == false then
			pPlayer:KickBack(2, 1, 0.5, 0.35, 9, 6, 5)
		elseif EventManager:HasFlag(pPlayer:GetFlags(), FL_DUCKING) == true then
			pPlayer:KickBack(0.9, 0.35, 0.15, 0.025, 5.5, 1.5, 9)
		else
			pPlayer:KickBack(1, 0.375, 0.175, 0.0375, 5.75, 1.75, 8)
		end
	end
end

-- Lines 1011-1041
function AK47PrimaryAttack(_pWeapon)
	local pPlayer = _pWeapon:GetPlayerOwner()

	if pPlayer == nil then
		return
	end

	local fAccuracy = _pWeapon.m_flAccuracy

	if EventManager:HasFlag(pPlayer:GetFlags(), FL_ONGROUND) == false then
		AK47Fire(0.04 + 0.4 * fAccuracy, _pWeapon)
	elseif pPlayer:GetAbsVelocity():Length2D() > 140 then
		AK47Fire(0.002 + 0.07 * fAccuracy, _pWeapon)
	else
		AK47Fire(0.0275 * fAccuracy, _pWeapon)
	end
end

local cAWPMidZoomFOV = 40
local cAWPMaxZoomFOV = 10

-- Lines 1050-1092
function weapon_dummyFire(_fSpread, _pWeapon)
	local weapon = ToWeaponCSBaseGun(_pWeapon)

	if weapon ~= nil then
		if weapon:CSBaseGunFire(flSpread, _pWeapon:GetCSWpnData().m_flCycleTime, true) == false then
			return
		end

		local pPlayer = _pWeapon:GetPlayerOwner()

		if pPlayer == nil then
			return
		end

		if pPlayer:GetAbsVelocity():Length2D() > 5 then
			pPlayer:KickBack(1.5, 0.45, 0.225, 0.05, 6.5, 2.5, 7)
		elseif EventManager:HasFlag(pPlayer:GetFlags(), FL_ONGROUND) == false then
			pPlayer:KickBack(2, 1, 0.5, 0.35, 9, 6, 5)
		elseif EventManager:HasFlag(pPlayer:GetFlags(), FL_DUCKING) == true then
			pPlayer:KickBack(0.9, 0.35, 0.15, 0.025, 5.5, 1.5, 9)
		else
			pPlayer:KickBack(1, 0.375, 0.175, 0.0375, 5.75, 1.75, 8)
		end
	end
end

-- Lines 1096-1126
function weapon_dummyPrimaryAttack(_pWeapon)
	local pPlayer = _pWeapon:GetPlayerOwner()

	if pPlayer == nil then
		return
	end

	local fAccuracy = _pWeapon.m_flAccuracy

	if EventManager:HasFlag(pPlayer:GetFlags(), FL_ONGROUND) == false then
		weapon_dummyFire(0.04 + 0.4 * fAccuracy, _pWeapon)
	elseif pPlayer:GetAbsVelocity():Length2D() > 140 then
		weapon_dummyFire(0.04 + 0.07 * fAccuracy, _pWeapon)
	else
		weapon_dummyFire(0.0275 * fAccuracy, _pWeapon)
	end
end

local secondMode = "none"
local func = nil

-- Lines 1138-1182
local function funcSilencer(_pWeapon)
	if _pWeapon == nil then
		return
	end

	if _pWeapon:GetSilencer() == true then
		_pWeapon:SendWeaponAnim(211)
		_pWeapon:SetSilencer(false)

		secondMode = "silencer_off"
	else
		_pWeapon:SendWeaponAnim(210)
		_pWeapon:SetSilencer(true)

		secondMode = "silencer_on"
	end

	local fCurrTime = _pWeapon:GetGlobalCurrtime()

	_pWeapon:SetDoneSwitchingSilencer(fCurrTime + 3)
	_pWeapon:SetNextSecondaryAttack(fCurrTime + 3)
	_pWeapon:SetNextPrimaryAttack(fCurrTime + 3)
	_pWeapon:SetWeaponIdleTime(fCurrTime + 3)
	_pWeapon:SetWeaponModelIndex(_pWeapon:GetWorldModel())
end

-- Lines 1186-1260
local function funcZoom(_pWeapon)
	if _pWeapon == nil then
		return
	end

	local pPlayer = _pWeapon:GetPlayerOwner()

	if pPlayer == nil then
		return
	end

	if pPlayer:GetFOV() == pPlayer:GetDefaultFOV() then
		secondMode = "zoom1"

		pPlayer:SetFOV(pPlayer, cAWPMidZoomFOV, 0.15)
	elseif pPlayer:GetFOV() == cAWPMidZoomFOV then
		secondMode = "zoom2"

		pPlayer:SetFOV(pPlayer, cAWPMaxZoomFOV, 0.08)
	else
		secondMode = "zoom3"

		pPlayer:SetFOV(pPlayer, pPlayer:GetDefaultFOV(), 0.1)
	end

	pPlayer:EmitSound("Default.Zoom")

	local zoomEvent = CreateGameEvent("weapon_zoom")

	if zoomEvent ~= nil then
		zoomEvent:SetInt("userid", pPlayer:GetUserID())
		FireGameEvent(event)
	end

	local fCurrTime = _pWeapon:GetGlobalCurrtime()

	_pWeapon:SetDoneSwitchingSilencer(fCurrTime + 0.3)
	_pWeapon:SetNextSecondaryAttack(fCurrTime + 0.3)
	_pWeapon:SetNextPrimaryAttack(fCurrTime + 0.3)
	_pWeapon:SetWeaponIdleTime(fCurrTime + 0.3)
	_pWeapon:SetZoomFullyActiveTime(fCurrTime + 0.15)
end

-- Lines 1264-1306
local function funcBurst(_pWeapon)
	if _pWeapon == nil then
		return
	end

	local pPlayer = _pWeapon:GetPlayerOwner()

	if pPlayer == nil then
		return
	end

	if _pWeapon:GetBurstMode() == true then
		PrintCenter("#Switch_To_SemiAuto", pPlayer)
		_pWeapon:SetBurstMode(false)

		secondMode = "none"
	else
		PrintCenter("#Switch_To_BurstFire", pPlayer)
		_pWeapon:SetBurstMode(true)

		secondMode = "burst_on"
	end

	local fCurrTime = _pWeapon:GetGlobalCurrtime()

	_pWeapon:SetNextSecondaryAttack(fCurrTime + 0.3)
end

-- Lines 1310-1356
local function funcHalfZoom(_pWeapon)
	if _pWeapon == nil then
		return
	end

	local pPlayer = _pWeapon:GetPlayerOwner()

	if pPlayer == nil then
		return
	end

	if pPlayer:GetFOV() == pPlayer:GetDefaultFOV() then
		secondMode = "halfzoom1"

		pPlayer:SetFOV(pPlayer, 55, 0.2)
	elseif pPlayer:GetFOV() == 55 then
		secondMode = "halfzoom2"

		pPlayer:SetFOV(pPlayer, pPlayer:GetDefaultFOV(), 0.15)
	else
		secondMode = "halfzoom2"

		pPlayer:SetFOV(pPlayer, pPlayer:GetDefaultFOV())
	end

	local fCurrTime = _pWeapon:GetGlobalCurrtime()

	_pWeapon:SetNextSecondaryAttack(fCurrTime + 0.3)
end

-- Lines 1360-1384
function weapon_dummySecondaryAttack(_pWeapon)
	if secondMode == "none" or secondMode == "zoom1" or secondMode == "zoom2" then
		func = funcZoom
	elseif secondMode == "zoom3" or secondMode == "silencer_on" then
		func = funcSilencer
	elseif secondMode == "silencer_off" or secondMode == "halfzoom1" then
		func = funcHalfZoom
	else
		func = funcBurst
	end

	func(_pWeapon)
end

local cAWPMidZoomFOV = 40
local cAWPMaxZoomFOV = 10

-- Lines 1393-1435
function weapon_cso2Fire(_fSpread, _pWeapon)
	local weapon = ToWeaponCSBaseGun(_pWeapon)

	if weapon ~= nil then
		if weapon:CSBaseGunFire(flSpread, _pWeapon:GetCSWpnData().m_flCycleTime, true) == false then
			return
		end

		local pPlayer = _pWeapon:GetPlayerOwner()

		if pPlayer == nil then
			return
		end

		if pPlayer:GetAbsVelocity():Length2D() > 5 then
			pPlayer:KickBack(1.5, 0.45, 0.225, 0.05, 6.5, 2.5, 7)
		elseif EventManager:HasFlag(pPlayer:GetFlags(), FL_ONGROUND) == false then
			pPlayer:KickBack(2, 1, 0.5, 0.35, 9, 6, 5)
		elseif EventManager:HasFlag(pPlayer:GetFlags(), FL_DUCKING) == true then
			pPlayer:KickBack(0.9, 0.35, 0.15, 0.025, 5.5, 1.5, 9)
		else
			pPlayer:KickBack(1, 0.375, 0.175, 0.0375, 5.75, 1.75, 8)
		end
	end
end

-- Lines 1439-1469
function weapon_cso2PrimaryAttack(_pWeapon)
	local pPlayer = _pWeapon:GetPlayerOwner()

	if pPlayer == nil then
		return
	end

	local fAccuracy = _pWeapon.m_flAccuracy

	if EventManager:HasFlag(pPlayer:GetFlags(), FL_ONGROUND) == false then
		weapon_cso2Fire(0.04 + 0.4 * fAccuracy, _pWeapon)
	elseif pPlayer:GetAbsVelocity():Length2D() > 140 then
		weapon_cso2Fire(0.04 + 0.07 * fAccuracy, _pWeapon)
	else
		weapon_cso2Fire(0.0275 * fAccuracy, _pWeapon)
	end
end

local secondMode = "none"
local func = nil

-- Lines 1481-1525
local function funcSilencer(_pWeapon)
	if _pWeapon == nil then
		return
	end

	if _pWeapon:GetSilencer() == true then
		_pWeapon:SendWeaponAnim(211)
		_pWeapon:SetSilencer(false)

		secondMode = "silencer_off"
	else
		_pWeapon:SendWeaponAnim(210)
		_pWeapon:SetSilencer(true)

		secondMode = "silencer_on"
	end

	local fCurrTime = _pWeapon:GetGlobalCurrtime()

	_pWeapon:SetDoneSwitchingSilencer(fCurrTime + 3)
	_pWeapon:SetNextSecondaryAttack(fCurrTime + 3)
	_pWeapon:SetNextPrimaryAttack(fCurrTime + 3)
	_pWeapon:SetWeaponIdleTime(fCurrTime + 3)
	_pWeapon:SetWeaponModelIndex(_pWeapon:GetWorldModel())
end

-- Lines 1529-1603
local function funcZoom(_pWeapon)
	if _pWeapon == nil then
		return
	end

	local pPlayer = _pWeapon:GetPlayerOwner()

	if pPlayer == nil then
		return
	end

	if pPlayer:GetFOV() == pPlayer:GetDefaultFOV() then
		secondMode = "zoom1"

		pPlayer:SetFOV(pPlayer, cAWPMidZoomFOV, 0.15)
	elseif pPlayer:GetFOV() == cAWPMidZoomFOV then
		secondMode = "zoom2"

		pPlayer:SetFOV(pPlayer, cAWPMaxZoomFOV, 0.08)
	else
		secondMode = "zoom3"

		pPlayer:SetFOV(pPlayer, pPlayer:GetDefaultFOV(), 0.1)
	end

	pPlayer:EmitSound("Default.Zoom")

	local zoomEvent = CreateGameEvent("weapon_zoom")

	if zoomEvent ~= nil then
		zoomEvent:SetInt("userid", pPlayer:GetUserID())
		FireGameEvent(event)
	end

	local fCurrTime = _pWeapon:GetGlobalCurrtime()

	_pWeapon:SetDoneSwitchingSilencer(fCurrTime + 0.3)
	_pWeapon:SetNextSecondaryAttack(fCurrTime + 0.3)
	_pWeapon:SetNextPrimaryAttack(fCurrTime + 0.3)
	_pWeapon:SetWeaponIdleTime(fCurrTime + 0.3)
	_pWeapon:SetZoomFullyActiveTime(fCurrTime + 0.15)
end

-- Lines 1607-1649
local function funcBurst(_pWeapon)
	if _pWeapon == nil then
		return
	end

	local pPlayer = _pWeapon:GetPlayerOwner()

	if pPlayer == nil then
		return
	end

	if _pWeapon:GetBurstMode() == true then
		PrintCenter("#Switch_To_SemiAuto", pPlayer)
		_pWeapon:SetBurstMode(false)

		secondMode = "none"
	else
		PrintCenter("#Switch_To_BurstFire", pPlayer)
		_pWeapon:SetBurstMode(true)

		secondMode = "burst_on"
	end

	local fCurrTime = _pWeapon:GetGlobalCurrtime()

	_pWeapon:SetNextSecondaryAttack(fCurrTime + 0.3)
end

-- Lines 1653-1699
local function funcHalfZoom(_pWeapon)
	if _pWeapon == nil then
		return
	end

	local pPlayer = _pWeapon:GetPlayerOwner()

	if pPlayer == nil then
		return
	end

	if pPlayer:GetFOV() == pPlayer:GetDefaultFOV() then
		secondMode = "halfzoom1"

		pPlayer:SetFOV(pPlayer, 55, 0.2)
	elseif pPlayer:GetFOV() == 55 then
		secondMode = "halfzoom2"

		pPlayer:SetFOV(pPlayer, pPlayer:GetDefaultFOV(), 0.15)
	else
		secondMode = "halfzoom2"

		pPlayer:SetFOV(pPlayer, pPlayer:GetDefaultFOV())
	end

	local fCurrTime = _pWeapon:GetGlobalCurrtime()

	_pWeapon:SetNextSecondaryAttack(fCurrTime + 0.3)
end

-- Lines 1703-1727
function weapon_cso2SecondaryAttack(_pWeapon)
	if secondMode == "none" or secondMode == "zoom1" or secondMode == "zoom2" then
		func = funcZoom
	elseif secondMode == "zoom3" or secondMode == "silencer_on" then
		func = funcSilencer
	elseif secondMode == "silencer_off" or secondMode == "halfzoom1" then
		func = funcHalfZoom
	else
		func = funcBurst
	end

	func(_pWeapon)
end

local cAWPMidZoomFOV = 40
local cAWPMaxZoomFOV = 10

-- Lines 1736-1778
function weapon_mg3Fire(_fSpread, _pWeapon)
	local weapon = ToWeaponCSBaseGun(_pWeapon)

	if weapon ~= nil then
		if weapon:CSBaseGunFire(flSpread, _pWeapon:GetCSWpnData().m_flCycleTime, true) == false then
			return
		end

		local pPlayer = _pWeapon:GetPlayerOwner()

		if pPlayer == nil then
			return
		end

		if pPlayer:GetAbsVelocity():Length2D() > 5 then
			pPlayer:KickBack(1.5, 0.45, 0.225, 0.05, 6.5, 2.5, 7)
		elseif EventManager:HasFlag(pPlayer:GetFlags(), FL_ONGROUND) == false then
			pPlayer:KickBack(2, 1, 0.5, 0.35, 9, 6, 5)
		elseif EventManager:HasFlag(pPlayer:GetFlags(), FL_DUCKING) == true then
			pPlayer:KickBack(0.9, 0.35, 0.15, 0.025, 5.5, 1.5, 9)
		else
			pPlayer:KickBack(1, 0.375, 0.175, 0.0375, 5.75, 1.75, 8)
		end
	end
end

-- Lines 1782-1812
function weapon_mg3PrimaryAttack(_pWeapon)
	local pPlayer = _pWeapon:GetPlayerOwner()

	if pPlayer == nil then
		return
	end

	local fAccuracy = _pWeapon.m_flAccuracy

	if EventManager:HasFlag(pPlayer:GetFlags(), FL_ONGROUND) == false then
		weapon_mg3Fire(0.04 + 0.4 * fAccuracy, _pWeapon)
	elseif pPlayer:GetAbsVelocity():Length2D() > 140 then
		weapon_mg3Fire(0.04 + 0.07 * fAccuracy, _pWeapon)
	else
		weapon_mg3Fire(0.0275 * fAccuracy, _pWeapon)
	end
end

local secondMode = "none"
local func = nil

-- Lines 1824-1868
local function funcSilencer(_pWeapon)
	if _pWeapon == nil then
		return
	end

	if _pWeapon:GetSilencer() == true then
		_pWeapon:SendWeaponAnim(211)
		_pWeapon:SetSilencer(false)

		secondMode = "silencer_off"
	else
		_pWeapon:SendWeaponAnim(210)
		_pWeapon:SetSilencer(true)

		secondMode = "silencer_on"
	end

	local fCurrTime = _pWeapon:GetGlobalCurrtime()

	_pWeapon:SetDoneSwitchingSilencer(fCurrTime + 3)
	_pWeapon:SetNextSecondaryAttack(fCurrTime + 3)
	_pWeapon:SetNextPrimaryAttack(fCurrTime + 3)
	_pWeapon:SetWeaponIdleTime(fCurrTime + 3)
	_pWeapon:SetWeaponModelIndex(_pWeapon:GetWorldModel())
end

-- Lines 1872-1946
local function funcZoom(_pWeapon)
	if _pWeapon == nil then
		return
	end

	local pPlayer = _pWeapon:GetPlayerOwner()

	if pPlayer == nil then
		return
	end

	if pPlayer:GetFOV() == pPlayer:GetDefaultFOV() then
		secondMode = "zoom1"

		pPlayer:SetFOV(pPlayer, cAWPMidZoomFOV, 0.15)
	elseif pPlayer:GetFOV() == cAWPMidZoomFOV then
		secondMode = "zoom2"

		pPlayer:SetFOV(pPlayer, cAWPMaxZoomFOV, 0.08)
	else
		secondMode = "zoom3"

		pPlayer:SetFOV(pPlayer, pPlayer:GetDefaultFOV(), 0.1)
	end

	pPlayer:EmitSound("Default.Zoom")

	local zoomEvent = CreateGameEvent("weapon_zoom")

	if zoomEvent ~= nil then
		zoomEvent:SetInt("userid", pPlayer:GetUserID())
		FireGameEvent(event)
	end

	local fCurrTime = _pWeapon:GetGlobalCurrtime()

	_pWeapon:SetDoneSwitchingSilencer(fCurrTime + 0.3)
	_pWeapon:SetNextSecondaryAttack(fCurrTime + 0.3)
	_pWeapon:SetNextPrimaryAttack(fCurrTime + 0.3)
	_pWeapon:SetWeaponIdleTime(fCurrTime + 0.3)
	_pWeapon:SetZoomFullyActiveTime(fCurrTime + 0.15)
end

-- Lines 1950-1992
local function funcBurst(_pWeapon)
	if _pWeapon == nil then
		return
	end

	local pPlayer = _pWeapon:GetPlayerOwner()

	if pPlayer == nil then
		return
	end

	if _pWeapon:GetBurstMode() == true then
		PrintCenter("#Switch_To_SemiAuto", pPlayer)
		_pWeapon:SetBurstMode(false)

		secondMode = "none"
	else
		PrintCenter("#Switch_To_BurstFire", pPlayer)
		_pWeapon:SetBurstMode(true)

		secondMode = "burst_on"
	end

	local fCurrTime = _pWeapon:GetGlobalCurrtime()

	_pWeapon:SetNextSecondaryAttack(fCurrTime + 0.3)
end

-- Lines 1996-2042
local function funcHalfZoom(_pWeapon)
	if _pWeapon == nil then
		return
	end

	local pPlayer = _pWeapon:GetPlayerOwner()

	if pPlayer == nil then
		return
	end

	if pPlayer:GetFOV() == pPlayer:GetDefaultFOV() then
		secondMode = "halfzoom1"

		pPlayer:SetFOV(pPlayer, 55, 0.2)
	elseif pPlayer:GetFOV() == 55 then
		secondMode = "halfzoom2"

		pPlayer:SetFOV(pPlayer, pPlayer:GetDefaultFOV(), 0.15)
	else
		secondMode = "halfzoom2"

		pPlayer:SetFOV(pPlayer, pPlayer:GetDefaultFOV())
	end

	local fCurrTime = _pWeapon:GetGlobalCurrtime()

	_pWeapon:SetNextSecondaryAttack(fCurrTime + 0.3)
end

-- Lines 2046-2070
function weapon_mg3SecondaryAttack(_pWeapon)
	if secondMode == "none" or secondMode == "zoom1" or secondMode == "zoom2" then
		func = funcZoom
	elseif secondMode == "zoom3" or secondMode == "silencer_on" then
		func = funcSilencer
	elseif secondMode == "silencer_off" or secondMode == "halfzoom1" then
		func = funcHalfZoom
	else
		func = funcBurst
	end

	func(_pWeapon)
end

TEAM_TERRORIST = 2
TEAM_CT = 3
TEAM_NEUTRAL = 4
KM_NORMAL = 0
KM_HEADSHOT = 1
KM_FALL = 2
KM_INFECT = 3
KVT_HUMAN = 0
KVT_BOT = 1
KVT_ZOMBIE = 2
KVT_MOTHER_ZOMBIE = 3
KVT_PIG = 4
EGEP_HIGH = 0
EGEP_NORMAL = 1
EGEP_LOW = 2
MOVETYPE_NONE = 0
MOVETYPE_ISOMETRIC = 1
MOVETYPE_WALK = 2
MOVETYPE_STEP = 3
MOVETYPE_FLY = 4
MOVETYPE_FLYGRAVITY = 5
MOVETYPE_VPHYSICS = 6
MOVETYPE_PUSH = 7
MOVETYPE_NOCLIP = 8
MOVETYPE_LADDER = 9
MOVETYPE_OBSERVER = 10
MOVETYPE_CUSTOM = 11
MOVETYPE_STRATEGIC = 12
MOVETYPE_NOCLIP_ANOTHER = 13

SetMODVar("mp_aimhitsound_ongunfire", "1")
SetMODVar("mp_aimhitsound_ongunfire_behindwall", "1")
SetMODVar("mp_aimhitsound_onradiusdmg", "1")
SetMODVar("mp_aimhitsound_onradiusdmg_behindwall", "1")
EventManager:RegisterEventListener("cso2_game_start", "cso2_game_start_shared", EGEP_HIGH)

-- Lines 2175-2241
function cso2_game_start_shared(roundslimit, timelimit)
	t_highlight_rule = {
		[TEAM_OUTLINE_NONE] = {},
		[TEAM_OUTLINE_SAMETEAM_DEPTH] = {},
		[TEAM_OUTLINE_SAMETEAM_DEPTH_TERROR] = {},
		[TEAM_OUTLINE_SAMETEAM_DEPTH_CT] = {},
		[TEAM_OUTLINE_SAMETEAM_NODEPTH] = {},
		[TEAM_OUTLINE_SAMETEAM_NODEPTH_TERROR] = {
			4,
			30
		},
		[TEAM_OUTLINE_SAMETEAM_NODEPTH_CT] = {},
		[TEAM_OUTLINE_OTHERTEAM_DEPTH] = {},
		[TEAM_OUTLINE_ALL_DEPTH] = {},
		[TEAM_OUTLINE_SAMETEAM_NODEPTH_OTHERTEAM_DEPTH] = {
			58,
			59
		}
	}

	for i = 1, #t_highlight_rule do
		for k, v in pairs(t_highlight_rule[i]) do
			if v == GetLocalModID() then
				GetGameRules():SetTeamOutline(i, Color(120, 230, 120, 155), Color(140, 60, 60, 255))
			end
		end
	end
end

-- Lines 2253-2257
function send_player_assist()
end

-- Lines 2261-2265
function ModCommonInitDone()
end

EventManager:RegisterEventListener("compute_assist_point", "compute_assist_point", 2)

-- Lines 2274-2336
function compute_assist_point(userid, killerid)
	local victim = GetPlayerByUserId(userid)

	if victim == nil then
		return
	end

	local DamageTakenList = GetDamageTakenList(userid)

	for i, DamageRecord in pairs(DamageTakenList) do
		if killerid ~= DamageRecord:GetUserID() and userid ~= DamageRecord:GetUserID() then
			local gainpoint = 1
			local attacker = GetPlayerByUserId(DamageRecord:GetUserID())
			local damage = DamageRecord:GetDamage()
			local numhits = DamageRecord:GetNumHits()

			if attacker ~= nil and attacker:GetTeamNumber() ~= victim:GetTeamNumber() then
				attacker:IncrementAssistPoint(gainpoint)
			end
		end
	end
end

EventManager:RegisterEventListener("player_radio", "td_player_radio")
EventManager:RegisterEventListener("cso2_throw_grenade", "yell_throw_grenade")
EventManager:RegisterEventListener("weapon_reload", "yell_weapon_reload")
EventManager:RegisterEventListener("player_hurt", "td_player_hurt")
EventManager:RegisterEventListener("player_spawn", "yell_player_spawn")
EventManager:RegisterEventListener("player_blind", "yell_player_blind")
EventManager:RegisterEventListener("player_death", "yell_player_death")

-- Lines 2357-2373
function yell_player_death(userid, attacker, weapon, headshot, dominated, revenge, victimindex, attackerindex, killerweaponid, victimweaponid, falldown)
	local player = GetPlayerByUserId(attacker)

	if player ~= nil and headshot == 1 then
		player:EmitQueryEventSound("Male.KillSounding")
	end
end

-- Lines 2379-2395
function yell_player_blind(userid)
	local player = GetPlayerByUserId(userid)

	if player ~= nil then
		-- Nothing
	end
end

-- Lines 2399-2429
function yell_throw_grenade(userid, weapon)
	local player = GetPlayerByUserId(userid)
	local playerTeam = player:GetTeamNumber()

	if player ~= nil then
		if weapon == "flashbang" then
			player:EmitQueryEventSound("Male.Flashbang")
		elseif weapon == "smokegrenade" then
			player:EmitQueryEventSound("Male.SmokeGrenade")
		else
			player:EmitQueryEventSound("Male.Grenade")
		end
	end
end

-- Lines 2435-2455
function td_player_radio(userid, slot)
	local player = GetPlayerByUserId(userid)
	local playerTeam = player:GetTeamNumber()

	if player ~= nil then
		player:BroadcastQueryEventSound("Radio.Original." .. slot, playerTeam)
		player:EmitPrivateQueryEventSound("Radio.Original." .. slot .. "s")
	end
end

-- Lines 2461-2479
function yell_weapon_reload(userid)
	local player = GetPlayerByUserId(userid)
	local playerHealth = player:GetHealth()

	if player ~= nil and playerHealth < 50 then
		player:EmitQueryEventSound("Male.Reloading")
	end
end

-- Lines 2485-2487
function td_player_hurt(entindex, atk_entindex, health, armor, weapon, dmg_health, dmg_armor, hitgroup, attackdir)
end

-- Lines 2493-2509
function yell_player_spawn(userid)
	local player = GetPlayerByUserId(userid)

	if player ~= nil then
		-- Nothing
	end
end

-- Lines 2515-2531
function sniperHurt(userid)
	local player = GetPlayerByUserId(userid)

	if player ~= nil and player:IsAlive() == true then
		-- Nothing
	end
end

-- Lines 2552-2584
function weaponSetup_teamdeath_mutation()
	GetGameRules():SetEnableKnockback(true)
	SetWeaponKnockback("weapon_xm1014", 135, 80, 20, 2)
	SetWeaponKnockback("weapon_striker12", 135, 80, 20, 2)
	SetWeaponKnockback("weapon_m870", 135, 80, 20, 2)
	SetWeaponKnockback("weapon_dbarrel", 120, 60, 10, 2)
	SetWeaponKnockback("weapon_qbs09", 135, 80, 20, 2)
	SetWeaponKnockback("weapon_usas12", 135, 80, 20, 2)
	SetWeaponKnockback("weapon_dp12", 135, 80, 20, 2)
	SetWeaponKnockback("weapon_m3", 130, 70, 20, 2)
	SetWeaponKnockback("weapon_m3dragon", 130, 70, 20, 2)
end

-- Lines 2590-2594
function weaponSetup_hide2()
	SetMODVar("ammo_rpg_round", "3")
end

-- Lines 2600-2926
function weaponSetup_zombie_prop()
	SetMODVar("ammo_762mm_max", "300")
	SetMODVar("ammo_762mm_2_max", "400")
	SetMODVar("ammo_50AE_max", "300")
	SetMODVar("ammo_57mm_max", "300")
	SetMODVar("ammo_58mm_max", "300")
	SetMODVar("ammo_57mm_2_max", "300")
	SetMODVar("ammo_9mm_max", "300")
	SetMODVar("ammo_9mm_2_max", "300")
	SetMODVar("ammo_9mm_3_water_max", "600")
	SetMODVar("ammo_9mm_4_water_max", "600")
	SetMODVar("ammo_556mm_max", "300")
	SetMODVar("ammo_556mm_2_max", "400")
	SetMODVar("ammo_buckshot_max", "100")
	SetMODVar("ammo_buckshot_2_max", "100")
	SetMODVar("ammo_buckshot_3_max", "100")
	SetMODVar("ammo_buckshot_4_max", "100")
	SetMODVar("ammo_338mag_max", "100")
	SetMODVar("ammo_338mag_2_max", "150")
	SetMODVar("ammo_45acp_max", "300")
	SetMODVar("ammo_45acp_2_max", "300")
	SetMODVar("ammo_556mm_box_max", "400")
	SetMODVar("ammo_357sig_max", "300")
	SetMODVar("ammo_46mm_max", "300")
	SetMODVar("ammo_46mm_2_max", "300")
	SetMODVar("ammo_762mm_nato_max", "300")
	SetMODVar("ammo_50AE_2_max", "300")
	SetMODVar("ammo_380acp_max", "300")
	SetMODVar("ammo_762mm_box_max", "400")
	SetMODVar("ammo_50BMG_max", "100")
	SetMODVar("ammo_50BEOWULF_max", "300")
	SetMODVar("ammo_50RAILGUN_max", "100")
	GetGameRules():SetEnableKnockback(true)
	GetGameRules():SetKnockbackReduceRate(0.55)
	SetWeaponKnockback("weapon_awp", KNOCKBACK_S * 2250, KNOCKBACK_C * 1125, KNOCKBACK_J * 1575, 2, 2)
	SetWeaponKnockback("weapon_awm", KNOCKBACK_S * 2250, KNOCKBACK_C * 1125, KNOCKBACK_J * 1575, 2, 2)
	SetWeaponKnockback("weapon_awmgauss", KNOCKBACK_S * 2250, KNOCKBACK_C * 1125, KNOCKBACK_J * 1575, 2, 2)
	SetWeaponKnockback("weapon_cupidawp", KNOCKBACK_S * 2250, KNOCKBACK_C * 1125, KNOCKBACK_J * 1575, 2, 2)
	SetWeaponKnockback("weapon_awp_tan", KNOCKBACK_S * 2250, KNOCKBACK_C * 1125, KNOCKBACK_J * 1575, 2, 2)
	SetWeaponKnockback("weapon_scout", KNOCKBACK_S * 1875, KNOCKBACK_C * 937, KNOCKBACK_J * 1312, 2, 2)
	SetWeaponKnockback("weapon_g3sg1", KNOCKBACK_S * 420, KNOCKBACK_C * 210, KNOCKBACK_J * 294, 2, 2)
	SetWeaponKnockback("weapon_sg550", KNOCKBACK_S * 420, KNOCKBACK_C * 210, KNOCKBACK_J * 294, 2, 2)
	SetWeaponKnockback("weapon_trg42", KNOCKBACK_S * 2250, KNOCKBACK_C * 1125, KNOCKBACK_J * 1575, 2, 2)
	SetWeaponKnockback("weapon_m99", KNOCKBACK_S * 1875, KNOCKBACK_C * 937, KNOCKBACK_J * 1312, 2, 2)
	SetWeaponKnockback("weapon_m99railgun", KNOCKBACK_S * 1875, KNOCKBACK_C * 937, KNOCKBACK_J * 1312, 2, 2)
	SetWeaponKnockback("weapon_m99railgunplus", KNOCKBACK_S * 1875, KNOCKBACK_C * 937, KNOCKBACK_J * 1312, 2, 2)
	SetWeaponKnockback("weapon_m95", KNOCKBACK_S * 1875, KNOCKBACK_C * 937, KNOCKBACK_J * 1312, 2, 2)
	SetWeaponKnockback("weapon_m107a1", KNOCKBACK_S * 1875, KNOCKBACK_C * 937, KNOCKBACK_J * 1312, 2, 2)
	SetWeaponKnockback("weapon_galilsniper", KNOCKBACK_S * 420, KNOCKBACK_C * 210, KNOCKBACK_J * 294, 2, 2)
	SetWeaponKnockback("weapon_svd", KNOCKBACK_S * 1875, KNOCKBACK_C * 937, KNOCKBACK_J * 1312, 2, 2)
	SetWeaponKnockback("weapon_awmgaussplus", KNOCKBACK_S * 2250, KNOCKBACK_C * 1125, KNOCKBACK_J * 1575, 2, 2)
	SetWeaponKnockback("weapon_xm1014", KNOCKBACK_S * 62, KNOCKBACK_C * 31, KNOCKBACK_J * 62, 3, 3)
	SetWeaponKnockback("weapon_striker12", KNOCKBACK_S * 94, KNOCKBACK_C * 47, KNOCKBACK_J * 94, 3, 3)
	SetWeaponKnockback("weapon_m870", KNOCKBACK_S * 100, KNOCKBACK_C * 50, KNOCKBACK_J * 100, 3, 3)
	SetWeaponKnockback("weapon_m3", KNOCKBACK_S * 146, KNOCKBACK_C * 73, KNOCKBACK_J * 146, 3, 3)
	SetWeaponKnockback("weapon_m3dragon", KNOCKBACK_S * 146, KNOCKBACK_C * 73, KNOCKBACK_J * 146, 3, 3)
	SetWeaponKnockback("weapon_dbarrel", KNOCKBACK_S * 150, KNOCKBACK_C * 75, KNOCKBACK_J * 150, 3, 3)
	SetWeaponKnockback("weapon_qbs09", KNOCKBACK_S * 62, KNOCKBACK_C * 31, KNOCKBACK_J * 62, 3, 3)
	SetWeaponKnockback("weapon_usas12", KNOCKBACK_S * 62, KNOCKBACK_C * 31, KNOCKBACK_J * 62, 3, 3)
	SetWeaponKnockback("weapon_dp12", KNOCKBACK_S * 94, KNOCKBACK_C * 47, KNOCKBACK_J * 94, 3, 3)
	SetWeaponKnockback("weapon_triplebarrel", KNOCKBACK_S * 200, KNOCKBACK_C * 95, KNOCKBACK_J * 175, 3, 3)
	SetWeaponKnockback("weapon_m4a1", KNOCKBACK_S * 135, KNOCKBACK_C * 95, KNOCKBACK_J * 95, 2, 2)
	SetWeaponKnockback("weapon_ak47", KNOCKBACK_S * 150, KNOCKBACK_C * 105, KNOCKBACK_J * 105, 2, 2)
	SetWeaponKnockback("weapon_mk18", KNOCKBACK_S * 135, KNOCKBACK_C * 95, KNOCKBACK_J * 95, 2, 2)
	SetWeaponKnockback("weapon_mk18pulse", KNOCKBACK_S * 135, KNOCKBACK_C * 95, KNOCKBACK_J * 95, 2, 2)
	SetWeaponKnockback("weapon_akm", KNOCKBACK_S * 150, KNOCKBACK_C * 105, KNOCKBACK_J * 105, 2, 2)
	SetWeaponKnockback("weapon_m4a1flash", KNOCKBACK_S * 135, KNOCKBACK_C * 95, KNOCKBACK_J * 95, 2, 2)
	SetWeaponKnockback("weapon_ak47flash", KNOCKBACK_S * 150, KNOCKBACK_C * 105, KNOCKBACK_J * 105, 2, 2)
	SetWeaponKnockback("weapon_galil", KNOCKBACK_S * 135, KNOCKBACK_C * 95, KNOCKBACK_J * 95, 2, 2)
	SetWeaponKnockback("weapon_famas", KNOCKBACK_S * 135, KNOCKBACK_C * 95, KNOCKBACK_J * 95, 2, 2)
	SetWeaponKnockback("weapon_aug", KNOCKBACK_S * 135, KNOCKBACK_C * 95, KNOCKBACK_J * 95, 2, 2)
	SetWeaponKnockback("weapon_m16a4", KNOCKBACK_S * 135, KNOCKBACK_C * 95, KNOCKBACK_J * 95, 2, 2)
	SetWeaponKnockback("weapon_m16a2", KNOCKBACK_S * 135, KNOCKBACK_C * 95, KNOCKBACK_J * 95, 2, 2)
	SetWeaponKnockback("weapon_m16a4m203", KNOCKBACK_S * 135, KNOCKBACK_C * 95, KNOCKBACK_J * 95, 2, 2)
	SetWeaponKnockback_Transformed("weapon_m16a4m203", KNOCKBACK_S * 1875, KNOCKBACK_C * 937, KNOCKBACK_J * 1312, 2, 2)
	SetWeaponKnockback("weapon_sg552", KNOCKBACK_S * 135, KNOCKBACK_C * 95, KNOCKBACK_J * 95, 2, 2)
	SetWeaponKnockback("weapon_scarh", KNOCKBACK_S * 143, KNOCKBACK_C * 100, KNOCKBACK_J * 100, 2, 2)
	SetWeaponKnockback("weapon_dr200", KNOCKBACK_S * 146, KNOCKBACK_C * 102, KNOCKBACK_J * 102, 2, 2)
	SetWeaponKnockback("weapon_f2000", KNOCKBACK_S * 143, KNOCKBACK_C * 100, KNOCKBACK_J * 100, 2, 2)
	SetWeaponKnockback("weapon_fal", KNOCKBACK_S * 150, KNOCKBACK_C * 105, KNOCKBACK_J * 105, 2, 2)
	SetWeaponKnockback("weapon_fnc", KNOCKBACK_S * 146, KNOCKBACK_C * 102, KNOCKBACK_J * 102, 2, 2)
	SetWeaponKnockback("weapon_m4a1_gold", KNOCKBACK_S * 135, KNOCKBACK_C * 95, KNOCKBACK_J * 95, 2, 2)
	SetWeaponKnockback("weapon_ak47_gold", KNOCKBACK_S * 150, KNOCKBACK_C * 105, KNOCKBACK_J * 105, 2, 2)
	SetWeaponKnockback("weapon_mx4", KNOCKBACK_S * 120, KNOCKBACK_C * 84, KNOCKBACK_J * 84, 2, 2)
	SetWeaponKnockback("weapon_scarl", KNOCKBACK_S * 132, KNOCKBACK_C * 92, KNOCKBACK_J * 92, 2, 2)
	SetWeaponKnockback("weapon_aek971", KNOCKBACK_S * 149, KNOCKBACK_C * 104, KNOCKBACK_J * 104, 2, 2)
	SetWeaponKnockback("weapon_acr", KNOCKBACK_S * 132, KNOCKBACK_C * 92, KNOCKBACK_J * 92, 2, 2)
	SetWeaponKnockback("weapon_ak12", KNOCKBACK_S * 149, KNOCKBACK_C * 104, KNOCKBACK_J * 104, 2, 2)
	SetWeaponKnockback("weapon_t65", KNOCKBACK_S * 147, KNOCKBACK_C * 103, KNOCKBACK_J * 103, 2, 2)
	SetWeaponKnockback("weapon_t86", KNOCKBACK_S * 250, KNOCKBACK_C * 175, KNOCKBACK_J * 175, 2, 2)
	SetWeaponKnockback("weapon_m4a1_tan", KNOCKBACK_S * 135, KNOCKBACK_C * 95, KNOCKBACK_J * 95, 2, 2)
	SetWeaponKnockback("weapon_ak47_old", KNOCKBACK_S * 150, KNOCKBACK_C * 105, KNOCKBACK_J * 105, 2, 2)
	SetWeaponKnockback("weapon_g3ka4", KNOCKBACK_S * 170, KNOCKBACK_C * 115, KNOCKBACK_J * 104, 2, 2)
	SetWeaponKnockback("weapon_g36k", KNOCKBACK_S * 135, KNOCKBACK_C * 95, KNOCKBACK_J * 95, 2, 2)
	SetWeaponKnockback("weapon_k2c", KNOCKBACK_S * 135, KNOCKBACK_C * 95, KNOCKBACK_J * 95, 2, 2)
	SetWeaponKnockback("weapon_m1903a3", KNOCKBACK_S * 1875, KNOCKBACK_C * 937, KNOCKBACK_J * 1312, 2, 2)
	SetWeaponKnockback("weapon_m1garand", KNOCKBACK_S * 1575, KNOCKBACK_C * 637, KNOCKBACK_J * 1012, 2, 2)
	SetWeaponKnockback("weapon_msbs", KNOCKBACK_S * 135, KNOCKBACK_C * 95, KNOCKBACK_J * 95, 2, 2)
	SetWeaponKnockback("weapon_m14ebr", KNOCKBACK_S * 1575, KNOCKBACK_C * 637, KNOCKBACK_J * 1012, 2, 2)
	SetWeaponKnockback("weapon_lr300", KNOCKBACK_S * 135, KNOCKBACK_C * 95, KNOCKBACK_J * 95, 2, 2)
	SetWeaponKnockback("weapon_gilboasnake", KNOCKBACK_S * 135, KNOCKBACK_C * 95, KNOCKBACK_J * 95, 2, 2)
	SetWeaponKnockback("weapon_qbz95", KNOCKBACK_S * 135, KNOCKBACK_C * 95, KNOCKBACK_J * 95, 2, 2)
	SetWeaponKnockback("weapon_mosinnagant", KNOCKBACK_S * 1875, KNOCKBACK_C * 937, KNOCKBACK_J * 1312, 2, 2)
	SetWeaponKnockback("weapon_svt40", KNOCKBACK_S * 1575, KNOCKBACK_C * 637, KNOCKBACK_J * 1012, 2, 2)
	SetWeaponKnockback("weapon_xm8carbine", KNOCKBACK_S * 135, KNOCKBACK_C * 95, KNOCKBACK_J * 95, 2, 2)
	SetWeaponKnockback("weapon_beowulf", KNOCKBACK_S * 1575, KNOCKBACK_C * 637, KNOCKBACK_J * 1012, 2, 2)
	SetWeaponKnockback("weapon_t91", KNOCKBACK_S * 135, KNOCKBACK_C * 95, KNOCKBACK_J * 95, 2, 2)
	SetWeaponKnockback("weapon_xt97", KNOCKBACK_S * 135, KNOCKBACK_C * 95, KNOCKBACK_J * 95, 2, 2)
	SetWeaponKnockback("weapon_akmphoenix", KNOCKBACK_S * 150, KNOCKBACK_C * 105, KNOCKBACK_J * 105, 2, 2)
	SetWeaponKnockback("weapon_m249", KNOCKBACK_S * 143, KNOCKBACK_C * 71, KNOCKBACK_J * 71, 2, 2)
	SetWeaponKnockback("weapon_mg3", KNOCKBACK_S * 123, KNOCKBACK_C * 62, KNOCKBACK_J * 62, 2, 2)
	SetWeaponKnockback("weapon_m60", KNOCKBACK_S * 147, KNOCKBACK_C * 74, KNOCKBACK_J * 74, 2, 2)
	SetWeaponKnockback("weapon_PKM", KNOCKBACK_S * 180, KNOCKBACK_C * 90, KNOCKBACK_J * 90, 2, 2)
	SetWeaponKnockback("weapon_pkmfire", KNOCKBACK_S * 180, KNOCKBACK_C * 90, KNOCKBACK_J * 90, 2, 2)
	SetWeaponKnockback("weapon_M79", KNOCKBACK_S * 1875, KNOCKBACK_C * 937, KNOCKBACK_J * 1312, 2, 2)
	SetWeaponKnockback("weapon_M32", KNOCKBACK_S * 1875, KNOCKBACK_C * 937, KNOCKBACK_J * 1312, 2, 2)
	SetWeaponKnockback("weapon_chinalake", KNOCKBACK_S * 1875, KNOCKBACK_C * 937, KNOCKBACK_J * 1312, 2, 2)
	SetWeaponKnockback("weapon_paw20", KNOCKBACK_S * 1875, KNOCKBACK_C * 937, KNOCKBACK_J * 1312, 2, 2)
	SetWeaponKnockback("weapon_k12", KNOCKBACK_S * 147, KNOCKBACK_C * 74, KNOCKBACK_J * 74, 2, 2)
	SetWeaponKnockback("weapon_qjy88", KNOCKBACK_S * 143, KNOCKBACK_C * 71, KNOCKBACK_J * 71, 2, 2)
	SetWeaponKnockback("weapon_m27iar", KNOCKBACK_S * 143, KNOCKBACK_C * 71, KNOCKBACK_J * 71, 2, 2)
	SetWeaponKnockback("weapon_bar", KNOCKBACK_S * 147, KNOCKBACK_C * 74, KNOCKBACK_J * 74, 2, 2)
	SetWeaponKnockback("weapon_m60steam", KNOCKBACK_S * 147, KNOCKBACK_C * 74, KNOCKBACK_J * 74, 2, 2)
	SetWeaponKnockback("weapon_p90", KNOCKBACK_S * 105, KNOCKBACK_C * 105, KNOCKBACK_J * 105, 2, 1)
	SetWeaponKnockback("weapon_mac10", KNOCKBACK_S * 113, KNOCKBACK_C * 113, KNOCKBACK_J * 113, 2, 1)
	SetWeaponKnockback("weapon_ump45", KNOCKBACK_S * 158, KNOCKBACK_C * 158, KNOCKBACK_J * 158, 2, 1)
	SetWeaponKnockback("weapon_tmp", KNOCKBACK_S * 105, KNOCKBACK_C * 105, KNOCKBACK_J * 105, 2, 1)
	SetWeaponKnockback("weapon_mp7", KNOCKBACK_S * 120, KNOCKBACK_C * 120, KNOCKBACK_J * 120, 2, 1)
	SetWeaponKnockback("weapon_krisssuperv", KNOCKBACK_S * 150, KNOCKBACK_C * 150, KNOCKBACK_J * 150, 2, 1)
	SetWeaponKnockback("weapon_ar57", KNOCKBACK_S * 108, KNOCKBACK_C * 108, KNOCKBACK_J * 108, 2, 1)
	SetWeaponKnockback("weapon_csls06", KNOCKBACK_S * 105, KNOCKBACK_C * 105, KNOCKBACK_J * 105, 2, 1)
	SetWeaponKnockback("weapon_mp7phoenix", KNOCKBACK_S * 120, KNOCKBACK_C * 120, KNOCKBACK_J * 120, 2, 1)
	SetWeaponKnockback("weapon_k1", KNOCKBACK_S * 132, KNOCKBACK_C * 92, KNOCKBACK_J * 92, 2, 2)
	SetWeaponKnockback("weapon_hk416c", KNOCKBACK_S * 132, KNOCKBACK_C * 92, KNOCKBACK_J * 92, 2, 2)
	SetWeaponKnockback("weapon_tmpmelt", KNOCKBACK_S * 158, KNOCKBACK_C * 158, KNOCKBACK_J * 158, 2, 1)
	SetWeaponKnockback("weapon_m3grease", KNOCKBACK_S * 113, KNOCKBACK_C * 113, KNOCKBACK_J * 113, 2, 1)
	SetWeaponKnockback("weapon_thompson", KNOCKBACK_S * 113, KNOCKBACK_C * 113, KNOCKBACK_J * 113, 2, 1)
	SetWeaponKnockback("weapon_tmpmeltplus", KNOCKBACK_S * 158, KNOCKBACK_C * 158, KNOCKBACK_J * 158, 2, 1)
	SetWeaponKnockback("weapon_deagle", KNOCKBACK_S * 337, KNOCKBACK_C * 169, KNOCKBACK_J * 169, 2, 2)
	SetWeaponKnockback("weapon_p228", KNOCKBACK_S * 225, KNOCKBACK_C * 113, KNOCKBACK_J * 225, 2, 2)
	SetWeaponKnockback("weapon_k5", KNOCKBACK_S * 278, KNOCKBACK_C * 139, KNOCKBACK_J * 278, 2, 2)
	SetWeaponKnockback("weapon_glock", KNOCKBACK_S * 225, KNOCKBACK_C * 113, KNOCKBACK_J * 225, 2, 2)
	SetWeaponKnockback("weapon_elite", KNOCKBACK_S * 113, KNOCKBACK_C * 56, KNOCKBACK_J * 113, 2, 2)
	SetWeaponKnockback("weapon_fiveseven", KNOCKBACK_S * 225, KNOCKBACK_C * 113, KNOCKBACK_J * 225, 2, 2)
	SetWeaponKnockback("weapon_usp", KNOCKBACK_S * 225, KNOCKBACK_C * 113, KNOCKBACK_J * 225, 2, 2)
	SetWeaponKnockback("weapon_mk23", KNOCKBACK_S * 225, KNOCKBACK_C * 113, KNOCKBACK_J * 225, 2, 2)
	SetWeaponKnockback("weapon_anaconda", KNOCKBACK_S * 300, KNOCKBACK_C * 150, KNOCKBACK_J * 300, 2, 2)
	SetWeaponKnockback("weapon_waltherpp", KNOCKBACK_S * 225, KNOCKBACK_C * 113, KNOCKBACK_J * 225, 2, 2)
	SetWeaponKnockback("weapon_qsz92", KNOCKBACK_S * 278, KNOCKBACK_C * 139, KNOCKBACK_J * 278, 2, 2)
	SetWeaponKnockback("weapon_deaglephoenix", KNOCKBACK_S * 337, KNOCKBACK_C * 169, KNOCKBACK_J * 169, 2, 2)
	SetWeaponKnockback("weapon_m1911", KNOCKBACK_S * 225, KNOCKBACK_C * 113, KNOCKBACK_J * 225, 2, 2)
	SetWeaponKnockback("weapon_thunder", KNOCKBACK_S * 2250, KNOCKBACK_C * 1125, KNOCKBACK_J * 1575, 2, 2)
	SetWeaponKnockback("weapon_af2011a1", KNOCKBACK_S * 278, KNOCKBACK_C * 139, KNOCKBACK_J * 278, 2, 2)
end

-- Lines 2932-3282
function weaponSetup_zombie()
	SetMODVar("ammo_762mm_max", "300")
	SetMODVar("ammo_762mm_2_max", "400")
	SetMODVar("ammo_50AE_max", "300")
	SetMODVar("ammo_57mm_max", "300")
	SetMODVar("ammo_58mm_max", "300")
	SetMODVar("ammo_57mm_2_max", "300")
	SetMODVar("ammo_9mm_max", "300")
	SetMODVar("ammo_9mm_2_max", "300")
	SetMODVar("ammo_9mm_3_water_max", "400")
	SetMODVar("ammo_9mm_4_water_max", "400")
	SetMODVar("ammo_556mm_max", "300")
	SetMODVar("ammo_556mm_2_max", "400")
	SetMODVar("ammo_buckshot_max", "100")
	SetMODVar("ammo_buckshot_2_max", "100")
	SetMODVar("ammo_buckshot_3_max", "100")
	SetMODVar("ammo_buckshot_4_max", "100")
	SetMODVar("ammo_338mag_max", "100")
	SetMODVar("ammo_338mag_2_max", "150")
	SetMODVar("ammo_50BMG_max", "100")
	SetMODVar("ammo_45acp_max", "300")
	SetMODVar("ammo_45acp_2_max", "300")
	SetMODVar("ammo_556mm_box_max", "400")
	SetMODVar("ammo_357sig_max", "300")
	SetMODVar("ammo_46mm_max", "300")
	SetMODVar("ammo_46mm_2_max", "300")
	SetMODVar("ammo_762mm_nato_max", "300")
	SetMODVar("ammo_50AE_2_max", "300")
	SetMODVar("ammo_380acp_max", "300")
	SetMODVar("ammo_762mm_box_max", "400")
	SetMODVar("ammo_50BEOWULF_max", "300")
	SetMODVar("ammo_50RAILGUN_max", "100")
	GetGameRules():SetEnableKnockback(true)
	SetWeaponKnockback("weapon_awp", 800, 500, 600, 4, 1)
	SetWeaponKnockback("weapon_awm", 800, 500, 600, 4, 1)
	SetWeaponKnockback("weapon_awmgauss", 800, 500, 600, 4, 1)
	SetWeaponKnockback("weapon_cupidawp", 800, 500, 600, 4, 1)
	SetWeaponKnockback("weapon_awp_tan", 800, 500, 600, 4, 1)
	SetWeaponKnockback("weapon_trg42", 800, 500, 600, 4, 1)
	SetWeaponKnockback("weapon_m95", 800, 500, 600, 4, 1)
	SetWeaponKnockback("weapon_thunder", 800, 500, 600, 4, 1)
	SetWeaponKnockback("weapon_m99railgun", 800, 500, 600, 4, 1)
	SetWeaponKnockback("weapon_m99railgunplus", 800, 500, 600, 4, 1)
	SetWeaponKnockback("weapon_awmgaussplus", 800, 500, 600, 4, 1)
	SetWeaponKnockback("weapon_m79", 600, 300, 400, 4, 1)
	SetWeaponKnockback("weapon_chinalake", 600, 300, 400, 4, 1)
	SetWeaponKnockback("weapon_m99", 600, 300, 400, 4, 1)
	SetWeaponKnockback("weapon_m107a1", 600, 300, 400, 4, 1)
	SetWeaponKnockback("weapon_m32", 500, 250, 350, 3, 1)
	SetWeaponKnockback("weapon_paw20", 500, 250, 350, 3, 1)
	SetWeaponKnockback("weapon_deagle", 400, 250, 300, 1.5, 1)
	SetWeaponKnockback("weapon_scout", 400, 250, 300, 1.5, 1)
	SetWeaponKnockback("weapon_m1903a3", 400, 250, 300, 1.5, 1)
	SetWeaponKnockback("weapon_m1garand", 400, 250, 300, 1.5, 1)
	SetWeaponKnockback("weapon_m14ebr", 400, 250, 300, 1.5, 1)
	SetWeaponKnockback("weapon_deaglephoenix", 400, 250, 300, 1.5, 1)
	SetWeaponKnockback("weapon_triplebarrel", 120, 60, 10, 2)
	SetWeaponKnockback("weapon_mosinnagant", 400, 250, 300, 1.5, 1)
	SetWeaponKnockback("weapon_svt40", 400, 250, 300, 1.5, 1)
	SetWeaponKnockback("weapon_svd", 400, 250, 300, 1.5, 1)
	SetWeaponKnockback("weapon_beowulf", 400, 250, 300, 1.5, 1)
	SetWeaponKnockback("weapon_bar", 400, 250, 300, 1.5, 1)
	SetWeaponKnockback("weapon_xm1014", 135, 80, 20, 2)
	SetWeaponKnockback("weapon_striker12", 135, 80, 20, 2)
	SetWeaponKnockback("weapon_m870", 135, 80, 20, 2)
	SetWeaponKnockback("weapon_dbarrel", 120, 60, 10, 2)
	SetWeaponKnockback("weapon_qbs09", 135, 80, 20, 2)
	SetWeaponKnockback("weapon_usas12", 135, 80, 20, 2)
	SetWeaponKnockback("weapon_dp12", 135, 80, 20, 2)
	SetWeaponKnockback("weapon_m3", 130, 70, 20, 2)
	SetWeaponKnockback("weapon_m3dragon", 130, 70, 20, 2)
	SetWeaponKnockback("weapon_g3sg1", 250, 100, 100, 1.5, 1.5)
	SetWeaponKnockback("weapon_sg550", 250, 100, 100, 1.5, 1.5)
	SetWeaponKnockback("weapon_g3ka4", 250, 100, 100, 1.5, 1.5)
	SetWeaponKnockback("weapon_galilsniper", 250, 100, 100, 1.5, 1.5)
	SetWeaponKnockback("weapon_m4a1", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_ak47", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_mk18", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_akm", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_m4a1flash", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_ak47flash", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_galil", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_famas", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_aug", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_sg552", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_scarh", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_dr200", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_f2000", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_m16a4", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_m16a4m203", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback_Transformed("weapon_m16a4m203", 600, 300, 400, 4, 1)
	SetWeaponKnockback("weapon_m16a2", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_fal", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_fnc", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_m4a1_gold", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_ak47_gold", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_mx4", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_scarl", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_aek971", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_acr", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_ak12", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_t65", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_t86", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_m4a1_tan", 300, 150, 120, 1.3, 1)
	SetWeaponKnockback("weapon_ak47_old", 300, 150, 120, 1.3, 1)
	SetWeaponKnockback("weapon_k1", 300, 150, 120, 1.3, 1)
	SetWeaponKnockback("weapon_g3ka4", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_g36k", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_k2c", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_msbs", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_lr300", 325, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_k12", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_gilboasnake", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_qbz95", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_xm8carbine", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_hk416c", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_t91", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_xt97", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_akmphoenix", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_mk18pulse", 300, 150, 150, 1.3, 1)
	SetWeaponKnockback("weapon_m249", 150, 100, 120, 1, 2)
	SetWeaponKnockback("weapon_m60", 150, 100, 120, 1, 2)
	SetWeaponKnockback("weapon_PKM", 150, 100, 120, 1, 2)
	SetWeaponKnockback("weapon_PKMFIRE", 150, 100, 120, 1, 2)
	SetWeaponKnockback("weapon_MG3", 150, 100, 120, 1, 2)
	SetWeaponKnockback("weapon_qjy88", 150, 100, 120, 1, 2)
	SetWeaponKnockback("weapon_m27iar", 150, 100, 120, 1, 2)
	SetWeaponKnockback("weapon_tmpmelt", 150, 100, 120, 1, 2)
	SetWeaponKnockback("weapon_tmpmeltplus", 150, 100, 120, 1, 2)
	SetWeaponKnockback("weapon_m60steam", 150, 100, 120, 1, 2)
	SetWeaponKnockback("weapon_p90", 150, 100, 120, 1.2, 1)
	SetWeaponKnockback("weapon_mac10", 150, 100, 120, 1.2, 1)
	SetWeaponKnockback("weapon_ump45", 150, 100, 120, 1.2, 1)
	SetWeaponKnockback("weapon_tmp", 150, 100, 120, 1.2, 1)
	SetWeaponKnockback("weapon_mp7", 150, 100, 120, 1.2, 1)
	SetWeaponKnockback("weapon_krisssuperv", 150, 100, 120, 1.2, 1)
	SetWeaponKnockback("weapon_ar57", 150, 100, 120, 1.2, 1)
	SetWeaponKnockback("weapon_csls06", 150, 100, 120, 1.2, 1)
	SetWeaponKnockback("weapon_mp7phoenix", 150, 100, 120, 1.2, 1)
	SetWeaponKnockback("weapon_mp5navy", 150, 100, 120, 1.2, 1)
	SetWeaponKnockback("weapon_mx4", 150, 100, 120, 1.2, 1)
	SetWeaponKnockback("weapon_m3grease", 150, 100, 120, 1.2, 1)
	SetWeaponKnockback("weapon_thompson", 150, 100, 120, 1.2, 1)
	SetWeaponKnockback("weapon_p228", 130, 100, 100, 0.5, 0.5)
	SetWeaponKnockback("weapon_k5", 130, 100, 100, 0.5, 0.5)
	SetWeaponKnockback("weapon_glock", 130, 100, 100, 0.5, 0.5)
	SetWeaponKnockback("weapon_elite", 130, 100, 100, 0.5, 0.5)
	SetWeaponKnockback("weapon_fiveseven", 130, 100, 100, 0.5, 0.5)
	SetWeaponKnockback("weapon_usp", 130, 100, 100, 0.5, 0.5)
	SetWeaponKnockback("weapon_mk23", 130, 100, 100, 0.5, 0.5)
	SetWeaponKnockback("weapon_anaconda", 600, 250, 300, 1.5, 1)
	SetWeaponKnockback("weapon_waltherpp", 130, 100, 100, 0.5, 0.5)
	SetWeaponKnockback("weapon_qsz92", 130, 100, 100, 0.5, 0.5)
	SetWeaponKnockback("weapon_m1911", 130, 100, 100, 0.5, 0.5)
	SetWeaponKnockback("weapon_af2011a1", 130, 100, 100, 0.5, 0.5)
end

-- Lines 3288-3292
function weaponSetup_ghost()
	weaponSetup_zombie()
end

-- Lines 3298-3604
function weaponSetup_pig()
	SetMODVar("ammo_762mm_max", "400")
	SetMODVar("ammo_762mm_2_max", "400")
	SetMODVar("ammo_50AE_max", "400")
	SetMODVar("ammo_57mm_max", "400")
	SetMODVar("ammo_58mm_max", "400")
	SetMODVar("ammo_57mm_2_max", "400")
	SetMODVar("ammo_9mm_max", "400")
	SetMODVar("ammo_9mm_2_max", "400")
	SetMODVar("ammo_556mm_max", "400")
	SetMODVar("ammo_556mm_2_max", "400")
	SetMODVar("ammo_buckshot_max", "200")
	SetMODVar("ammo_buckshot_2_max", "200")
	SetMODVar("ammo_buckshot_3_max", "200")
	SetMODVar("ammo_buckshot_4_max", "200")
	SetMODVar("ammo_338mag_max", "200")
	SetMODVar("ammo_338mag_2_max", "200")
	SetMODVar("ammo_50BMG_max", "200")
	SetMODVar("ammo_45acp_max", "400")
	SetMODVar("ammo_45acp_2_max", "400")
	SetMODVar("ammo_556mm_box_max", "600")
	SetMODVar("ammo_357sig_max", "400")
	SetMODVar("ammo_46mm_max", "400")
	SetMODVar("ammo_46mm_2_max", "400")
	SetMODVar("ammo_762mm_nato_max", "400")
	SetMODVar("ammo_50AE_2_max", "400")
	SetMODVar("ammo_380acp_max", "400")
	SetMODVar("ammo_762mm_box_max", "600")
	SetMODVar("ammo_50BEOWULF_max", "400")
	SetMODVar("ammo_50RAILGUN_max", "200")
	SetWeaponKnockback("weapon_elite", 100, 100, 100, 0.4, 1.5)
	SetWeaponKnockback("weapon_fiveseven", 100, 100, 100, 0.4, 1.5)
	SetWeaponKnockback("weapon_deagle", 150, 100, 150, 0.4, 1.5)
	SetWeaponKnockback("weapon_glock", 80, 80, 80, 0.4, 1.5)
	SetWeaponKnockback("weapon_p228", 100, 100, 100, 0.4, 1.5)
	SetWeaponKnockback("weapon_usp", 100, 100, 100, 0.4, 1.5)
	SetWeaponKnockback("weapon_k5", 100, 100, 100, 0.4, 1.5)
	SetWeaponKnockback("weapon_mk23", 100, 100, 100, 0.4, 1.5)
	SetWeaponKnockback("weapon_qsz92", 100, 100, 100, 0.4, 1.5)
	SetWeaponKnockback("weapon_m1911", 100, 100, 100, 0.4, 1.5)
	SetWeaponKnockback("weapon_anaconda", 150, 100, 150, 0.8, 1.5)
	SetWeaponKnockback("weapon_waltherpp", 100, 100, 100, 0.8, 1.5)
	SetWeaponKnockback("weapon_deaglephoenix", 150, 100, 150, 0.4, 1.5)
	SetWeaponKnockback("weapon_thunder", 400, 400, 400, 4, 5)
	SetWeaponKnockback("weapon_af2011a1", 100, 100, 100, 0.4, 1.5)
	SetWeaponKnockback("weapon_beowulf", 150, 100, 150, 0.4, 1.5)
	SetWeaponKnockback("weapon_p90", 50, 50, 50, 0.6, 1.2)
	SetWeaponKnockback("weapon_ump45", 50, 50, 50, 0.6, 1.2)
	SetWeaponKnockback("weapon_tmp", 50, 50, 50, 0.6, 1.2)
	SetWeaponKnockback("weapon_mp5navy", 50, 50, 50, 0.6, 1.2)
	SetWeaponKnockback("weapon_mac10", 50, 50, 50, 0.6, 1.2)
	SetWeaponKnockback("weapon_mp7", 50, 50, 50, 0.6, 1.2)
	SetWeaponKnockback("weapon_krisssuperv", 50, 50, 50, 0.6, 1.2)
	SetWeaponKnockback("weapon_k1", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_csls06", 50, 50, 50, 0.6, 1.2)
	SetWeaponKnockback("weapon_mp7phoenix", 50, 50, 50, 0.6, 1.2)
	SetWeaponKnockback("weapon_hk416c", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_m4a1", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_ak47", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_mk18", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_akm", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_m4a1flash", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_ak47flash", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_aug", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_m16a4", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_m16a4m203", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback_Transformed("weapon_m16a4m203", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_m16a2", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_sg552", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_galil", 100, 100, 100, 0.6, 1.5)
	SetWeaponKnockback("weapon_famas", 100, 100, 100, 0.6, 1.5)
	SetWeaponKnockback("weapon_scarh", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_dr200", 100, 100, 100, 0.6, 1.5)
	SetWeaponKnockback("weapon_f2000", 100, 100, 100, 0.6, 1.5)
	SetWeaponKnockback("weapon_fal", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_fnc", 100, 100, 100, 0.6, 1.5)
	SetWeaponKnockback("weapon_ak47_gold", 50, 50, 50, 0.8, 1.5)
	SetWeaponKnockback("weapon_m4a1_gold", 50, 50, 50, 0.8, 1.5)
	SetWeaponKnockback("weapon_mx4", 50, 50, 50, 0.8, 1.5)
	SetWeaponKnockback("weapon_scarl", 50, 50, 50, 0.8, 1.5)
	SetWeaponKnockback("weapon_aek971", 50, 50, 50, 0.8, 1.5)
	SetWeaponKnockback("weapon_acr", 50, 50, 50, 0.8, 1.5)
	SetWeaponKnockback("weapon_ak12", 50, 50, 50, 0.8, 1.5)
	SetWeaponKnockback("weapon_t65", 50, 50, 50, 0.8, 1.5)
	SetWeaponKnockback("weapon_t86", 50, 50, 50, 0.8, 1.5)
	SetWeaponKnockback("weapon_ak47_old", 50, 50, 50, 0.8, 1.5)
	SetWeaponKnockback("weapon_m4a1_tan", 50, 50, 50, 0.8, 1.5)
	SetWeaponKnockback("weapon_ar57", 100, 100, 100, 0.6, 1.5)
	SetWeaponKnockback("weapon_g3ka4", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_g36k", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_k2c", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_m1903a3", 300, 300, 300, 3, 4)
	SetWeaponKnockback("weapon_m1garand", 300, 300, 300, 3, 4)
	SetWeaponKnockback("weapon_msbs", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_m14ebr", 300, 300, 300, 3, 4)
	SetWeaponKnockback("weapon_lr300", 100, 100, 100, 0.6, 1.5)
	SetWeaponKnockback("weapon_gilboasnake", 50, 50, 50, 0.8, 1.5)
	SetWeaponKnockback("weapon_qbz95", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_mosinnagant", 300, 300, 300, 3, 4)
	SetWeaponKnockback("weapon_svt40", 300, 300, 300, 3, 4)
	SetWeaponKnockback("weapon_xm8carbine", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_svd", 300, 300, 300, 3, 4)
	SetWeaponKnockback("weapon_t91", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_xt97", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_akmphoenix", 50, 50, 50, 0.6, 1.5)
	SetWeaponKnockback("weapon_xm1014", 30, 30, 30, 1, 1.5)
	SetWeaponKnockback("weapon_m3", 30, 100, 30, 1, 1.5)
	SetWeaponKnockback("weapon_m3dragon", 30, 100, 30, 1, 1.5)
	SetWeaponKnockback("weapon_striker12", 30, 30, 30, 1, 1.5)
	SetWeaponKnockback("weapon_m870", 30, 30, 30, 1, 1.5)
	SetWeaponKnockback("weapon_dbarrel", 27, 27, 27, 1, 1.5)
	SetWeaponKnockback("weapon_qbs09", 30, 30, 30, 1, 1.5)
	SetWeaponKnockback("weapon_usas12", 30, 30, 30, 1, 1.5)
	SetWeaponKnockback("weapon_dp12", 30, 30, 30, 1, 1.5)
	SetWeaponKnockback("weapon_triplebarrel", 30, 30, 30, 1, 1.5)
	SetWeaponKnockback("weapon_awp", 400, 400, 400, 4, 5)
	SetWeaponKnockback("weapon_awm", 400, 400, 400, 4, 5)
	SetWeaponKnockback("weapon_awmgauss", 400, 400, 400, 4, 5)
	SetWeaponKnockback("weapon_g3sg1", 50, 50, 50, 3, 3)
	SetWeaponKnockback("weapon_scout", 300, 300, 300, 3, 4)
	SetWeaponKnockback("weapon_sg550", 150, 100, 150, 1, 2)
	SetWeaponKnockback("weapon_trg42", 400, 400, 400, 4, 5)
	SetWeaponKnockback("weapon_awmgaussplus", 400, 400, 400, 4, 5)
	SetWeaponKnockback("weapon_cupidawp", 400, 400, 400, 4, 5)
	SetWeaponKnockback("weapon_awp_tan", 400, 400, 400, 4, 5)
	SetWeaponKnockback("weapon_galilsniper", 50, 50, 50, 3, 3)
	SetWeaponKnockback("weapon_m249", 50, 50, 50, 0.8, 1.5)
	SetWeaponKnockback("weapon_m60", 50, 50, 50, 0.8, 1.5)
	SetWeaponKnockback("weapon_pkm", 50, 50, 50, 0.8, 1.5)
	SetWeaponKnockback("weapon_pkmfire", 50, 50, 50, 0.8, 1.5)
	SetWeaponKnockback("weapon_mg3", 50, 50, 50, 0.8, 1.5)
	SetWeaponKnockback("weapon_k12", 50, 50, 50, 0.8, 1.5)
	SetWeaponKnockback("weapon_qjy88", 50, 50, 50, 0.8, 1.5)
	SetWeaponKnockback("weapon_m27iar", 50, 50, 50, 0.8, 1.5)
	SetWeaponKnockback("weapon_m60steam", 50, 50, 50, 0.8, 1.5)
end

-- Lines 3610-3614
function weaponSetup_eventmod01()
	weaponSetup_pig()
end

-- Lines 3620-3690
function weaponSetup_gz_pve()
	SetMODVar("ammo_762mm_max", "400")
	SetMODVar("ammo_762mm_2_max", "600")
	SetMODVar("ammo_762mm_nato_max", "400")
	SetMODVar("ammo_50AE_max", "400")
	SetMODVar("ammo_57mm_max", "400")
	SetMODVar("ammo_57mm_2_max", "400")
	SetMODVar("ammo_9mm_max", "400")
	SetMODVar("ammo_9mm_2_max", "400")
	SetMODVar("ammo_9mm_3_water_max", "600")
	SetMODVar("ammo_9mm_4_water_max", "600")
	SetMODVar("ammo_556mm_max", "400")
	SetMODVar("ammo_556mm_2_max", "600")
	SetMODVar("ammo_buckshot_max", "200")
	SetMODVar("ammo_buckshot_2_max", "200")
	SetMODVar("ammo_buckshot_3_max", "200")
	SetMODVar("ammo_buckshot_4_max", "200")
	SetMODVar("ammo_338mag_max", "200")
	SetMODVar("ammo_338mag_2_max", "200")
	SetMODVar("ammo_357sig_max", "260")
	SetMODVar("ammo_45acp_max", "400")
	SetMODVar("ammo_45acp_2_max", "400")
	SetMODVar("ammo_556mm_box_max", "600")
	SetMODVar("ammo_357sig_max", "400")
	SetMODVar("ammo_46mm_max", "400")
	SetMODVar("ammo_762mm_nato_max", "400")
	SetMODVar("ammo_50AE_2_max", "400")
	SetMODVar("ammo_380acp_max", "400")
	SetMODVar("ammo_762mm_box_max", "600")
	SetMODVar("ammo_40mm_gren_max", "200")
	SetMODVar("ammo_20mm_gren_max", "300")
	SetMODVar("ammo_50BMG_max", "200")
	SetMODVar("ammo_50BEOWULF_max", "400")
	SetMODVar("ammo_50RAILGUN_max", "200")
end

-- Lines 3696-3764
function weaponSetup_z_scenario()
	SetMODVar("ammo_762mm_max", "270")
	SetMODVar("ammo_762mm_2_max", "400")
	SetMODVar("ammo_50AE_max", "280")
	SetMODVar("ammo_57mm_max", "250")
	SetMODVar("ammo_57mm_2_max", "260")
	SetMODVar("ammo_9mm_max", "270")
	SetMODVar("ammo_9mm_2_max", "260")
	SetMODVar("ammo_9mm_3_water_max", "500")
	SetMODVar("ammo_9mm_4_water_max", "500")
	SetMODVar("ammo_556mm_max", "270")
	SetMODVar("ammo_556mm_2_max", "400")
	SetMODVar("ammo_buckshot_max", "130")
	SetMODVar("ammo_buckshot_2_max", "120")
	SetMODVar("ammo_buckshot_3_max", "180")
	SetMODVar("ammo_buckshot_4_max", "200")
	SetMODVar("ammo_338mag_max", "130")
	SetMODVar("ammo_338mag_2_max", "260")
	SetMODVar("ammo_45acp_max", "250")
	SetMODVar("ammo_45acp_2_max", "240")
	SetMODVar("ammo_556mm_box_max", "400")
	SetMODVar("ammo_357sig_max", "260")
	SetMODVar("ammo_46mm_max", "280")
	SetMODVar("ammo_762mm_nato_max", "260")
	SetMODVar("ammo_50AE_2_max", "240")
	SetMODVar("ammo_380acp_max", "280")
	SetMODVar("ammo_762mm_box_max", "400")
	SetMODVar("ammo_46mm_2_max", "400")
	SetMODVar("ammo_40mm_gren_max", "120")
	SetMODVar("ammo_20mm_gren_max", "240")
	SetMODVar("ammo_50BMG_max", "100")
	SetMODVar("ammo_50BEOWULF_max", "280")
	SetMODVar("ammo_50RAILGUN_max", "150")
end

-- Lines 3770-3774
function weaponSetup_endless_wave()
	weaponSetup_z_scenario()
end

-- Lines 3780-3842
function weaponSetup_practice()
	SetMODVar("ammo_762mm_max", "999")
	SetMODVar("ammo_762mm_2_max", "999")
	SetMODVar("ammo_50AE_max", "999")
	SetMODVar("ammo_57mm_max", "999")
	SetMODVar("ammo_58mm_max", "999")
	SetMODVar("ammo_57mm_2_max", "999")
	SetMODVar("ammo_9mm_max", "999")
	SetMODVar("ammo_9mm_2_max", "999")
	SetMODVar("ammo_9mm_3_water_max", "999")
	SetMODVar("ammo_9mm_4_water_max", "999")
	SetMODVar("ammo_556mm_max", "999")
	SetMODVar("ammo_556mm_2_max", "999")
	SetMODVar("ammo_buckshot_max", "999")
	SetMODVar("ammo_buckshot_2_max", "999")
	SetMODVar("ammo_buckshot_3_max", "999")
	SetMODVar("ammo_buckshot_4_max", "999")
	SetMODVar("ammo_338mag_max", "999")
	SetMODVar("ammo_338mag_2_max", "999")
	SetMODVar("ammo_45acp_max", "999")
	SetMODVar("ammo_45acp_2_max", "999")
	SetMODVar("ammo_556mm_box_max", "999")
	SetMODVar("ammo_357sig_max", "999")
	SetMODVar("ammo_46mm_max", "999")
	SetMODVar("ammo_46mm_2_max", "999")
	SetMODVar("ammo_762mm_nato_max", "999")
	SetMODVar("ammo_50AE_2_max", "999")
	SetMODVar("ammo_380acp_max", "999")
	SetMODVar("ammo_762mm_box_max", "999")
	SetMODVar("ammo_50AE_max", "999")
end

EventManager:RegisterEventListener("player_disconnected", "player_disconnected")
EventManager:RegisterEventListener("cso2_round_end", "cso2_round_end")
EventManager:RegisterEventListener("player_death", "player_death")
EventManager:RegisterEventListener("cso2_round_timeout", "cso2_round_timeout")
EventManager:RegisterEventListener("post_player_spawn", "post_player_spawn")
EventManager:RegisterEventListener("player_hurt", "player_hurt")
EventManager:RegisterEventListener("player_connected", "player_connected")
EventManager:RegisterEventListener("cso2_round_start", "cso2_round_start")
EventManager:RegisterEventListener("cso2_game_start", "cso2_game_start")
EventManager:RegisterEventListener("cso2_round_remain_time", "cso2_round_remain_time")
EventManager:RegisterHostCrashFunction("OnSave", "OnRestore", "OnPostRestore")
IgnoreEntity("hostage_entity")
IgnoreEntity("func_buyzone")
IgnoreEntity("func_bomb_target")
IgnoreEntity("func_hostage_rescue")
IgnoreEntity("env_sun")
SetMODVar("mp_limitteam", "0")
SetMODVar("mp_buy_ignore_team_check", "1")

maxPlayerCount = 0
Gamestate = 0
gcount = 30
count = 30
ZOMBIE_SCORE = 0
HUMAN_SCORE = 0
NORMALZOMBIE = 1
NORMALZOMBIE_F = 2
HOSTZOMBIE = 3
HOSTZOMBIE_F = 4
HOST = 1
CLIENT = 2
ZOMBIE_MINHEALTH = 1000
ZOMBIEWALL_COUNT = 10
ZOMBIEDAMAGEMULTIPLIER = 5
ZOMBIE_HPREGEN_ENABLE = 1
ZOMBIE_HPREGEN_TERM = 1
ZOMBIE_HPREGEN_AMOUNT = 100
ZOMBIE_HPREGEN_BESHOTDELAY = 5
ZOMBIE_NPC_ENABLE = 1
ZOMBIE_NPC_COUNT = 10

-- Lines 3997-4039
function cso2_round_remain_time(remain_second)
	if Gamestate ~= 0 then
		if remain_second == 120 then
			GetGameRules():BroadcastSound("Count.2min", -1)
		elseif remain_second == 60 then
			GetGameRules():BroadcastSound("Count.60sec", -1)
		elseif remain_second == 30 then
			GetGameRules():BroadcastSound("Count.30sec", -1)
		elseif remain_second == 20 then
			GetGameRules():BroadcastSound("Count.20sec", -1)
		elseif remain_second == 12 then
			GetGameRules():BroadcastSound("Count.10sec", -1)
		elseif remain_second >= 1 and remain_second < 10 then
			local countStr = "Count." .. remain_second .. "sec"

			GetGameRules():BroadcastSound(countStr, -1)
		end
	end

	if remain_second >= 1 and remain_second < 30 then
		GetGameRules():BroadcastSound("Zombie.Clock", -1)
	end
end

-- Lines 4043-4057
function playerallkill(arg)
	local PlayerData = GetActivePlayerList()

	for name, player in pairs(PlayerData) do
		player:ChangeTeam(3)
		player:ForceRespawn()
	end
end

-- Lines 4061-4073
function playerall_buyzone_diable(arg)
	local PlayerData = GetActivePlayerList()

	for name, player in pairs(PlayerData) do
		player:RemoveUserFlag(CSO2_FLAG_ALWAYS_BUYZONE)
	end
end

-- Lines 4077-4127
function InitModVars()
	GetGameRules():SetTimeoutNotify(1)
	GetGameRules():SetFreezeTime(0)
	SetKnifeDistance("weapon_knife", 2, 32, 28, true)
	weaponSetup_zombie()
	PrecacheModel("models/npc/npc_h_zombie_wall/zombie_wall_01.mdl")
	PrecacheModel("models/npc/npc_a_zombie_normal_m/npc_a_zombie_normal_m_04.mdl")
	PrecacheModel("models/npc/npc_a_zombie_normal_m/npc_a_zombie_normal_m_01.mdl")
	PrecacheModel("models/zombie/normal/zombie_normal.mdl")
	PrecacheModel("models/zombie/normal/hand/hand_zombie_normal.mdl")
	PrecacheModel("models/zombie/normalhost/zombie_normalhost.mdl")
	PrecacheModel("models/zombie/normalhost/hand/hand_zombie_normalhost.mdl")
	PrecacheModel("models/zombie/normal_f/zombie_normal_f.mdl")
	PrecacheModel("models/zombie/normal_f/hand/hand_zombie_normal_f.mdl")
	PrecacheModel("models/zombie/normalhost_f/zombie_normalhost_f.mdl")
	PrecacheModel("models/zombie/normalhost_f/hand/hand_zombie_normalhost_f.mdl")
end

-- Lines 4131-4169
function Game_init(arg)
	EnableInitialTeamApperance(true)
	InitModVars()
end

-- Lines 4185-4225
function Show_Message(type, team, Message)
	local PlayerData = GetActivePlayerList()

	if type == 1 then
		for name, player in pairs(PlayerData) do
			PrintCenter(Message, player)
		end
	elseif type == 2 then
		for name, player in pairs(PlayerData) do
			if player:GetTeamNumber() == team then
				PrintCenter(Message, player)
			end
		end
	elseif type == 3 then
		for name, player in pairs(PlayerData) do
			if player:GetTeamNumber() ~= team then
				PrintCenter(Message, player)
			end
		end
	end
end

-- Lines 4229-4273
function CheckTeam(type)
	local zombie = 0
	local human = 0
	local PlayerData = GetActivePlayerList()

	if type == 1 then
		for name, player in pairs(PlayerData) do
			if player:GetTeamNumber() == 2 then
				zombie = zombie + 1
			end
		end

		return zombie
	elseif type == 2 then
		for name, player in pairs(PlayerData) do
			if player:GetTeamNumber() == 3 then
				human = human + 1
			end
		end

		return human
	end
end

-- Lines 4277-4297
function CheckResult(arg)
	if Gamestate == 1 then
		if CheckTeam(1) == 0 then
			TerminateRoundWithMsg(3, "HumanWin!!", true)

			Gamestate = 0
		elseif CheckTeam(2) == 0 then
			TerminateRoundWithMsg(2, "ZombieWin!!", true)

			Gamestate = 0
		end
	end
end

-- Lines 4303-4435
function ChangeZombie(basezombie, type, subtype, health)
	basezombie:CreateWeapon("weapon_knife")
	basezombie:ChangeTeam(2)
	GetGameRules():BroadcastSound("Zombie.Coming", -1)
	basezombie:ChangeZombie(type)

	local weapon = basezombie:GetActiveWeapon()

	if weapon ~= nil then
		weapon:AddEffects(EF_NODRAW)
	end

	local zombie_health = basezombie:GetHealth()
	local zombie_healthmin = ZOMBIE_MINHEALTH
	local playernumber = GetActivePlayerCount()

	basezombie:SetDamageMultiplier(ZOMBIEDAMAGEMULTIPLIER)
	PrintMessage(PT_ALERT_WARNING, "#CSO2_INGAME_ZOMBIE_TRANS_ZOMBIE", 0, basezombie:entindex(), 3)

	if subtype == HOST then
		if health == 0 then
			if playernumber <= 10 then
				zombie_health = playernumber * zombie_healthmin

				if zombie_health > zombie_healthmin * 10 then
					zombie_health = zombie_healthmin * 10
				end
			elseif playernumber <= 20 then
				zombie_health = playernumber * zombie_healthmin / 2

				if zombie_health > zombie_healthmin * 10 then
					zombie_health = zombie_healthmin * 10
				end
			else
				zombie_health = playernumber * zombie_healthmin / 3

				if zombie_health > zombie_healthmin * 10 then
					zombie_health = zombie_healthmin * 10
				end
			end

			basezombie:SetHealth(zombie_health)
			basezombie:SetMaxHealth(zombie_health)
		else
			basezombie:SetHealth(health)
			basezombie:SetMaxHealth(health)
		end
	elseif subtype == CLIENT then
		if health < ZOMBIE_MINHEALTH then
			health = ZOMBIE_MINHEALTH
		end

		basezombie:SetHealth(health)
		basezombie:SetMaxHealth(health)
	end
end

-- Lines 4443-4489
function SelectZombie(arg)
	local zombie = GetActiveRandomPlayer()

	if zombie ~= nil and zombie:GetTeamNumber() ~= 2 then
		local classID = zombie:GetClass()
		local characterInfo = CSO2ResourceManager:GetCharacterDataInfo(classID)
		local iGender = characterInfo.m_iGender

		if iGender == 2 then
			ChangeZombie(zombie, HOSTZOMBIE_F, HOST, 0)
		else
			ChangeZombie(zombie, HOSTZOMBIE, HOST, 0)
		end

		Gamestate = 1
	else
		SelectZombie(0)
	end
end

-- Lines 4493-4639
function Countdown(arg)
	PrintMessage(PT_ALERT_WARNING, "#CSO2_INGAME_ZOMBIE_COUNTDOWN", count, 0, 1)

	local EventAlertZombieComming = CreateGameEvent("cso2_alert_zombie_comming")

	if EventAlertZombieComming ~= nil then
		EventAlertZombieComming:SetInt("remain_second", count)
		FireGameEvent(EventAlertZombieComming)
	end

	if count == 0 then
		EventManager:DeleteTimer("Countdown", 0)

		if ZOMBIE_HPREGEN_ENABLE == 1 then
			EventManager:RegisterTimer("HealHp", ZOMBIE_HPREGEN_TERM, 0, true)
		end

		if GetActivePlayerCount() <= 10 then
			SelectZombie(0)
		elseif GetActivePlayerCount() <= 20 then
			SelectZombie(0)
			SelectZombie(0)
		elseif GetActivePlayerCount() <= 30 then
			SelectZombie(0)
			SelectZombie(0)
			SelectZombie(0)
		elseif GetActivePlayerCount() <= 40 then
			SelectZombie(0)
			SelectZombie(0)
			SelectZombie(0)
			SelectZombie(0)
		elseif GetActivePlayerCount() <= 50 then
			SelectZombie(0)
			SelectZombie(0)
			SelectZombie(0)
			SelectZombie(0)
			SelectZombie(0)
		elseif GetActivePlayerCount() <= 60 then
			SelectZombie(0)
			SelectZombie(0)
			SelectZombie(0)
			SelectZombie(0)
			SelectZombie(0)
			SelectZombie(0)
		end

		playerall_buyzone_diable(0)
		GetGameRules():BroadcastSound("Zombie.Ambience", -1, true, 160)

		count = gcount
	elseif count == 30 then
		StopAllIGSoundRepeat()
		GetGameRules():BroadcastSound("Zombie.RoundStart", -1)
		GetGameRules():SpawnMonsterAtRandomSpot(1, ZOMBIEWALL_COUNT)

		if ZOMBIE_NPC_ENABLE == 1 then
			GetGameRules():SpawnMonsterAtRandomSpot(2, ZOMBIE_NPC_COUNT)
			GetGameRules():SpawnMonsterAtRandomSpot(3, ZOMBIE_NPC_COUNT)
		end
	elseif count == 21 then
		GetGameRules():BroadcastSound("Count.begin20sec", -1)
	elseif count == 12 then
		GetGameRules():BroadcastSound("Count.begin10sec", -1)
	elseif count >= 1 and count < 10 then
		local countStr = "Count." .. count .. "sec"

		GetGameRules():BroadcastSound(countStr, -1)
	end

	count = count - 1
end

-- Lines 4643-4689
function RoundReset(arg)
	local PlayerData = GetActivePlayerList()

	for name, player in pairs(PlayerData) do
		player:ChangeTeam(3)
		player:SetCanPickupItemsRange(3)
		player:AddAccount(16000)
		player:SetMaxSpeedMultiplier(1)
		player:SetJumpHeight(57)
		player:SetDamageMultiplier(1)
		player:SetHealth(1000)
		player:SetMetadata("Playertype", "Human")

		local weapon = player:GetActiveWeapon()

		if weapon ~= nil then
			weapon:ChangeViewModel("")
		end
	end
end

-- Lines 4699-4723
function c_GetPrimaryWeaponID(userid)
	local player = GetPlayerByUserId(userid)
	local PrimaryWeapon = player:GetWeapon(0)
	local WeaponID = 0

	if PrimaryWeapon ~= nil then
		WeaponID = GetWeaponID(PrimaryWeapon)
	end

	return WeaponID
end

-- Lines 4727-4751
function c_GetCurrentWeaponID(userid)
	local player = GetPlayerByUserId(userid)
	local CurrentWeapon = player:GetActiveWeapon()
	local WeaponID = 0

	if CurrentWeapon ~= nil then
		WeaponID = GetWeaponID(CurrentWeapon)
	end

	return WeaponID
end

-- Lines 4765-4779
function cso2_game_start(roundslimit, timelimit)
	Game_init(0)
	GetGameRules():BroadcastUIEvent("GameStart", 3, -1)
	GetGameRules():SetShowIdLevel(0)
end

-- Lines 4785-4833
function cso2_round_start(timelimit, objective)
	local PlayerData = GetActivePlayerList()

	for name, player in pairs(PlayerData) do
		RunCommandNetwork(player, "snd_mix_async 0\n")
	end

	GetGameRules():BroadcastSound("Round.Begins", -1)
	EventManager:DeleteTimer("Countdown", 0)

	if GetActivePlayerCount() > 1 then
		count = gcount

		EventManager:RegisterTimer("Countdown", 1, 0, true)
	end

	RoundReset(0)
	playerallkill(0)

	winScore = GetGameRules():GetWinLimit()

	GetGameRules():BroadcastUIEvent("RoundStart", winScore, -1)
end

-- Lines 4839-4861
function player_connected(userid, username)
	local player = GetPlayerByUserId(userid)

	player:AddUserFlag(CSO2_FLAG_RANDOM_SPAWN)

	winScore = GetGameRules():GetWinLimit()

	GetGameRules():BroadcastUIEvent("RoundStart", winScore, -1)
	GetGameRules():BroadcastUIEvent("ZombieWinRound", ZOMBIE_SCORE, -1)
	GetGameRules():BroadcastUIEvent("HumanWinRound", HUMAN_SCORE, -1)
end

-- Lines 4867-5019
function player_hurt(entindex, atk_entindex, health, armor, weapon, dmg_health, dmg_armor, hitgroup, attackdir)
	local attplayer, hurtplayer, health, strZombieType = nil
	local hurt_entity = GetEntityByIndex(entindex)

	if hurt_entity ~= nil and hurt_entity:IsPlayer() == true then
		hurtplayer = ToCSPlayer(hurt_entity)
	end

	local atk_entity = GetEntityByIndex(atk_entindex)

	if atk_entity ~= nil and atk_entity:IsPlayer() == true then
		attplayer = ToCSPlayer(atk_entity)
	end

	weapontype = GetWeaponTypeByName(weapon)

	if Gamestate == 1 then
		if attplayer ~= nil and hurtplayer ~= nil then
			if attplayer:GetTeamNumber() == 2 and hurtplayer:GetTeamNumber() == 3 then
				if weapontype == WEAPONTYPE_KNIFE then
					local weapon_id = GetWeaponIdByName(weapon)

					GetGameRules():ShowHudKillLog(hurtplayer:entindex(), attplayer:entindex(), weapon_id, 0, 0)
					attplayer:AddKillCount(1)

					health = attplayer:GetHealth() / 2

					hurtplayer:EmitQueryEventSound("Zombie.MaleDeath")

					local classID = hurtplayer:GetClass()
					local characterInfo = CSO2ResourceManager:GetCharacterDataInfo(classID)
					local iGender = characterInfo.m_iGender
					local attacker = attplayer:GetUserID()
					local userid = hurtplayer:GetUserID()
					local killerweaponid = c_GetPrimaryWeaponID(attacker)
					local victimweaponid = c_GetPrimaryWeaponID(userid)

					LogSystem:SendInGameEventLog(EVT_ZOMBIE_INFECTION, attacker, 0, 0, 0)

					if iGender == 2 then
						ChangeZombie(hurtplayer, NORMALZOMBIE_F, CLIENT, health)
					else
						ChangeZombie(hurtplayer, NORMALZOMBIE, CLIENT, health)
					end

					attplayer:EmitSound("Zombie.ZombieAttack")
					CheckResult(1)
				end
			elseif attplayer:GetTeamNumber() == 3 and ZOMBIE_HPREGEN_BESHOTDELAY ~= 0 and ZOMBIE_HPREGEN_ENABLE == 1 then
				hurtplayer:SetMetadata("HIT", ZOMBIE_HPREGEN_BESHOTDELAY)
			end
		elseif hurtplayer ~= nil and hurtplayer:GetTeamNumber() == 2 and ZOMBIE_HPREGEN_BESHOTDELAY ~= 0 and ZOMBIE_HPREGEN_ENABLE == 1 then
			hurtplayer:SetMetadata("HIT", ZOMBIE_HPREGEN_BESHOTDELAY)
		end
	end
end

-- Lines 5027-5081
function post_player_spawn(userid)
	local spawnplayer = GetPlayerByUserId(userid)

	if spawnplayer ~= nil then
		if spawnplayer:GetMetadata("MODEL") == "" then
			spawnplayer:SetMetadata("MODEL", spawnplayer:GetModelName())
		end

		spawnplayer:SetUserFlag(0)
		spawnplayer:AddUserFlag(CSO2_FLAG_ALWAYS_BUYZONE)
		spawnplayer:AddUserFlag(CSO2_FLAG_RANDOM_SPAWN)

		if ZOMBIE_HPREGEN_ENABLE == 1 then
			spawnplayer:SetMetadata("HIT", 0)
		end

		if Gamestate == 0 then
			spawnplayer:AddAccount(16000)
			spawnplayer:SetCanPickupItemsRange(3)
			spawnplayer:SetHealth(1000)
		end
	end
end

-- Lines 5087-5093
function cso2_round_timeout()
	TerminateRoundWithMsg(3, "HumanWin!!", true)
	PrintMessage(PT_CHAT_NORMAL, "#CSO2_MOD_ZOMBIE_WIN_SURVIVORS", 0, 0, -1)
	PrintMessage(PT_ALERT_WARNING, "#CSO2_MOD_ZOMBIE_WIN_SURVIVORS", 0, basezombie:entindex(), 1)

	Gamestate = 0
end

-- Lines 5099-5139
function player_death(userid, attacker, weapon, headshot, dominated, revenge, victimindex, attackerindex, killerweaponid, victimweaponid, falldown)
	local player = GetPlayerByUserId(userid)
	local atkplayer = GetPlayerByUserId(attacker)

	if player:GetMetadata("Playertype") == "MotherZombie" then
		CreateParticle("zombie_death_fx", player:entindex(), player:GetAbsOrigin(), player:GetAbsAngles())
	elseif player:GetMetadata("Playertype") == "NormalZombie" then
		CreateParticle("zombie_death_fx", player:entindex(), player:GetAbsOrigin(), player:GetAbsAngles())
	end

	if player ~= nil and atkplayer ~= nil and player:IsUserFlagActive(CSO2_FLAG_ZOMBIE) == true then
		atkplayer:AddKillCount(2)
	end

	CheckResult(2)
end

-- Lines 5145-5217
function cso2_round_end(winner, reason, message)
	local PlayerData = GetActivePlayerList()

	for name, player in pairs(PlayerData) do
		RunCommandNetwork(player, "snd_mix_async 0\n")

		if player ~= nil and Gamestate ~= 0 then
			if winner == 2 and player:IsUserFlagActive(CSO2_FLAG_ZOMBIE) == true then
				player:AddKillCount(1)
			elseif winner == 3 and player:IsUserFlagActive(CSO2_FLAG_ZOMBIE) == false then
				player:AddKillCount(3)
			end
		end
	end

	if ZOMBIE_HPREGEN_ENABLE == 1 then
		EventManager:DeleteTimer("HealHp", 0)
	end

	if winner == 2 and Gamestate ~= 0 then
		GetGameRules():BroadcastSound("Result.ZombieWin", -1)

		ZOMBIE_SCORE = ZOMBIE_SCORE + 1

		GetGameRules():BroadcastUIEvent("ZombieWinRound", ZOMBIE_SCORE, -1)
		PrintMessage(PT_CHAT_NORMAL, "#CSO2_MOD_ZOMBIE_WIN_ZOMBIES", 0, 0, -1)
		PrintMessage(PT_ALERT_NORMAL, "#CSO2_MOD_ZOMBIE_WIN_ZOMBIES")
	elseif winner == 3 and Gamestate ~= 0 then
		GetGameRules():BroadcastSound("Result.HumanWin", -1)

		HUMAN_SCORE = HUMAN_SCORE + 1

		GetGameRules():BroadcastUIEvent("HumanWinRound", HUMAN_SCORE, -1)
		PrintMessage(PT_CHAT_NORMAL, "#CSO2_MOD_ZOMBIE_WIN_SURVIVORS", 0, 0, -1)
		PrintMessage(PT_ALERT_NORMAL, "#CSO2_MOD_ZOMBIE_WIN_SURVIVORS")
	end

	Gamestate = 0
end

-- Lines 5225-5239
function player_disconnected(userid, username)
	if GetActivePlayerCount() < 2 then
		EventManager:DeleteTimer("Countdown", 0)
		CheckResult(arg)
	else
		CheckResult(arg)
	end
end

-- Lines 5245-5271
function updatescore_on_player_hurt(victimid, attackerid)
	local victim = GetPlayerByUserId(victimid)
	local attacker = GetPlayerByUserId(attackerid)

	if Gamestate == 1 and victim ~= nil and attacker ~= nil and victim:GetTeamNumber() == 3 and attacker:GetTeamNumber() == 2 then
		return true
	end

	return false
end

-- Lines 5275-5319
function HealHp(arg)
	local player, playerhp = nil
	local playerlist = GetActivePlayerList()

	for key, player in pairs(playerlist) do
		if player:GetTeamNumber() == 2 and player:IsAlive() == true and player:GetMetadata("HIT") ~= nil then
			if player:GetMetadata("HIT") == "0" then
				if player:GetMaxHealth() > player:GetHealth() + ZOMBIE_HPREGEN_AMOUNT then
					player:SetHealth(player:GetHealth() + ZOMBIE_HPREGEN_AMOUNT)
				elseif player:GetMaxHealth() < player:GetHealth() + ZOMBIE_HPREGEN_AMOUNT then
					player:SetHealth(player:GetMaxHealth())
				end
			else
				player:SetMetadata("HIT", tonumber(player:GetMetadata("HIT")) - 1)
			end
		end
	end
end

-- Lines 5327-5341
function OnSave(writer)
	writer:WriteNumber(maxPlayerCount)
	writer:WriteNumber(Gamestate)
	writer:WriteNumber(gcount)
	writer:WriteNumber(count)
	writer:WriteNumber(ZOMBIE_SCORE)
	writer:WriteNumber(HUMAN_SCORE)
end

-- Lines 5345-5361
function OnRestore(reader)
	InitModVars()

	maxPlayerCount = reader:ReadNumber()
	Gamestate = reader:ReadNumber()
	gcount = reader:ReadNumber()
	count = reader:ReadNumber()
	ZOMBIE_SCORE = reader:ReadNumber()
	HUMAN_SCORE = reader:ReadNumber()
end

-- Lines 5367-5371
function OnPostRestore()
	CheckResult()
end
