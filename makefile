# Temporal make file to manage the project, needed to test it further because executing venv with makefile
# is not working properly

# Variables
VENV_DIR = .venv
ACTIVATE = source $(VENV_DIR)/bin/activate

.PHONY: venv down run

# Activate the virtual environment
venv:
	@echo "Activating the virtual environment... $(ACTIVATE)"
	@/bin/sh -c '$(ACTIVATE)'

# Install dependencies in the virtual environment
install: venv
	@echo "Installing dependencies..."
	@pip install -r requirements.txt

# Generate requirements.txt file
freeze: venv
	@echo "Generating requirements.txt file..."
	@pip freeze > requirements.txt

# Stop runserver on port 8000
kill:
	@echo "Stopping processes on port 8000..."
	@lsof -i :8000 | awk 'NR>1 {print $2}' | xargs -r kill -9