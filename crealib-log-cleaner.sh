
#!/bin/bash
# ===============================================================================
# Nombre:            Crealib Log Cleaner v1.0
# Autor:             Charlie Martinez® <cmartinez@quirinux.org>
# Licencia:          https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
# Utilidad:          Borra archivos de registro de manera automática
# Distro:            Debian, Devuan
# ===============================================================================
# Ejecutar con permisos de administrador
# ===============================================================================

# ==========================================
# LIMPIEZA COMPLETA MENSUAL DE LOGS - DEBIAN
# ==========================================

FECHA=$(date +"%Y-%m-%d %H:%M:%S")
LOG_EJECUCION="/var/log/limpieza_logs_mensual.log"

echo "[$FECHA] === INICIO LIMPIEZA ===" >> "$LOG_EJECUCION"

# ---------------------------
# 1. APACHE
# ---------------------------
rm -f /var/log/apache2/*.log
rm -f /var/log/apache2/*.gz

# ---------------------------
# 2. PHP-FPM TODAS VERSIONES
# ---------------------------
rm -f /var/log/php*-fpm.log
rm -f /var/log/php*-fpm.log.*
rm -f /var/log/php*-fpm.log*.gz

# ---------------------------
# 3. LOGS GENERALES DEL SISTEMA
# ---------------------------
rm -f /var/log/syslog*
rm -f /var/log/auth.log*
rm -f /var/log/kern.log*
rm -f /var/log/cron.log*
rm -f /var/log/user.log*
rm -f /var/log/dpkg.log*
rm -f /var/log/ufw.log*
rm -f /var/log/gufw.log*
rm -f /var/log/fail2ban.log*

# ---------------------------
# 4. OTROS LOGS COMUNES
# ---------------------------
rm -f /var/log/Xorg.*.log*
rm -f /var/log/boot.log*
rm -f /var/log/alternatives.log*

# ---------------------------
# 5. LOG DEL PROYECTO
# ---------------------------
if [ -d /var/www/proyectos.crealib.net/log ]; then
    rm -rf /var/www/proyectos.crealib.net/log/*
fi

# ---------------------------
# 6. VACÍO SIN BORRAR CARPETAS CRÍTICAS
# ---------------------------
find /var/log -type f -name "*.log" \
  ! -path "/var/log/postgresql/*" \
  ! -path "/var/log/exim4/*" \
  ! -path "/var/log/audit/*" \
  ! -path "/var/log/apt/*" \
  ! -path "/var/log/private/*" \
  -exec rm -f {} \;

# ---------------------------
# 7. RECARGAR SERVICIOS
# ---------------------------
systemctl reload apache2
systemctl reload php8.2-fpm 2>/dev/null
systemctl reload php8.3-fpm 2>/dev/null

# ---------------------------
# 8. FINALIZAR
# ---------------------------
echo "[$FECHA] Limpieza finalizada correctamente." >> "$LOG_EJECUCION"
echo "----------------------------------------" >> "$LOG_EJECUCION"
