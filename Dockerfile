# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory to /code
WORKDIR /code

# Copy the requirements file into the container and install dependencies
COPY requirements.txt /code/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project code into the container
COPY ./application /code/

# Set environment variables
ENV DJANGO_SETTINGS_MODULE=application.settings
ENV PYTHONUNBUFFERED=1

# Start the Django development server when the container starts
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]