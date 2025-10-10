#!/bin/bash
#=========================================================
# Vagrant Manager Script - start, stop, destroy, status
#=========================================================
cd /usr/local/bin/

VAGRANT_DIR=~/vagrant-cluster/shared
cd "$VAGRANT_DIR" || { echo "❌ Vagrant directory not found: $VAGRANT_DIR"; exit 1; }

while true; do
    clear
    echo "========================================"
    echo "      🧱 Vagrant Cluster Manager"
    echo "========================================"
    echo "1) Start all VMs"
    echo "2) Stop all VMs"
    echo "3) Suspend all VMs"
    echo "4) Destroy all VMs"
    echo "5) Show status"
    echo "6) SSH into a VM"
    echo "7) Exit"
    echo "========================================"
    read -rp "Select an option [1-7]: " choice

    case $choice in
        1)
            echo "🚀 Starting all VMs..."
            vagrant up
            ;;
        2)
            echo "🛑 Halting all VMs..."
            vagrant halt
            ;;
        3)
            echo "💤 Suspending all VMs..."
            vagrant suspend
            ;;
        4)
            read -rp "⚠️  Are you sure you want to destroy all VMs? (y/N): " confirm
            if [[ $confirm == [yY] ]]; then
                vagrant destroy -f
                echo "✅ All VMs destroyed."
            else
                echo "❎ Destroy cancelled."
            fi
            ;;
        5)
            echo "📋 Vagrant Status:"
            vagrant status
            ;;
        6)
            echo "🔐 Available VMs:"
            vagrant status | grep running
            read -rp "Enter VM name to SSH into: " vm
            if [[ -n "$vm" ]]; then
                vagrant ssh "$vm"
            else
                echo "⚠️ No VM name provided."
            fi
            ;;
        7)
            echo "👋 Exiting..."
            exit 0
            ;;
        *)
            echo "❌ Invalid option. Try again."
            ;;
    esac
    echo
    read -rp "Press Enter to continue..."
done

