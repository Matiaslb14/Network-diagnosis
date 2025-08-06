#!/bin/bash

# Diagnóstico de red - Día 1: Interfaces activas

echo "=== Interfaces de red activas ==="
echo ""

# Listar interfaces activas (estado UP)
ip -brief link show up | while read -r line; do
    iface=$(echo $line | awk '{print $1}')
    state=$(echo $line | awk '{print $2}')
    echo "Interfaz: $iface - Estado: $state"
    # Mostrar IP asociada (IPv4 e IPv6)
    ip -brief addr show dev $iface | awk '{print "  IPs: " $3, $4}'
    echo ""
done
