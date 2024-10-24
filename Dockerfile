# Use the official Python image from the Docker Hub
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app



# Copy the rest of the application code to the working directory
COPY . .

# Expose the port on which your Python app will run (optional, depending on your app)
EXPOSE 5000  

# Define the command to run your app using a Python entry point (adjust according to your app's main file)
CMD ["python", "app.py"]
