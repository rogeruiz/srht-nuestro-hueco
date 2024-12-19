#!/usr/bin/env bash
# Nuestro Hueco
# Copyright (C) 2024 Roger Steve Ruiz
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see <https://www.gnu.org/licenses/>.

source ../variables.sh

# NOTE: Estos comandos se corrén en el caja de Linux pa' instalar a WireGuard.
# No los corras en tu computadora.

# Agregamos unas llaves se SSH
ssh -i ~/.ssh/id_rsa ubuntu@${DIRECCION_IP_PUBLICO}

# Actualizar, mejorar, y instalar UFW (Uncomplicated Firewall)
sudo apt update && sudo apt upgrade && sudo apt install ufw

# Usando UFW que acabamos a instalar, vamos a configurarlo con los sigiente
# comandos
sudo ufw allow 22
sudo ufw allow "${PORTO_PARA_EL_VPN}"
sudo ufw enable

# Instalemos PiVPN
curl -L https://install.pivpn.io | bash
