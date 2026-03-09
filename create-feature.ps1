#!/usr/bin/env pwsh

<#
.SYNOPSIS
    Create a new feature with clean architecture structure

.DESCRIPTION
    Creates a new feature directory structure following clean architecture principles
    in the lib/src/feature directory

.PARAMETER Name
    The name of the feature to create

.EXAMPLE
    .\create-feature.ps1 -Name authentication
    .\create-feature.ps1 -Name profile
    .\create-feature.ps1 -Name inventory
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$Name
)

function New-FeatureStructure {
    param(
        [string]$FeatureName
    )
    
    Write-Host "Creating feature: $FeatureName" -ForegroundColor Green
    Write-Host "Creating directory structure..." -ForegroundColor Yellow
    
    # Base path
    $basePath = "lib\src\feature\$FeatureName"
    
    # Create directories
    $directories = @(
        "$basePath\data\datasources",
        "$basePath\data\models", 
        "$basePath\data\repositories",
        "$basePath\domain\entities",
        "$basePath\domain\repositories",
        "$basePath\domain\usecases",
        "$basePath\presentation\pages",
        "$basePath\presentation\providers",
        "$basePath\presentation\widgets"
    )
    
    foreach ($dir in $directories) {
        if (-not (Test-Path $dir)) {
            New-Item -ItemType Directory -Path $dir -Force | Out-Null
            Write-Host "Created: $dir" -ForegroundColor Gray
        }
    }
    
    Write-Host "Creating placeholder files..." -ForegroundColor Yellow
    
    # Create .gitkeep files
    $gitkeepFiles = @(
        "$basePath\data\datasources\.gitkeep",
        "$basePath\data\models\.gitkeep",
        "$basePath\data\repositories\.gitkeep",
        "$basePath\domain\entities\.gitkeep",
        "$basePath\domain\repositories\.gitkeep",
        "$basePath\domain\usecases\.gitkeep",
        "$basePath\presentation\pages\.gitkeep",
        "$basePath\presentation\providers\.gitkeep",
        "$basePath\presentation\widgets\.gitkeep"
    )
    
    foreach ($file in $gitkeepFiles) {
        if (-not (Test-Path $file)) {
            New-Item -ItemType File -Path $file -Force | Out-Null
        }
    }
    
    # Create README.md
    $readmeContent = @"
# $FeatureName Feature

## Overview
Description of the $FeatureName feature.

## Architecture
This feature follows Clean Architecture principles:

### Data Layer
- **datasources/**: Remote and local data sources
- **models/**: Data transfer objects
- **repositories/**: Repository implementations

### Domain Layer
- **entities/**: Business objects
- **repositories/**: Repository interfaces
- **usecases/**: Business logic use cases

### Presentation Layer
- **pages/**: Screen widgets
- **providers/**: Riverpod state management
- **widgets/**: Reusable UI components

## Usage
How to use this feature in the application.
"@
    
    $readmePath = "$basePath\README.md"
    $readmeContent | Out-File -FilePath $readmePath -Encoding UTF8
    
    Write-Host "✅ Feature '$FeatureName' created successfully!" -ForegroundColor Green
    Write-Host "📁 Location: $basePath" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Yellow
    Write-Host "1. Add your entities in $basePath\domain\entities\" -ForegroundColor White
    Write-Host "2. Create repository interfaces in $basePath\domain\repositories\" -ForegroundColor White
    Write-Host "3. Implement use cases in $basePath\domain\usecases\" -ForegroundColor White
    Write-Host "4. Add data models in $basePath\data\models\" -ForegroundColor White
    Write-Host "5. Implement repositories in $basePath\data\repositories\" -ForegroundColor White
    Write-Host "6. Create datasources in $basePath\data\datasources\" -ForegroundColor White
    Write-Host "7. Build UI components in $basePath\presentation\" -ForegroundColor White
    Write-Host ""
    Write-Host "💡 Don't forget to remove .gitkeep files when you add actual files!" -ForegroundColor Magenta
}

# Main execution
try {
    New-FeatureStructure -FeatureName $Name
} catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
