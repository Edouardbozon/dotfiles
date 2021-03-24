#!/bin/bash
set -e

if [[ $# -eq 0 ]]; then
  # Run all roles except for the ones tagged with 'bootstrap'
  echo "Updating local dev environment..."
  ansible-playbook -i ~/dotfiles/hosts ~/dotfiles/local_env.yml --skip-tags "bootstrap"
else
  echo "Updating local dev environment... (--tags $@)"
  ansible-playbook -i ~/dotfiles/hosts ~/dotfiles/local_env.yml --skip-tags "bootstrap" --tags $@
fi

# If terminal-notifier is installed, use it to display a notification
if command -v terminal-notifier 1>/dev/null 2>&1; then
  terminal-notifier -title "dotfiles: update complete" -message "Successfully updated dev environment."
fi