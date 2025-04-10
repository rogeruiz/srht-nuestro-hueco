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

# Tenemos que obtener los variables
source ../variables.sh

# Crear los gropos de recurso
az group create --name ${NOMBRE}-rg --location ${UBICACION}

# Crear una macquina virtual
az vm create \
  --resource-group ${NOMBRE}-rg \
  --name ${NOMBRE}-vm \
  --image Ubuntu2404 \
  --admin-username ubuntu \
  --public-ip-address ${NOMBRE}-ip \
  --public-ip-address-allocation static \
  --generate-ssh-keys

# El porto abierto (Escoje algo random major de 1024 pa' que se use con
# WireGuard más tarde)
az vm open-port \
  --port ${PORTO_PARA_EL_VPN} \
  --resource-group ${NOMBRE}-rg \
  --name ${NOMBRE}-vm
