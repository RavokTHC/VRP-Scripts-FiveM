--[[
    FiveM Scripts
    Copyright C 2018  Sighmir

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    at your option any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]


vRPcmd = {}
Tunnel.bindInterface("vrp_cmds",vRPcmd)
vRPserver = Tunnel.getInterface("vRP","vrp_cmds")
CMDserver = Tunnel.getInterface("vrp_cmds","vrp_cmds")
vRP = Proxy.getInterface("vRP")

function vRPcmd.getPlayerPosH()
	x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	local h = GetEntityHeading(GetPlayerPed(-1))
	return x , y , z , h
end

function vRPcmd.teleport(x,y,z,h)
	vRP.unjail({}) -- force unjail before a teleportation
    SetEntityCoords(GetPlayerPed(-1), x+0.0001, y+0.0001, z+0.0001, 1,0,0,1)
	SetEntityHeading(GetPlayerPed(-1), h+0.0001)
    vRPserver.updatePos({x+0.0001, y+0.0001, z+0.0001})
end


function vRPcmd.colocaMascara(p)
    mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 37, 0, 1) --coloca
        else
            SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 0, 1) --tira
        end
end

function vRPcmd.mascaraabobora(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 60, 0, 1) --coloca
        end


end


function vRPcmd.mascaradegas(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 46, 0, 1) --coloca
end
end


function vRPcmd.mascaradegas2(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 129, 0, 1) --coloca
end
end

function vRPcmd.mascarakawai(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 44, 0, 1) --coloca
end
end

function vRPcmd.mascarazumbi(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 39, 0, 1) --coloca
end
end

function vRPcmd.mascaraswat(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 28, 0, 1) --coloca
end
end

function vRPcmd.mascaraaguia(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 24, 0, 1) --coloca
end
end

function vRPcmd.mascaratexugo(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 20, 0, 1) --coloca
end
end

function vRPcmd.mascaragato(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 17, 0, 1) --coloca
end
end

function vRPcmd.mascaradeneve(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 10, 0, 1) --coloca
end
end

function vRPcmd.mascaranoel(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 8, 0, 1) --coloca
end
end

function vRPcmd.mascaraorc(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 7, 0, 1) --coloca
end
end

function vRPcmd.mascaramacaco(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 3, 0, 1) --coloca
end
end

function vRPcmd.mascaracaveira(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 2, 0, 1) --coloca
end
end

function vRPcmd.mascaraporco(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 1, 0, 1) --coloca
end
end

function vRPcmd.mascaraespiao(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 132, 0, 1) --coloca
end
end

function vRPcmd.mascaraswat2(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 130, 0, 1) --coloca
end
end

function vRPcmd.mascarabolacha(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 127, 0, 1) --coloca
end
end

function vRPcmd.mascaraespiao2(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 125, 0, 1) --coloca
end
end

function vRPcmd.mascarafone(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 121, 0, 1) --coloca
end
end

function vRPcmd.mascaraassalto(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 119, 0, 1) --coloca
end
end

function vRPcmd.mascaraassalto2(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 113, 0, 1) --coloca
end
end

function vRPcmd.mascaraassalto2(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 113, 0, 1) --coloca
end
end

function vRPcmd.mascaraprotesto(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 118, 0, 1) --coloca
end
end

function vRPcmd.mascaraprotesto2(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 116, 0, 1) --coloca
end
end

function vRPcmd.mascaraprotesto3(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 115, 0, 1) --coloca
end
end

function vRPcmd.mascaraprotesto4(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 114, 0, 1) --coloca
end
end

function vRPcmd.mascaragas3(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 112, 0, 1) --coloca
end
end

function vRPcmd.mascaragang(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 111, 0, 1) --coloca
end
end

function vRPcmd.mascaracaveira2(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 110, 0, 1) --coloca
end
end

function vRPcmd.mascaraaviador(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 109, 0, 1) --coloca
end
end

function vRPcmd.mascaracaveira3(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 108, 0, 1) --coloca
end
end

function vRPcmd.mascaradoende2(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 105, 0, 1) --coloca
end
end

function vRPcmd.mascarapug(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 100, 0, 1) --coloca
end
end

function vRPcmd.mascaralutalivre(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 99, 0, 1) --coloca
end
end

function vRPcmd.mascaraunicornio(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 98, 0, 1) --coloca
end
end

