#!/bin/bash

echo "[INTEGRIDAD]"

if [ -f "$HOME/backups/notes_db.sql" ]; then
    echo "Integridad OK"
else
    echo "Integridad ERROR"
fi

echo

echo "[CONFIDENCIALIDAD]"

id devops-deploy

echo

echo "[DISPONIBILIDAD]"

if [ -d "$HOME/backups/reportes" ]; then
    echo "Reportes OK"
else
    echo "Reportes ERROR"
fi

echo

echo "AUDITORIA CIA FINALIZADA"
``
