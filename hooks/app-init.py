# -*- coding: utf-8 -*-
"""
Auto-updater script for Riyan.extension.
This script runs silently when Revit starts up and performs a git pull
to fetch the latest changes from the partner's GitHub repository.
"""

import os
import subprocess

def run_auto_update():
    # The extension directory is the parent directory of this 'hooks' folder
    curr_dir = os.path.dirname(__file__)
    extension_dir = os.path.dirname(curr_dir)
    
    # Check if .git exists to confirm it's a valid repository
    git_dir = os.path.join(extension_dir, '.git')
    if not os.path.exists(git_dir):
        return
        
    try:
        # We use a trick to hide the command prompt window on Windows
        startupinfo = subprocess.STARTUPINFO()
        startupinfo.dwFlags |= subprocess.STARTF_USESHOWWINDOW
        
        # Run git pull synchronously. This will update the files before pyrevit finishes loading UI tools.
        process = subprocess.Popen(
            ["git", "pull"],
            cwd=extension_dir,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            startupinfo=startupinfo
        )
        
        # Wait for git pull to finish
        out, err = process.communicate()
        
    except Exception as e:
        # Fail silently if offline or git is not installed, to not disrupt Revit startup
        pass

try:
    run_auto_update()
except:
    pass
