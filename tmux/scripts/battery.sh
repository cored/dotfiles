#! /bin/sh

echo "♥" $(acpi | head -n2 | tail -n1 | cut -d ',' -f 2) - $(acpi | head -n2 | tail -n1 | cut -d ',' -f 3)
