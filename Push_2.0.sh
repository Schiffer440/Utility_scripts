#!/bin/bash

# Menu interactif
type=$(gum choose "ADD" "FIX" "DELETE" "REFACTO")

# Demande de la fonctionnalité
feature=$(gum input --placeholder "Sur quelle fonctionnalité travailles-tu ?")

# Demande du message de commit
msg=$(gum input --placeholder "Message de commit")

# Git commands
git add .
git commit -m "$type($feature): $msg"
git push
