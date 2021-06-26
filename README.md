# Mu OnePlus6T Platform Repository
Project Mu based OnePlus6T Platform Repo. For Building Project Mu firmware of the OnePlus6T Device.

## Contents
- [Current Status & Schedule](#current-status--schedule)
- [Getting Started](#getting-started)
- [Acknowledgement](#acknowledgement)
- [License](#license)

## Current Status & Schedule
### Repository
- [x] Implement configuration of compilation environment with scripts.
- [x] Implement compilation with scripts.
- [ ] Use upstream master branch of the OnePlus6TPkg from sdm845Pkg instead of specific modified branches.
### OnePlus6TPkg
- [x] Implement configuration of compilation environment with scripts.
- [ ] Compile and get the firmware FD(Flash Device).
- [ ] Generate bootable Image file with DTB.

## Getting Started

### Details
This repository is NOT a part of Project Mu, but it depends on some parts of Project Mu.
- [mu_plus](https://github.com/microsoft/mu_plus)
- [mu_basecore](https://github.com/microsoft/mu_basecore)
- [mu_oem_sample](https://github.com/microsoft/mu_oem_sample)
- [mu_tiano_plus](https://github.com/microsoft/mu_tiano_plus)
- [mu_silicon_arm_tiano](https://github.com/microsoft/mu_silicon_arm_tiano)  

For more information about these repositories, see [Project Mu](https://microsoft.github.io/mu).

### Preparation (Windows10 x64)

#### Python

1. Download latest Python from <https://www.python.org/downloads>

    ``` cmd
    https://www.python.org/ftp/python/3.8.2/python-3.8.2-amd64.exe
    ```

2. It is recommended you use the following options when installing python:
    <ol type="a">
        <li>include pip support.</li>
        <li>include test support.</li>
        <li>include venv virtual environment support.</li>
    </ol>

#### Git

1. Download latest Git For Windows from <https://git-scm.com/download/win>

    ``` cmd
    https://github.com/git-for-windows/git/releases/download/v2.25.1.windows.1/Git-2.25.1-64-bit.exe
    ```

2. It is recommended you use the following options:
    <ol type="a">
        <li>Checkout as is, commit as is.</li>
        <li>Native Channel support (this will help in corp environments).</li>
        <li>Check the box to "Enable Git Credential Manager".</li>
    </ol>

#### Visual Studio 2019

1. Download latest version of VS build Tools to c:\TEMP.

    ``` cmd
    https://aka.ms/vs/16/release/vs_buildtools.exe
    ```

2. Install from cmd line with required features (this set will change over time).

    ``` cmd
    C:\TEMP\vs_buildtools.exe --quiet --wait --norestart --nocache --installPath C:\BuildTools \
    --add Microsoft.VisualStudio.Component.VC.CoreBuildTools --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 \
    --add Microsoft.VisualStudio.Component.Windows10SDK.17763 --add Microsoft.VisualStudio.Component.VC.Tools.ARM \
    --add Microsoft.VisualStudio.Component.VC.Tools.ARM64
    ```
    See component list here for more options. <https://docs.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-build-tools?view=vs-2019>

#### NASM

1. Download lastest version of NASM (NetWide Assembler).
    ``` cmd
    https://www.nasm.us/pub/nasm/releasebuilds/2.15.05/win64/nasm-2.15.05-installer-x64.exe
    ```

2. Add NASM to Widnows Environment variable.
    ```cmd
    Variable Name:  NASM_PREFIX
    Variable Value: <NASM installation dir>/
    ```

#### Workspace & Virtual Environment

1. Create the workspace like this.

    ``` pre
    /WorkspaceRoot (basic platform)
    |-- src_of_project
    |-- venv        <-- Virtual environment for Project in workspace root
    |
    ```

2. Run python cmd to create virtual environment.

    ``` cmd
    python -m venv <your virtual env name>
    ```

3. Activate it for your session.

    ``` cmd
    <your virtual env name>/Scripts/activate.bat
    ```

### Compile (Windows10 x64)

#### CI Build Process

1. Open cmd prompt at workspace root.
2. Activate your python virtual environment.
3. Install or update Python dependencies using pip.

    ```cmd
    pip install --upgrade -r pip-requirements.txt
    ```

4. Run stuart_setup to download required submodules.

    ```cmd
    stuart_setup -c .pytool/CISettings.py
    ```

5. Run stuart_ci_setup to download CI only dependencies.

    ```cmd
    stuart_ci_setup -c .pytool/CISettings.py
    ```

6. Run stuart_update to download or update binary dependencies.

    ```cmd
    stuart_update -c .pytool/CISettings.py
    ```

7. Run stuart_ci_build to build and test the packages.

    ```cmd
    stuart_ci_build -c .pytool/CISettings.py
    ```

8. Open __TestResults.xml__ in the build output for results (usually in workspace/Build).
9. Open log files to debug any errors.

#### Platform Build Process

1. Open cmd prompt at workspace root.
2. Activate your python virtual environment.
3. Install or update Python dependencies using pip.

    ```cmd
    pip install --upgrade -r pip-requirements.txt
    ```

4. Run stuart_setup to download required submodules.

    ```cmd
    stuart_setup -c Platforms/OnePlus6TPkg/CISetting/PlatformBuild.py TOOL_CHAIN_TAG=VS2019
    ```

5. Run stuart_update to download or update binary dependencies.

    ```cmd
    stuart_update -c Platforms/OnePlus6TPkg/CISetting/PlatformBuild.py TOOL_CHAIN_TAG=VS2019
    ```

6. Run stuart_build to build and test the packages.

    ```cmd
    stuart_build -c Platforms/OnePlus6TPkg/CISetting/PlatformBuild.py TOOL_CHAIN_TAG=VS2019
    ```

7. Open the build output for log files to debug any errors (usually in workspace/Build).

#### Generation Bootable Image Process

To be completed...

## Acknowledgement
- [mu](https://microsoft.github.io/mu): Provids details of project mu.
- [mu_tiano_platforms](https://github.com/microsoft/mu_tiano_platforms): Provides a template for such firmware projects.
- [edk2-sdm845](https://github.com/edk2-porting/edk2-sdm845): Most of the code for OnePlus6TPkg comes from sdm845Pkg.
## License
The software is distributed under BSD 2-Clause License.