function vRPcmd.mascaracavalo(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 97, 0, 1) --coloca
end
end

function vRPcmd.mascaragorilla(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 96, 0, 1) --coloca
end
end

function vRPcmd.mascarapalhaco(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 95, 0, 1) --coloca
end
end

function vRPcmd.mascaradinossauro(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 93, 0, 1) --coloca
end
end

function vRPcmd.mascaraalien(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 92, 0, 1) --coloca
end
end

function vRPcmd.mascaravovo(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 88, 0, 1) --coloca
end
end

function vRPcmd.mascaradoende3(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 87, 0, 1) --coloca
end
end

function vRPcmd.mascaravovocreepy(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 86, 0, 1) --coloca
end
end

function vRPcmd.mascarafrango(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 85, 0, 1) --coloca
end
end

function vRPcmd.mascarayeti(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 84, 0, 1) --coloca
end
end

function vRPcmd.mascaralobisomen5(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 83, 0, 1) --coloca
end
end

function vRPcmd.mascaralobisomen4(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 82, 0, 1) --coloca
end
end

function vRPcmd.mascaralobisomen3(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 81, 0, 1) --coloca
end
end

function vRPcmd.mascaralobisomen2(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 80, 0, 1) --coloca
end
end

function vRPcmd.mascaralobisomen6(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 79, 0, 1) --coloca
end
end

function vRPcmd.mascaranatal(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 77, 0, 1) --coloca
end
end

function vRPcmd.mascaranatal2(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 76, 0, 1) --coloca
end
end

function vRPcmd.mascaracookie(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 75, 0, 1) --coloca
end
end

function vRPcmd.mascaracookie2(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 74, 0, 1) --coloca
end
end

function vRPcmd.mascarabruxa(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 71, 0, 1) --coloca
end
end

function vRPcmd.mascarazumbi2(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 67, 0, 1) --coloca
end
end

function vRPcmd.mascaramosca(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 66, 0, 1) --coloca
end
end

function vRPcmd.mascaralobisomen(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 65, 0, 1) --coloca
end
end

function vRPcmd.mascaracaveira4(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 64, 0, 1) --coloca
end
end

function vRPcmd.mascarasempele(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 63, 0, 1) --coloca
end
end

function vRPcmd.mascaracreepy(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 62, 0, 1) --coloca
end
end

function vRPcmd.mascaracreepy2(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 61, 0, 1) --coloca
end
end

function vRPcmd.mascaraassalto3(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 58, 0, 1) --coloca
end
end

function vRPcmd.mascaraassalto4(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 57, 0, 1) --coloca
end
end

function vRPcmd.mascaraassalto5(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 56, 0, 1) --coloca
end
end

function vRPcmd.mascaraassalto6(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 55, 0, 1) --coloca
end
end

function vRPcmd.mascaraterrorista(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 54, 0, 1) --coloca
end
end

function vRPcmd.mascaraterrorista2(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 53, 0, 1) --coloca
end
end

function vRPcmd.mascaracontraterrorista(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 52, 0, 1) --coloca
end
end

function vRPcmd.mascaragang2(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 51, 0, 1) --coloca

end
end

function vRPcmd.mascaradepapel(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 49, 0, 1) --coloca
end
end

function vRPcmd.mascaraprotesto5(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 47, 0, 1) --coloca
end
end

function vRPcmd.mascaracreepy3(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 42, 0, 1) --coloca
end
end

function vRPcmd.mascaracreepy4(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 41, 0, 1) --coloca
end
end

function vRPcmd.mascarazumbi3(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 40, 0, 1) --coloca
end
end

function vRPcmd.mascaraaviador2(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 27, 0, 1) --coloca
end
end

function vRPcmd.mascaralobo(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 26, 0, 1) --coloca
end
end

function vRPcmd.mascarapombo(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 25, 0, 1) --coloca
end
end

function vRPcmd.mascaratouro(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 23, 0, 1) --coloca
end
end

function vRPcmd.mascaraurso(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 21, 0, 1) --coloca
end
end

function vRPcmd.mascaracoruja(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 19, 0, 1) --coloca
end
end

function vRPcmd.mascararaposa(p)
mask = not mask
        if mask then
            SetPedComponentVariation(GetPlayerPed(-1), 1, 18, 0, 1) --coloca
end
end
