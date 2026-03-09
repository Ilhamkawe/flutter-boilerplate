# Makefile for creating new features in Flutter project
# Usage: make feature NAME=<feature_name>

.PHONY: feature help

# Default target
help:
	@echo "Available commands:"
	@echo "  make feature NAME=<feature_name>  - Create a new feature with clean architecture structure"
	@echo ""
	@echo "Example:"
	@echo "  make feature NAME=profile"
	@echo "  make feature NAME=settings"
	@echo ""
	@echo "This will create the following structure:"
	@echo "  lib/src/feature/<feature_name>/"
	@echo "  ├── data/"
	@echo "  │   ├── datasources/"
	@echo "  │   ├── models/"
	@echo "  │   └── repositories/"
	@echo "  ├── domain/"
	@echo "  │   ├── entities/"
	@echo "  │   ├── repositories/"
	@echo "  │   └── usecases/"
	@echo "  └── presentation/"
	@echo "      ├── pages/"
	@echo "      ├── providers/"
	@echo "      └── widgets/"

# Create new feature
feature:
ifeq ($(NAME),)
	$(error Error: Please provide a feature name. Usage: make feature NAME=<feature_name>)
endif
	@echo Creating feature: $(NAME)
	@echo Creating directory structure...
	
# Create main feature directory
	@if not exist "lib\src\feature\$(NAME)" mkdir "lib\src\feature\$(NAME)"
	
# Create data layer directories
	@if not exist "lib\src\feature\$(NAME)\data\datasources" mkdir "lib\src\feature\$(NAME)\data\datasources"
	@if not exist "lib\src\feature\$(NAME)\data\models" mkdir "lib\src\feature\$(NAME)\data\models"
	@if not exist "lib\src\feature\$(NAME)\data\repositories" mkdir "lib\src\feature\$(NAME)\data\repositories"
	
# Create domain layer directories
	@if not exist "lib\src\feature\$(NAME)\domain\entities" mkdir "lib\src\feature\$(NAME)\domain\entities"
	@if not exist "lib\src\feature\$(NAME)\domain\repositories" mkdir "lib\src\feature\$(NAME)\domain\repositories"
	@if not exist "lib\src\feature\$(NAME)\domain\usecases" mkdir "lib\src\feature\$(NAME)\domain\usecases"
	
# Create presentation layer directories
	@if not exist "lib\src\feature\$(NAME)\presentation\pages" mkdir "lib\src\feature\$(NAME)\presentation\pages"
	@if not exist "lib\src\feature\$(NAME)\presentation\providers" mkdir "lib\src\feature\$(NAME)\presentation\providers"
	@if not exist "lib\src\feature\$(NAME)\presentation\widgets" mkdir "lib\src\feature\$(NAME)\presentation\widgets"
	
	@echo Creating placeholder files...
	
# Data layer files
	@echo. > lib\src\feature\$(NAME)\data\datasources\.gitkeep
	@echo. > lib\src\feature\$(NAME)\data\models\.gitkeep
	@echo. > lib\src\feature\$(NAME)\data\repositories\.gitkeep
	
# Domain layer files
	@echo. > lib\src\feature\$(NAME)\domain\entities\.gitkeep
	@echo. > lib\src\feature\$(NAME)\domain\repositories\.gitkeep
	@echo. > lib\src\feature\$(NAME)\domain\usecases\.gitkeep
	
# Presentation layer files
	@echo. > lib\src\feature\$(NAME)\presentation\pages\.gitkeep
	@echo. > lib\src\feature\$(NAME)\presentation\providers\.gitkeep
	@echo. > lib\src\feature\$(NAME)\presentation\widgets\.gitkeep
	
# Create README for the feature
	@echo # $(NAME) Feature > lib\src\feature\$(NAME)\README.md
	@echo. >> lib\src\feature\$(NAME)\README.md
	@echo ## Overview >> lib\src\feature\$(NAME)\README.md
	@echo Description of the $(NAME) feature. >> lib\src\feature\$(NAME)\README.md
	@echo. >> lib\src\feature\$(NAME)\README.md
	@echo ## Architecture >> lib\src\feature\$(NAME)\README.md
	@echo This feature follows Clean Architecture principles: >> lib\src\feature\$(NAME)\README.md
	@echo. >> lib\src\feature\$(NAME)\README.md
	@echo ### Data Layer >> lib\src\feature\$(NAME)\README.md
	@echo - **datasources/**: Remote and local data sources >> lib\src\feature\$(NAME)\README.md
	@echo - **models/**: Data transfer objects >> lib\src\feature\$(NAME)\README.md
	@echo - **repositories/**: Repository implementations >> lib\src\feature\$(NAME)\README.md
	@echo. >> lib\src\feature\$(NAME)\README.md
	@echo ### Domain Layer >> lib\src\feature\$(NAME)\README.md
	@echo - **entities/**: Business objects >> lib\src\feature\$(NAME)\README.md
	@echo - **repositories/**: Repository interfaces >> lib\src\feature\$(NAME)\README.md
	@echo - **usecases/**: Business logic use cases >> lib\src\feature\$(NAME)\README.md
	@echo. >> lib\src\feature\$(NAME)\README.md
	@echo ### Presentation Layer >> lib\src\feature\$(NAME)\README.md
	@echo - **pages/**: Screen widgets >> lib\src\feature\$(NAME)\README.md
	@echo - **providers/**: Riverpod state management >> lib\src\feature\$(NAME)\README.md
	@echo - **widgets/**: Reusable UI components >> lib\src\feature\$(NAME)\README.md
	@echo. >> lib\src\feature\$(NAME)\README.md
	@echo ## Usage >> lib\src\feature\$(NAME)\README.md
	@echo How to use this feature in the application. >> lib\src\feature\$(NAME)\README.md
	
	@echo ✅ Feature '$(NAME)' created successfully!
	@echo 📁 Location: lib\src\feature\$(NAME)
	@echo.
	@echo Next steps:
	@echo 1. Add your entities in lib\src\feature\$(NAME)\domain\entities
	@echo 2. Create repository interfaces in lib\src\feature\$(NAME)\domain\repositories
	@echo 3. Implement use cases in lib\src\feature\$(NAME)\domain\usecases
	@echo 4. Add data models in lib\src\feature\$(NAME)\data\models
	@echo 5. Implement repositories in lib\src\feature\$(NAME)\data\repositories
	@echo 6. Create datasources in lib\src\feature\$(NAME)\data\datasources
	@echo 7. Build UI components in lib\src\feature\$(NAME)\presentation
	@echo.
	@echo 💡 Don't forget to remove .gitkeep files when you add actual files!
