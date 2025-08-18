#!/bin/bash

# Menu interactif
type=$(gum choose \
  --cursor.foreground="#FF5733" \
  --selected.foreground="212" \
  "ADD" "FIX" "DELETE" "REFACTOR" "DOCS" "TEST")|| {
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

# Git commands
echo "$type($feature): $msg"
git add .
git commit -m "$type($feature): $msg"
git push
echo "✅ Commit et push effectués avec succès"
