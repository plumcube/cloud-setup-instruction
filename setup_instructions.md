# Playground Applications Setup Instructions

This document contains the commands to start the three main applications in the playground folder.

## Prerequisites

- Node.js and Yarn installed
- Python virtual environment with Jupyter installed at `../jupyter-env/`
- All applications should be run from the `playground` directory: `/home/ubuntu/playground`

## 1. Excalidraw (Port 3000)

Start the Excalidraw application on port 3000:

```bash
cd excalidraw-source
nohup yarn start > ../excalidraw.log 2>&1 &
```

**Notes:**
- This will start the development server
- First run might take several minutes to install dependencies
- Check `excalidraw.log` for startup status
- Access at: http://localhost:3000 (or your server IP)

## 2. Jupyter Notebook (Port 8888)

Start Jupyter Notebook on port 8888:

```bash
cd jupyter-notebooks
source ../../jupyter-env/bin/activate
nohup jupyter-notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root > jupyter.log 2>&1 &
```

**Notes:**
- Requires the virtual environment to be activated
- Accessible from any IP address (0.0.0.0)
- Check `jupyter.log` for the token needed to access the notebook
- Access at: http://localhost:8888 (or your server IP)

## 3. Draw.io Desktop (Electron App)

Start Draw.io desktop application:

```bash
cd drawio-desktop
nohup npm start > ../drawio.log 2>&1 &
```

**Notes:**
- This runs as an Electron desktop application
- May require X11 forwarding if running on a remote server
- Check `drawio.log` for any startup errors
- **Note:** Originally intended for port 443, but nginx is already using that port

## Checking Running Applications

To check if applications are running:

```bash
# Check running processes
ps aux | grep -E "(excalidraw|jupyter|electron)" | grep -v grep

# Check listening ports
ss -tlnp | grep -E "(3000|8888)"
```

## Stopping Applications

To stop any of the applications, find the process ID and kill it:

```bash
# Find process IDs
ps aux | grep -E "(excalidraw|jupyter|electron)" | grep -v grep

# Kill specific process
kill <PID>

# Or kill all related processes
pkill -f excalidraw
pkill -f jupyter-notebook
pkill -f electron
```

## Troubleshooting

1. **Excalidraw not starting:** Check if yarn dependencies are still installing in the log
2. **Jupyter notebook not accessible:** Check the log for the access token
3. **Port conflicts:** Use `ss -tlnp` to check what's using your desired ports
4. **Draw.io issues:** This is a desktop app and may need display forwarding on remote servers

## Application Locations

- Excalidraw: `/home/ubuntu/playground/excalidraw-source/`
- Jupyter Notebooks: `/home/ubuntu/playground/jupyter-notebooks/`
- Draw.io: `/home/ubuntu/playground/drawio-desktop/`
- Log files: All stored in `/home/ubuntu/playground/`

## Git Repository

This folder is version controlled with Git. To push changes:

```bash
git add .
git commit -m "Update setup"
git push origin main
```
