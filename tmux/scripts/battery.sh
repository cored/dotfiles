#! /bin/sh

echo "♥ " $(acpi | head -n1 | tail -n1 | cut -d ',' -f 2) - $(acpi | head -n1 | tail -n1 | cut -d ',' -f 3)
