#!/bin/bash
#===============================================================
### DASHBOARD  BAGOT_CPE

### NOM DU FICHIER PDF A CREER
var_pdf="bagot_cpe.pdf"  

### URL DU DASHBOARD UTILISE POUR GENERER LE PDF
var_urlDashboard="http://172.19.195.170:3000/d/01_bagots_cpe/bagots_cpe?orgId=1&var-client=FRANCE&var-client=TOTAL&var-client=AQUAIR&var-site=MONOPRIX&var-device=93.18.87.160&var-constructeur=&var-code_postal=&var-cpe=AB5E_SogeresLangeais_A&var-cpe=VES_Aveoliaenvironnem_235_P&var-cpe=TOTALFRA_Totalsachampfrom_P"
### VARIABLES DE DEBUT ET FIN POUR LA GENERATION DU PDF (ICI DERNIERE 24H) 
var_periodDebut="now-24h"
var_periodFin="now"

#=========================================================================
wget -O ${var_pdf} ${var_urlDashboard}?from=${var_periodDebut}&to=${var_periodFin}

sleep 40s 
echo " Le fichier $var_pdf à été créé"
#/usr/sbin/sendemail -f oussouburgos@gmail.com -t traoreosman@yahoo.fr -s mail.bujarra.com -m "Estimados señores,\nSe les adjuntan los informes con los consumos de su datacenter.\nQue tengan muy buen dia!" -u "Grafana - Informe Diario" -xu usuario@bujarra.com -xp XXXXXXXX -o tls=auto -a $var_pdf
