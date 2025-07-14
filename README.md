# ioc-common-generic_streamdevice

This repository provides a **generic StreamDevice IOC** skeleton. It does not control any actual device, but is meant to be copied and customized to implement an IOC communicating with a text-based protocol device over TCP/IP.

---
## What is a Common IOC?

A **Common IOC** defines a general device type, along with the protocol and methods used to interact with devices of that type. It is not tied to a specific deployed device.

- Use a **Common IOC** to cover all devices of a given type/protocol.
- Use a **Child IOC** to deploy a specific instance of a device.

> **Note:**  
> Only create a new Common IOC if the device/protocol you want to use is not already covered by another Common IOC.


## Getting Started: Making This Useful

Please refer to the [IOC Design and Deployment Guide](https://confluence.slac.stanford.edu/spaces/PCDS/pages/92871122/IOC+Design+and+Deployment+Guide) for extensive instructions. The steps here are an abridged version.

> **Note:**  
> "gsd" is just a placeholder. When making your IOC, use a unique and descriptive device name, and update all file names and references accordingly.

## Steps to Customize This IOC

1.  Use this template to create a new repo in pcds devices. After forking this to your own profile, clone this into  `/reg/g/pcds/epics-dev/[username]/ioc/common/[manufacturer]/` during development.

1. **Define Protocol & Database**
    - Rename files `app/srcProtocol/gsd.proto` and `app/Db/gsd.db` to match your project/device name.
    - Edit the protocol file for your device's communication needs. See the [StreamDevice Protocol Guide](https://paulscherrerinstitute.github.io/StreamDevice/) for help in writing the protocol.
    - For General EPICS records reference see [EPICS record types](https://epics.anl.gov/base/R7-0/4-docs/RecordReference.html).

2. **Autosave**
    - `app/Db/gsd.req` lists PVs to autosave. Rename and update for your project.

3. **Archiving**
    - `app/Db/gsd.archive` lists PVs and archive periods. Rename and update.

4. **User Interface (GUI)**
    - Create a `[gsd]Screens/` folder for your PyDM screens or other GUIs.
    - Use macro substitutions (e.g., `${prefix}:`) when defining channels.
    - Update `iocBoot/templates/pydm-ioc.cmd`.
    - *EDM screens* are deprecated, but you can invoke them with `iocBoot/templates/edm-ioc.cmd` if needed.

5. **Update Makefiles and Scripts**
    - Change all references from "gsd" to your device name.
    - there are a lot of places you will need o change the name. Help full to use a find_and_replace tool for "gsd"
   - Ensure `RELEASE_SITE` and module versions in `config/RELEASE` are current

6. **Create Test/Example Child IOC**
    - Child IOCs are generally kept in separate "child" repositories by deployment area/hutch. However, a test/example child in the `children/` folder is helpful for development.
    - The child config file holds device-specific info (port number, IP, location, etc.).
    - The child config filename **must match** the IOC process name in `ioc-manager`.
    - Create separate config files for each IOC process you run (one process can control multiple devices).

    > **Note:** For a few one-off child IOCs, you can keep them in this folder — but that's not best practice.

---

## Build & Deployment

### Building

All compilation and macro expansion uses `make`:

```bash
# Build both parent and child IOCs (from repo root)
make build

# Delete all build files
make clean

# Clean and build in one step
make rebuild
```

### Running
The build creates a launch script for each child in:
> /children/build/iocBoot/[ioc_name]/st.cmd

You can run this script directly to start the IOC, but using [IOC Manager](https://confluence.slac.stanford.edu/spaces/PCDS/pages/177176665/IOC+Manager+Staff+Guide) is preferred for ioc process management. Ioc manager will also handle [adding the archive files to the archiver for you](https://confluence.slac.stanford.edu/spaces/timing/pages/433984366/Using+the+Archiver+Scripts+and+Checking+PV+Status).

### Deployment

- Use the `ioc-deploy` script for deployment.
---
Original Repository Location
This repository was transferred from SLAC internal filesystems:

/afs/slac.stanford.edu/g/cd/swe/git/repos/package/epics/ioc/common/generic_streamdevice.git

