# 🖥️ HYTE Y70 Touch Infinite - Smart Display & Software Toggle

A lightweight, single-click automation batch script (`.bat`) designed for users of the **HYTE Y70 Touch Infinite** PC chassis. This script acts as a smart toggle—automatically detecting your workspace state to switch your monitor layout and manage the system resource footprint of the HYTE software stack.

---

## 💡 What This Script Does

The **HYTE Y70 Touch Infinite** features a gorgeous, integrated 14.1" 2.5K corner touchscreen. However, keeping the secondary display active and running the resource-heavy [HYTE Nexus Engine](https://hyte.com/nexus) when you aren't actively looking at your case can drain system performance. 

This single execution script solves that by checking your PC's active status:

*   **🟢 State A (Work/Gaming Mode):** If `HYTE Nexus.exe` is currently running, the script assumes you want to clear your desk workspace. It **gracefully force-closes the main app and its background service**, then instantly disables the secondary case panel using Windows `DisplaySwitch.exe`, leaving **only your main monitor active**.
*   **🔵 State B (Showcase Mode):** If the app is *not* running, the script assumes you want your PC case back in full glory. It **re-enables your display layout into "Extend" mode**, commands a 3-second buffer to let Windows reconfigure the hardware layout, restarts the `HYTE.Nexus.Service` infrastructure, and boots the main user interface app.

---

## 🛠️ Prerequisites & Necessities

To ensure the script functions perfectly on your system, verify the following configuration requirements:

1.  **Operating System:** Windows 11 (or Windows 10) configured with multiple monitors.
2.  **Administrator Rights:** The script handles system-level background processes and services (`HYTE.Nexus.Service`), meaning it **automatically triggers a standard Windows UAC administrator prompt** when double-clicked.
3.  **Default Installation Path:** The script checks for the existence of HYTE Nexus.exe in local app data, as well as program files. If your installation location is different, you'll need to update the script accordingly.

---

## 📦 About the Software & Hardware

*   **The Hardware:** The [HYTE Y70 Touch Infinite Case](https://hyte.com/nexus/how-to) features an upgraded 14.1" ultra-wide canvas with 10-point multi-touch functionality. It sits natively as an extended monitor on your graphics card layout.
*   **The Software:** Custom app widgets, audio visualizers, and case themes are powered entirely by the official software framework.
*   **Official Downloads:** If you need to reinstall or grab the latest system drivers, you can securely download the installer files from the [Official HYTE Nexus Releases Portal](https://hyte.com/nexus/releases) or try out new features directly inside the [HYTE Nexus Beta Program](https://hyte.com/nexus/beta).

---

## 🚀 How to Set It Up

1. Download or copy the `ToggleScreen.bat` script code from this repository.
2. Place the file directly on your desktop or pin it to your taskbar area for seamless access.
3. Simply **double-click** the file:
    * Click **Yes** on the Windows Admin permission prompt.
    * Watch your setup dynamically adjust states automatically!

