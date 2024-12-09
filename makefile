# Temporal make file to manage the project, needed to test it further because executing venv with makefile
# is not working properly because shell venv session is lost

# Variables
VENV_DIR = .venv
ACTIVATE = source $(VENV_DIR)/bin/activate

.PHONY: venv down run test

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

test: venv
	@echo "Running tests..."
#     This run tests as default on doc, but with coverage execution like this the coverage report is gathered.
#     @python manage.py test
	@coverage run --source='.' manage.py test myapp
	@coverage report
