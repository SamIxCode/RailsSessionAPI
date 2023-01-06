import os
import subprocess

# Create virtual environment
subprocess.run(["python3", "-m", "venv", "venv"])

# Activate virtual environment
subprocess.run(["./venv/bin/activate"])

# Install dependencies from Gemfile
subprocess.run(["bundle", "install"])

# Install requirements from requirements.txt
subprocess.run(["pip", "install", "-r", "storage/RoR_aiohttp/requirements.txt"])

# Check if postgres database exists
if "session_apionly_development" not in subprocess.run(["psql", "-l"]).stdout:
    # Create postgres database
    subprocess.run(["createdb", "session_apionly_development"])

# Run rails db:migrate
subprocess.run(["rails", "db:migrate"])
