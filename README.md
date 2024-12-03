# Utility_scripts
Bunch of script that do some automated task in the shell

push.sh: Script Shell qui automatise les commandes git en demandant les fichiers et le message si ceux-ci sont valides.
Il retourne un message d'erreur et arrête le script si aucun fichier n'est rentré et envoi le commit message "auto push"
si aucun message de commit n'est entré.

pushauto_time.sh: Ce script Shell ce comporte comme push.sh à la difference qu'il push automatiquement toutes les 10 minutes.

