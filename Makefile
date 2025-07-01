PACKAGES := $(wildcard packages/*)

# Platform detection
ifeq ($(OS),Windows_NT)
    POWERSHELL := powershell -NoProfile -ExecutionPolicy Bypass -Command
    PLATFORM := Windows
else
    PLATFORM := Unix
endif

print:
ifeq ($(PLATFORM),Windows)
	@echo "Available packages:"
	@$(POWERSHELL) "Get-ChildItem -Path packages -Directory | Select-Object -ExpandProperty Name"
else
	@echo "Available packages:"
	@for package in $(PACKAGES); do \
		echo $${package} ; \
	done
endif

pods-clean:
ifeq ($(PLATFORM),Windows)
	@$(POWERSHELL) "if (Test-Path 'ios\Pods') { Remove-Item -Recurse -Force 'ios\Pods' }"
	@$(POWERSHELL) "if (Test-Path 'ios\.symlinks') { Remove-Item -Recurse -Force 'ios\.symlinks' }"
	@$(POWERSHELL) "if (Test-Path 'ios\Flutter\Flutter.framework') { Remove-Item -Recurse -Force 'ios\Flutter\Flutter.framework' }"
	@$(POWERSHELL) "if (Test-Path 'ios\Flutter\Flutter.podspec') { Remove-Item -Recurse -Force 'ios\Flutter\Flutter.podspec' }"
	@$(POWERSHELL) "if (Test-Path 'ios\Podfile') { Remove-Item -Force 'ios\Podfile' }"
	@$(POWERSHELL) "if (Test-Path 'ios\Podfile.lock') { Remove-Item -Force 'ios\Podfile.lock' }"
	@echo "iOS pods cleaned successfully."
else
	@rm -Rf ios/Pods
	@rm -Rf ios/.symlinks
	@rm -Rf ios/Flutter/Flutter.framework
	@rm -Rf ios/Flutter/Flutter.podspec
	@rm -f ios/Podfile
	@rm -f ios/Podfile.lock
	@echo "iOS pods cleaned successfully."
endif

get:
	@echo "Getting dependencies for main project..."
	@flutter pub get
ifeq ($(PLATFORM),Windows)
	@echo "Getting dependencies for packages..."
	@$(POWERSHELL) "$$exitCode = 0; Get-ChildItem -Path packages -Directory | ForEach-Object { $$pkgPath = Join-Path -Path 'packages' -ChildPath $$_; if (Test-Path \"$$pkgPath\pubspec.yaml\") { Write-Host \"Getting dependencies for $$_\"; Set-Location \"$$pkgPath\"; flutter pub get; if ($$LASTEXITCODE -ne 0) { $$exitCode = 1 }; Set-Location -Path \"..\..\"; } else { Write-Host \"Skipping $$_ (no pubspec.yaml found)\" -ForegroundColor Yellow } }; exit $$exitCode"
else
	@for package in $(PACKAGES); do \
		echo "Getting dependencies on $${package}" ; \
		(cd $${package} && [ -f "pubspec.yaml" ] && flutter pub get) || { echo "Error getting dependencies for $${package}" ; exit 1; } ; \
	done
endif
	@echo "All dependencies retrieved successfully."

upgrade:
	@echo "Upgrading dependencies for main project..."
	@flutter pub upgrade
ifeq ($(PLATFORM),Windows)
	@echo "Upgrading dependencies for packages..."
	@$(POWERSHELL) "$$exitCode = 0; Get-ChildItem -Path packages -Directory | ForEach-Object { $$pkgPath = Join-Path -Path 'packages' -ChildPath $$_; if (Test-Path \"$$pkgPath\pubspec.yaml\") { Write-Host \"Upgrading dependencies for $$_\"; Set-Location \"$$pkgPath\"; flutter pub upgrade; if ($$LASTEXITCODE -ne 0) { $$exitCode = 1 }; Set-Location -Path \"..\..\"; } else { Write-Host \"Skipping $$_ (no pubspec.yaml found)\" -ForegroundColor Yellow } }; exit $$exitCode"
else
	@for package in $(PACKAGES); do \
		echo "Upgrading dependencies on $${package}" ; \
		(cd $${package} && [ -f "pubspec.yaml" ] && flutter pub upgrade) || { echo "Error upgrading dependencies for $${package}" ; exit 1; } ; \
	done
endif
	@echo "All dependencies upgraded successfully."

lint:
	@echo "Running lint..."
	@flutter analyze

format:
	@echo "Formatting main project..."
	@dart format --set-exit-if-changed .
ifeq ($(PLATFORM),Windows)
	@echo "Formatting packages..."
	@$(POWERSHELL) "Get-ChildItem -Path packages -Directory | ForEach-Object { $$pkgPath = Join-Path -Path 'packages' -ChildPath $$_; if (Test-Path \"$$pkgPath\pubspec.yaml\") { Write-Host \"Formatting $$_\"; Set-Location \"$$pkgPath\"; dart format --set-exit-if-changed .; Set-Location -Path \"..\..\"; } else { Write-Host \"Skipping $$_ (no pubspec.yaml found)\" -ForegroundColor Yellow } }"
else
	@for package in $(PACKAGES); do \
		echo "Formatting $${package}" ; \
		if [ -f "$${package}/pubspec.yaml" ]; then \
			(cd $${package} && dart format --set-exit-if-changed .) || true ; \
		else \
			echo "Skipping $${package} (no pubspec.yaml found)" ; \
		fi \
	done
endif
	@echo "All formatting completed."

testing:
	@echo "Running tests for main project..."
	@flutter test
ifeq ($(PLATFORM),Windows)
	@echo "Running tests for packages..."
	@$(POWERSHELL) "$$exitCode = 0; Get-ChildItem -Path packages -Directory | ForEach-Object { $$pkgPath = Join-Path -Path 'packages' -ChildPath $$_; if (Test-Path \"$$pkgPath\pubspec.yaml\") { Write-Host \"Running tests for $$_\"; Set-Location \"$$pkgPath\"; flutter test; if ($$LASTEXITCODE -ne 0) { $$exitCode = 1 }; Set-Location -Path \"..\..\"; } else { Write-Host \"Skipping $$_ (no pubspec.yaml found)\" -ForegroundColor Yellow } }; exit $$exitCode"
else
	@for package in $(PACKAGES); do \
		echo "Running tests on $${package}" ; \
		if [ -f "$${package}/pubspec.yaml" ]; then \
			(cd $${package} && flutter test) || { echo "Tests failed for $${package}" ; exit 1; } ; \
		else \
			echo "Skipping $${package} (no pubspec.yaml found)" ; \
		fi \
	done
endif
	@echo "All tests completed successfully."

test-coverage:
	@echo "Running test coverage for main project..."
	@flutter test --coverage
ifeq ($(PLATFORM),Windows)
	@echo "Running test coverage for packages..."
	@$(POWERSHELL) "$$exitCode = 0; Get-ChildItem -Path packages -Directory | ForEach-Object { $$pkgPath = Join-Path -Path 'packages' -ChildPath $$_; if (Test-Path \"$$pkgPath\pubspec.yaml\") { Write-Host \"Running test coverage for $$_\"; Set-Location \"$$pkgPath\"; flutter test --coverage; if ($$LASTEXITCODE -ne 0) { $$exitCode = 1 }; Set-Location -Path \"..\..\"; } else { Write-Host \"Skipping $$_ (no pubspec.yaml found)\" -ForegroundColor Yellow } }; exit $$exitCode"
else
	@for package in $(PACKAGES); do \
		echo "Running test coverage on $${package}" ; \
		if [ -f "$${package}/pubspec.yaml" ]; then \
			(cd $${package} && flutter test --coverage) || { echo "Test coverage failed for $${package}" ; exit 1; } ; \
		else \
			echo "Skipping $${package} (no pubspec.yaml found)" ; \
		fi \
	done
endif
	@echo "All test coverage completed successfully."

clean:
	@echo "Cleaning main project..."
	@flutter clean
ifeq ($(PLATFORM),Windows)
	@echo "Cleaning packages..."
	@$(POWERSHELL) "$$exitCode = 0; Get-ChildItem -Path packages -Directory | ForEach-Object { $$pkgPath = Join-Path -Path 'packages' -ChildPath $$_; if (Test-Path \"$$pkgPath\pubspec.yaml\") { Write-Host \"Cleaning $$_\"; Set-Location \"$$pkgPath\"; flutter clean; if ($$LASTEXITCODE -ne 0) { $$exitCode = 1 }; Set-Location -Path \"..\..\"; } else { Write-Host \"Skipping $$_ (no pubspec.yaml found)\" -ForegroundColor Yellow } }; exit $$exitCode"
else
	@for package in $(PACKAGES); do \
		echo "Cleaning $${package}" ; \
		if [ -f "$${package}/pubspec.yaml" ]; then \
			(cd $${package} && flutter clean) || { echo "Cleaning failed for $${package}" ; exit 1; } ; \
		else \
			echo "Skipping $${package} (no pubspec.yaml found)" ; \
		fi \
	done
endif
	@echo "All cleaning completed successfully."

genFiles:
	@echo "Generating files for main project..."
	@flutter packages pub run build_runner build --delete-conflicting-outputs
ifeq ($(PLATFORM),Windows)
	@echo "Generating files for packages..."
	@$(POWERSHELL) "$$exitCode = 0; Get-ChildItem -Path packages -Directory | ForEach-Object { $$pkgPath = Join-Path -Path 'packages' -ChildPath $$_; if (Test-Path \"$$pkgPath\pubspec.yaml\") { Write-Host \"Running build_runner for $$_\"; Set-Location \"$$pkgPath\"; flutter packages pub run build_runner build --delete-conflicting-outputs; if ($$LASTEXITCODE -ne 0) { $$exitCode = 1 }; Set-Location -Path \"..\..\"; } else { Write-Host \"Skipping $$_ (no pubspec.yaml found)\" -ForegroundColor Yellow } }; exit $$exitCode"
else
	@for package in $(PACKAGES); do \
		echo "Running build_runner on $${package}" ; \
		if [ -f "$${package}/pubspec.yaml" ]; then \
			(cd $${package} && flutter packages pub run build_runner build --delete-conflicting-outputs) || { echo "File generation failed for $${package}" ; exit 1; } ; \
		else \
			echo "Skipping $${package} (no pubspec.yaml found)" ; \
		fi \
	done
endif
	@echo "All files generated successfully."

genFiles-watch:
	@echo "Generating files (watch mode) for main project..."
	@flutter packages pub run build_runner build --delete-conflicting-outputs
ifeq ($(PLATFORM),Windows)
	@echo "Generating watch mode files for packages..."
	@$(POWERSHELL) "$$exitCode = 0; Get-ChildItem -Path packages -Directory | ForEach-Object { $$pkgPath = Join-Path -Path 'packages' -ChildPath $$_; if (Test-Path \"$$pkgPath\pubspec.yaml\") { Write-Host \"Running build_runner watch for $$_\"; Set-Location \"$$pkgPath\"; flutter packages pub run build_runner build --delete-conflicting-outputs; if ($$LASTEXITCODE -ne 0) { $$exitCode = 1 }; Set-Location -Path \"..\..\"; } else { Write-Host \"Skipping $$_ (no pubspec.yaml found)\" -ForegroundColor Yellow } }; exit $$exitCode"
else
	@for package in $(PACKAGES); do \
		echo "Running build_runner watch on $${package}" ; \
		if [ -f "$${package}/pubspec.yaml" ]; then \
			(cd $${package} && flutter packages pub run build_runner build --delete-conflicting-outputs) || { echo "File generation (watch) failed for $${package}" ; exit 1; } ; \
		else \
			echo "Skipping $${package} (no pubspec.yaml found)" ; \
		fi \
	done
endif
	@echo "All watch mode file generation completed."

build-runner:
	@echo "Running build-runner for main project..."
	@flutter pub run build_runner build --delete-conflicting-outputs
ifeq ($(PLATFORM),Windows)
	@echo "Running build-runner for packages..."
	@$(POWERSHELL) "$$exitCode = 0; Get-ChildItem -Path packages -Directory | ForEach-Object { $$pkgPath = Join-Path -Path 'packages' -ChildPath $$_; if (Test-Path \"$$pkgPath\pubspec.yaml\") { Write-Host \"Running build_runner for $$_\"; Set-Location \"$$pkgPath\"; flutter pub run build_runner build --delete-conflicting-outputs; if ($$LASTEXITCODE -ne 0) { $$exitCode = 1 }; Set-Location -Path \"..\..\"; } else { Write-Host \"Skipping $$_ (no pubspec.yaml found)\" -ForegroundColor Yellow } }; exit $$exitCode"
else
	@for package in $(PACKAGES); do \
		echo "Running build-runner on $${package}" ; \
		if [ -f "$${package}/pubspec.yaml" ]; then \
			(cd $${package} && flutter pub run build_runner build --delete-conflicting-outputs) || { echo "build-runner failed for $${package}" ; exit 1; } ; \
		else \
			echo "Skipping $${package} (no pubspec.yaml found)" ; \
		fi \
	done
endif
	@echo "All build-runner tasks completed successfully."
