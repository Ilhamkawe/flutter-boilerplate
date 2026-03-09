@echo off
setlocal enabledelayedexpansion

if "%1"=="" (
    echo Error: Please provide a feature name
    echo Usage: create-feature.bat ^<feature_name^>
    echo Example: create-feature.bat authentication
    exit /b 1
)

set "FEATURE_NAME=%1"
echo Creating feature: %FEATURE_NAME%
echo Creating directory structure...

rem Create main feature directory
if not exist "lib\src\feature\%FEATURE_NAME%" mkdir "lib\src\feature\%FEATURE_NAME%"

rem Create data layer directories
if not exist "lib\src\feature\%FEATURE_NAME%\data\datasources" mkdir "lib\src\feature\%FEATURE_NAME%\data\datasources"
if not exist "lib\src\feature\%FEATURE_NAME%\data\models" mkdir "lib\src\feature\%FEATURE_NAME%\data\models"
if not exist "lib\src\feature\%FEATURE_NAME%\data\repositories" mkdir "lib\src\feature\%FEATURE_NAME%\data\repositories"

rem Create domain layer directories
if not exist "lib\src\feature\%FEATURE_NAME%\domain\entities" mkdir "lib\src\feature\%FEATURE_NAME%\domain\entities"
if not exist "lib\src\feature\%FEATURE_NAME%\domain\repositories" mkdir "lib\src\feature\%FEATURE_NAME%\domain\repositories"
if not exist "lib\src\feature\%FEATURE_NAME%\domain\usecases" mkdir "lib\src\feature\%FEATURE_NAME%\domain\usecases"

rem Create presentation layer directories
if not exist "lib\src\feature\%FEATURE_NAME%\presentation\pages" mkdir "lib\src\feature\%FEATURE_NAME%\presentation\pages"
if not exist "lib\src\feature\%FEATURE_NAME%\presentation\providers" mkdir "lib\src\feature\%FEATURE_NAME%\presentation\providers"
if not exist "lib\src\feature\%FEATURE_NAME%\presentation\widgets" mkdir "lib\src\feature\%FEATURE_NAME%\presentation\widgets"

echo Creating placeholder files...

rem Create .gitkeep files
echo. > lib\src\feature\%FEATURE_NAME%\data\datasources\.gitkeep
echo. > lib\src\feature\%FEATURE_NAME%\data\models\.gitkeep
echo. > lib\src\feature\%FEATURE_NAME%\data\repositories\.gitkeep
echo. > lib\src\feature\%FEATURE_NAME%\domain\entities\.gitkeep
echo. > lib\src\feature\%FEATURE_NAME%\domain\repositories\.gitkeep
echo. > lib\src\feature\%FEATURE_NAME%\domain\usecases\.gitkeep
echo. > lib\src\feature\%FEATURE_NAME%\presentation\pages\.gitkeep
echo. > lib\src\feature\%FEATURE_NAME%\presentation\providers\.gitkeep
echo. > lib\src\feature\%FEATURE_NAME%\presentation\widgets\.gitkeep

rem Create README.md
echo # %FEATURE_NAME% Feature > lib\src\feature\%FEATURE_NAME%\README.md
echo. >> lib\src\feature\%FEATURE_NAME%\README.md
echo ## Overview >> lib\src\feature\%FEATURE_NAME%\README.md
echo Description of the %FEATURE_NAME% feature. >> lib\src\feature\%FEATURE_NAME%\README.md
echo. >> lib\src\feature\%FEATURE_NAME%\README.md
echo ## Architecture >> lib\src\feature\%FEATURE_NAME%\README.md
echo This feature follows Clean Architecture principles: >> lib\src\feature\%FEATURE_NAME%\README.md
echo. >> lib\src\feature\%FEATURE_NAME%\README.md
echo ### Data Layer >> lib\src\feature\%FEATURE_NAME%\README.md
echo - **datasources/**: Remote and local data sources >> lib\src\feature\%FEATURE_NAME%\README.md
echo - **models/**: Data transfer objects >> lib\src\feature\%FEATURE_NAME%\README.md
echo - **repositories/**: Repository implementations >> lib\src\feature\%FEATURE_NAME%\README.md
echo. >> lib\src\feature\%FEATURE_NAME%\README.md
echo ### Domain Layer >> lib\src\feature\%FEATURE_NAME%\README.md
echo - **entities/**: Business objects >> lib\src\feature\%FEATURE_NAME%\README.md
echo - **repositories/**: Repository interfaces >> lib\src\feature\%FEATURE_NAME%\README.md
echo - **usecases/**: Business logic use cases >> lib\src\feature\%FEATURE_NAME%\README.md
echo. >> lib\src\feature\%FEATURE_NAME%\README.md
echo ### Presentation Layer >> lib\src\feature\%FEATURE_NAME%\README.md
echo - **pages/**: Screen widgets >> lib\src\feature\%FEATURE_NAME%\README.md
echo - **providers/**: Riverpod state management >> lib\src\feature\%FEATURE_NAME%\README.md
echo - **widgets/**: Reusable UI components >> lib\src\feature\%FEATURE_NAME%\README.md
echo. >> lib\src\feature\%FEATURE_NAME%\README.md
echo ## Usage >> lib\src\feature\%FEATURE_NAME%\README.md
echo How to use this feature in the application. >> lib\src\feature\%FEATURE_NAME%\README.md

echo ✅ Feature '%FEATURE_NAME%' created successfully!
echo 📁 Location: lib\src\feature\%FEATURE_NAME%
echo.
echo Next steps:
echo 1. Add your entities in lib\src\feature\%FEATURE_NAME%\domain\entities\
echo 2. Create repository interfaces in lib\src\feature\%FEATURE_NAME%\domain\repositories\
echo 3. Implement use cases in lib\src\feature\%FEATURE_NAME%\domain\usecases\
echo 4. Add data models in lib\src\feature\%FEATURE_NAME%\data\models\
echo 5. Implement repositories in lib\src\feature\%FEATURE_NAME%\data\repositories\
echo 6. Create datasources in lib\src\feature\%FEATURE_NAME%\data\datasources\
echo 7. Build UI components in lib\src\feature\%FEATURE_NAME%\presentation\
echo.
echo 💡 Don't forget to remove .gitkeep files when you add actual files!
echo.
echo ✨ Feature creation complete!
