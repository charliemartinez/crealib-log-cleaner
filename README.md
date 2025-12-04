# Crealib Log Cleaner (CLC)

**Autor / Author:** Charlie Martínez – Crealib  
**Licencia / License:** GPLv2.0  
**Compatible OS:** Debian y derivadas

---
![Contributors](https://img.shields.io/github/contributors/charliemartinez/crealib-log-cleaner) ![Stars](https://img.shields.io/github/stars/charliemartinez/crealib-log-cleaner?style=flat) ![Forks](https://img.shields.io/github/forks/charliemartinez/crealib-log-cleaner?style=flat) ![Issues](https://img.shields.io/github/issues/charliemartinez/crealib-log-cleaner) ![Last Commit](https://img.shields.io/github/last-commit/charliemartinez/crealib-log-cleaner) ![Activity](https://img.shields.io/github/commit-activity/m/charliemartinez/crealib-log-cleaner) ![Repo Size](https://img.shields.io/github/repo-size/charliemartinez/crealib-log-cleaner?style=flat) ![Lenguaje](https://img.shields.io/badge/Lenguaje-Bash-blue)
---

## 🧭 Descripción general / Overview

**ES:**  
`Crealib Log Cleaner (CLC)` es una herramienta en **Bash Scripting** diseñada para la **limpieza automática y segura de los logs del servidor**. Elimina logs antiguos de Apache, PHP-FPM, sistema, firewall y servicios comunes, manteniendo protegidos los registros críticos del sistema y las bases de datos.

Además, genera un **LOG progresivo de ejecución** para auditoría.

**EN:**  
`Crealib Log Cleaner (CLC)` is a **Bash scripting tool** designed for the **automatic and safe cleanup of server logs**. It removes old logs from Apache, PHP-FPM, system, firewall, and common services, while protecting critical system records and databases.

Additionally, it generates a **progressive execution log** for auditing.

---

## ✔️ Características / Features

**ES:**
- Limpieza automática de logs de Apache  
- Limpieza de logs de PHP-FPM (todas las versiones instaladas)  
- Eliminación de logs de sistema (auth, syslog, cron, kernel, user, dpkg, ufw, fail2ban)  
- Limpieza de logs gráficos y de arranque  
- Limpieza de logs de proyectos web  
- Protección de logs críticos (PostgreSQL, correo, auditoría, APT, private)  
- Registro automático de cada ejecución  
- Optimizado para servidores Debian  
- Programado íntegramente en Bash  

**EN:**
- Automatic cleanup of Apache logs  
- PHP-FPM logs cleanup (all installed versions)  
- System logs removal (auth, syslog, cron, kernel, user, dpkg, ufw, fail2ban)  
- Cleanup of boot and graphical logs  
- Web project log cleanup  
- Protection of critical logs (PostgreSQL, mail, audit, APT, private)  
- Automatic execution logging  
- Optimized for Debian servers  
- Fully written in Bash  

---

## ▶️ Instalación / Installation

### ES / EN – Convertir el script en comando

Mover el script al directorio de binarios del sistema:

    mv crealib-log-cleaner.sh /usr/local/bin/crealib-log-cleaner

Asignar permisos de ejecución:

    chmod +x /usr/local/bin/crealib-log-cleaner

---

## 🔐 Excepción en sudoers / Sudoers Exception (Muy importante / Very Important)

Para que `cron` pueda ejecutar el script **sin pedir contraseña**, crear el siguiente archivo:

    nano /etc/sudoers.d/crealib-log-cleaner

Contenido del fichero:

    ALL ALL=NOPASSWD: /usr/local/bin/crealib-log-cleaner

Asignar permisos correctos:

    chmod 440 /etc/sudoers.d/crealib-log-cleaner

---

## ⏱️ Programación mensual / Monthly Scheduling

Editar el cron de root:

    crontab -u root -e

Añadir la siguiente línea para ejecutar el script el **día 1 de cada mes a las 03:00 AM**:

    0 3 1 * * /usr/local/bin/crealib-log-cleaner

---

## 🛠️ Uso / Usage

### Modo automático / Automatic mode

El sistema lo ejecutará automáticamente cada mes mediante `cron`.

También puede lanzarse manualmente en cualquier momento:

    /usr/local/bin/crealib-log-cleaner

---

### Modo prueba / Testing mode

Antes de activar el cron, se recomienda una ejecución manual:

    sudo /usr/local/bin/crealib-log-cleaner

Verificar el log de ejecución:

    cat /var/log/crealib-log-cleaner.log

---

## 🔒 Seguridad / Security

**ES:**
- No borra bases de datos  
- No afecta a estadísticas de analítica web  
- No borra logs de correo  
- No elimina registros de auditoría  
- No toca logs del gestor de paquetes  
- Solo actúa sobre archivos de tipo `.log`  
- Mantiene la estabilidad del sistema  

**EN:**
- Does not delete databases  
- Does not affect web analytics statistics  
- Does not remove mail logs  
- Does not delete audit records  
- Does not touch package manager logs  
- Only removes `.log` files  
- Preserves system stability  

---

## ✅ Recomendaciones / Recommendations

**ES:**  
Se recomienda disponer de un sistema de **copias de seguridad periódicas** antes de automatizar cualquier limpieza masiva de logs.

**EN:**  
It is recommended to maintain **regular backups** before automating any massive log cleanup process.

---

## ⚖️ Aviso legal / Legal Notice

**ES:**  
Este proyecto forma parte del ecosistema **Crealib**, pero es compatible con cualquier servidor moderno basado en GNU/Linux. Distribuido bajo los términos de la licencia **GPLv2**.

**EN:**  
This project is part of the **Crealib** ecosystem but remains compatible with any modern GNU/Linux-based server. Released under the terms of the **GPLv2 license**.

---

**Autor / Author:** Charlie Martínez  
📧 <cmartinez@crealib.net>  
🌐 https://www.crealib.net
