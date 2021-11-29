local oneshot = {
    "WEAPON_PISTOL",
}

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(2)

        for _,v in pairs(oneshot) do
            if DoesEntityExist(PlayerPedId()) then
                if not IsEntityDead(PlayerPedId()) then
                    local _, hitbox = GetPedLastDamageBone(PlayerPedId())
                    if hitbox == 31086 then
                        if HasEntityBeenDamagedByWeapon(PlayerPedId(), GetHashKey(v), 0) then
                            local luotiliivit = GetPedArmour(PlayerPedId())
                            if luotiliivit > 1 then
                                SetEntityHealth(PlayerPedId(), 35)
                                SetPedArmour(PlayerPedId(), 0)
                            else
                                SetEntityHealth(PlayerPedId(), 0)
                                ClearEntityLastWeaponDamage(PlayerPedId())
                                ClearPedLastWeaponDamage(PlayerPedId())
                                ClearEntityLastDamageEntity(PlayerPedId())
                                ClearPedLastDamageBone(PlayerPedId())
                            end
                        end
                    else
                        Wait(100)
                    end
                else
                    Wait(30000)
                end
            end
        end
    end
end)