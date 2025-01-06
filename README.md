# Guide: Deploying Microsoft .NET 3.5 Framework Using Intune

Follow these steps to download, configure, and deploy the Microsoft .NET 3.5 Framework using Intune.

**1. Prepare the Required Files
**
1. Download the `install.ps1` and `check.ps1` files from the following GitHub repository:
   [https://github.com/wsherwen/Microsoft-.net-3.5-Setup-for-Intune/tree/main](https://github.com/wsherwen/Microsoft-.net-3.5-Setup-for-Intune/tree/main)
2. Save the downloaded files to the following directory on your local machine:
   ```
   C:\temp\framework35
   ```

**2. Configure the Intune Win32 App Package
**
1. Open **PowerShell** as an administrator.
2. Run the **Win32 Intune Package Management Tool**.
3. Configure the tool with the following settings:
   - **Source folder**: `C:\temp\framework35`
   - **Installer file**: `install.ps1`
   - **Output folder**: `C:\temp\framework35`
4. Generate the Win32 app package.

---

**3. Create the Intune Application
**
1. Open the Intune portal:
   [https://intune.microsoft.com](https://intune.microsoft.com)
2. Navigate to **Apps > Windows**.
3. Click **+ Add** and select **Windows app (Win32)**.

### App Information

1. Set the application name to:
   ```
   Microsoft .NET 3.5 Framework Online
   ```
2. Set the developer to:
   ```
   Microsoft
   ```
3. Set the version to:
   ```
   3.5
   ```
4. Proceed to the next page.

### Program Information

1. Set the install command to:
   ```
   powershell.exe -ExecutionPolicy Bypass -file install.ps1 -Mode Install
   ```
2. Set the uninstall command to:
   ```
   powershell.exe -ExecutionPolicy Bypass -file install.ps1 -Mode Uninstall
   ```
3. Set the maximum install time to:
   ```
   60 minutes
   ```
4. Set the install behavior to:
   ```
   System
   ```
5. Set the device restart behavior to:
   ```
   App install may force a device restart
   ```
6. Leave the return codes as defaults.
7. Proceed to the next page.

### Requirements

1. Set the operating system architecture to:
   ```
   x86 and x64
   ```
2. Set the minimum operating system to:
   ```
   Windows 10 1607
   ```
3. Set the required disk space to:
   ```
   5000 MB
   ```
4. Proceed to the next page.

### Detection Rules

1. Select **Use a custom detection script**.
2. Upload the `check.ps1` file you downloaded earlier.
3. Proceed to the **Assignments** page.

### Assignments

1. Assign the application to the required devices or users.
   - **Recommendation**: Deploy this as unscoped, and set it as a dependancy (automatic install, under other applications that require it.

---

**4. Finish Deployment
**
1. Review all settings and proceed to finish.
2. Save the application.


