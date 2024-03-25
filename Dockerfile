# Use Python 3.11 as the base Image
FROM python:3.11

# Set working directory in the container
WORKDIR /usr/src/app

#Install Poetry
RUN pip install Poetry

#Copy the Poetry configuration files
COPY pyproject.toml poetry.lock* ./

#Configure Poetry: Disable the creation of virtual environment 
# and install dependencies (excluding development dependencies)
RUN poetry config virtualenvs.create false
RUN poetry install --no-dev

# Copy your porject into the container
COPY . .

# Environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

#Run Django commands for migrations
RUN python manage.py makemigrations
RUN python manage.py migrate

# Command to start your django application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

