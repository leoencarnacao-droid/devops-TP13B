# TP13A - OWASP ZAP, Automatización y Tríada CIA

## Objetivo

Aplicar conceptos de automatización, seguridad y auditoría sobre la aplicación Notes App utilizando Docker Compose y herramientas de análisis de seguridad.

---

## Confidencialidad

La confidencialidad se implementó mediante el uso del usuario `devops-deploy` y la aplicación del principio de privilegio mínimo.

El usuario posee únicamente los permisos necesarios para ejecutar tareas de administración y auditoría.

---

## Integridad

La integridad se garantizó mediante la generación automática de backups de la base de datos usando el script `sistema.sh`.

Los backups permiten recuperar información ante fallas o incidentes.

---

## Disponibilidad

La disponibilidad se implementó mediante la generación de reportes de CPU y espacio en disco.

Estos reportes permiten monitorear el estado operativo del sistema.

---

## OWASP ZAP

Se utilizó OWASP ZAP para realizar un análisis de seguridad tipo Black Box sobre la aplicación Notes App.

La herramienta permitió descubrir recursos web y detectar alertas de seguridad iniciales.

---

## Scripts desarrollados

### sistema.sh

- Backup de base de datos.
- Reporte de CPU.
- Reporte de Disco.

### verificar-permisos.sh

- Validación de Integridad.
- Validación de Confidencialidad.
- Validación de Disponibilidad.

---

## Conclusión

El trabajo práctico permitió aplicar de forma práctica los conceptos de Confidencialidad, Integridad y Disponibilidad, relacionando Linux, Docker, DevSecOps y seguridad informática con escenarios reales de operación.
