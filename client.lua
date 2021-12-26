----------------[Setz Crew]----------------
-----  ESCKaybeden#0488  ra1der#8102  -----
----   Discord: discord.gg/6drAg2vP55  ----
-------------------------------------------

local sure = true

RegisterNetEvent('setz_combatlogsend')
AddEventHandler('setz_combatlogsend', function(konum, players, identifier, saat, sebep)
    Citizen.CreateThread(function()
        Wait(Config.Time)
        sure = false
    end)

    Citizen.CreateThread(function()
        sure = true
        while sure do
            local mesafe = #(GetEntityCoords(PlayerPedId()) - konum)
            if mesafe < 15.0 then
                DrawMarker(32, konum.x, konum.y, konum.z, 0, 0, 0, 0, 0, 0, 0.7, 0.7, 0.7, 32, 236, 54, 100, 0, 0, 0, 1, 0, 0, 0)
                if mesafe < 3 then
                    DrawText3Ds(konum.x, konum.y, konum.z + 0.5, "~r~ "..players.firstname.." "..players.lastname.." ~w~[~y~ "..identifier.." ~w~ - ~g~"..saat.. " ~w~] \n ~w~[Sebep: ~y~"..sebep.."~w~] ")
                end
            end
            Wait(7)
        end
    end)
end)

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(9)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
     local factor = (string.len(text)) / 330
    DrawRect(_x,_y+0.0225, 0.015+ factor, 0.05, 0, 0, 0, 75)
end