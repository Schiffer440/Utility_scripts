#!/bin/bash

echo "██████╗ ██╗   ██╗███████╗██╗  ██╗"
echo "██╔══██╗██║   ██║██╔════╝██║  ██║"
echo "██████╔╝██║   ██║███████╗███████║"
echo "██╔═══╝ ██║   ██║     ██║██╔══██║"
echo "██║     ╚██████╔╝███████║██║  ██║"
echo "╚═╝      ╚═════╝ ╚══════╝╚═╝  ╚═╝"

# ATTENTION : ASSURER VOUS DAVOIR LA LIBRARY GUM INSTALLÉE
# ATTENTION : ASSURER VOUS DAVOIR LA LIBRARY GUM INSTALLÉE



# Menu interactif
type=$(gum choose \
  --cursor.foreground="#FF5733" \
  --selected.foreground="212" \
  "ADD" "FIX" "MODIF" "DELETE" "REFACTOR" "DOCS" "TEST")|| {
  echo "❌ Commit annulé"
  exit 1
}

# Demande de la fonctionnalité
feature=$(gum input --placeholder "Sur quelle fonctionnalité travailles-tu ?")|| {
  echo "❌ Commit annulé"
  exit 1
}

# Demande du message de commit
msg=$(gum input --placeholder "Message de commit")|| {
  echo "❌ Commit annulé"
  exit 1
}

# ----- Mise en majuscule de la première lettre -----
feature="$(echo "${feature:0:1}" | tr '[:lower:]' '[:upper:]')${feature:1}"
msg="$(echo "${msg:0:1}" | tr '[:lower:]' '[:upper:]')${msg:1}"


# Git commands

echo "$type($feature): $msg"
git add .
git commit -m "$type($feature): $msg"
git push
echo "✅ Commit et push effectués avec succès"
