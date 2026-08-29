#!/bin/bash

set -euo pipefail

FECHA=$(date +"%Y%m%d-%H%M%S")

CARPETA_BACKUP="$HOME/backups"
CARPETA_REPORTES="$HOME/backups/reportes"

crear_backup() {
    echo "Creando backup..."

    mkdir -p "$CARPETA_BACKUP"

    docker compose exec -T db \
        pg_dump -U postgres notesdb \
        > "$CARPETA_BACKUP/notes_db-$FECHA.sql"

    cp "$CARPETA_BACKUP/notes_db-$FECHA.sql" \
       "$CARPETA_BACKUP/notes_db.sql"
}

reporte_cpu() {
    echo "Generando reporte de CPU..."

    mkdir -p "$CARPETA_REPORTES"

    {
        date
        uptime
        lscpu
    } > "$CARPETA_REPORTES/cpu-$FECHA.txt"
}

reporte_disco() {
    echo "Generando reporte de disco..."

    mkdir -p "$CARPETA_REPORTES"

    {
        date
        df -h
    } > "$CARPETA_REPORTES/disco-$FECHA.txt"
}

crear_backup
reporte_cpu
reporte_disco

echo "Mantenimiento terminado correctamente."
