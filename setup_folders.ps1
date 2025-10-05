# Script: setup_folders.ps1
# Purpose: Create folder structure for ratu-template repo

# Define base path
$basePath = "C:\Users\adityo.nugroho.id\Documents\GitHub\Portfolio\ratu-template"

# Ensure the base directory exists
if (-not (Test-Path $basePath)) {
    Write-Error "Base path $basePath does not exist. Please verify the repo path."
    exit 1
}

# Define folder structure
$folders = @(
    "src/ratu_template",
    "tests",
    "docs",
    "scripts"
)

# Create folders
foreach ($folder in $folders) {
    $fullPath = Join-Path $basePath $folder
    if (-not (Test-Path $fullPath)) {
        New-Item -Path $fullPath -ItemType Directory -Force
        Write-Host "Created folder: $fullPath"
    } else {
        Write-Host "Folder already exists: $fullPath"
    }
}

# Create __init__.py in src/ratu_template
$initPath = Join-Path $basePath "src/ratu_template/__init__.py"
if (-not (Test-Path $initPath)) {
    New-Item -Path $initPath -ItemType File -Force
    Write-Host "Created file: $initPath"
}

# Create empty requirements.txt
$reqPath = Join-Path $basePath "requirements.txt"
if (-not (Test-Path $reqPath)) {
    New-Item -Path $reqPath -ItemType File -Force
    Write-Host "Created file: $reqPath"
}

# Create pyproject.toml with basic configuration
$pyprojectPath = Join-Path $basePath "pyproject.toml"
if (-not (Test-Path $pyprojectPath)) {
    $pyprojectContent = @"
[build-system]
requires = ["setuptools>=61.0"]
build-backend = "setuptools.build_meta"

[project]
name = "ratu-template"
version = "0.1.0"
description = "RATU Template: Real-time Automated Techstack Unified starting point"
authors = [{ name = "Adityo Nugroho" }]
license = { file = "LICENSE" }
dependencies = []

[tool.setuptools.packages.find]
where = ["src"]
include = ["ratu_template*"]
"@
    Set-Content -Path $pyprojectPath -Value $pyprojectContent
    Write-Host "Created file: $pyprojectPath"
}

# Create basic README.md
$readmePath = Join-Path $basePath "README.md"
if (-not (Test-Path $readmePath)) {
    $readmeContent = @"
# RATU Template
Real-time Automated Techstack Unified (RATU) - A template for starting new portfolio projects.

## Overview
This repository provides a standardized starting point for RATU-branded projects, focusing on real-time, automated, and unified tech solutions.

## Setup
1. Clone the repo: `git clone https://github.com/adityonugrohoid/ratu-template.git <project-dir>`
2. Rename the `src/ratu_template` folder to match your project (e.g., `src/ratu_project1`)
3. Create a virtual environment: `python -m venv .venv`
4. Activate the virtual environment:
   - Windows: `.venv\Scripts\activate`
   - Linux/Mac: `source .venv/bin/activate`
5. Install dependencies: `pip install -r requirements.txt`

## Folder Structure
- `src/ratu_template/`: Source code package (rename per project)
- `tests/`: Unit and integration tests
- `docs/`: Documentation and project guidelines
- `scripts/`: Utility scripts
- `.gitignore`: Ignores virtual env and other files
- `LICENSE`: MIT license
- `README.md`: Project overview
- `requirements.txt`: Python dependencies
- `pyproject.toml`: Project configuration

## Usage
- Use this template on GitHub to create new projects.
- Customize the structure and files as needed for each portfolio showcase.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
"@
    Set-Content -Path $readmePath -Value $readmeContent
    Write-Host "Created file: $readmePath"
}

Write-Host "Template folder structure setup complete!"