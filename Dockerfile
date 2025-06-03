# Dockerfile is create DockerImage
# With the help of this file whatever information i am writing, This file will actually create a docker image
# This Docker image can be taken and it can be run within a container in any operating system.

# Describing the Base Image
FROM python:3.11

# Copy from current location to location which i am going to name it as app
COPY . /app 

# Use the destination of the copied location as WORKDIR
WORKDIR /app

# Install all the required dependencies
RUN pip install -r requirements.txt

# When the DockerImage is run as a container in order to access the application inside the container,
# we have to expose some port only then, we will be able to access that particular entire URL(application).
# This port is write in the form of PlaceHolder($PORT). Because this value when we are deploying into the cloud/server, 
# the cloud/server is going to automatically assign this particular port in that container.
EXPOSE $PORT

# this is used to run my web application 
# gunicorn actually helps you to run the entire python web application inside the heroku cloud 
# bind 0.0.0.0 ip address will be local address in the heroku cloud 
# 1st app is name of the python file
# 2nd app is the name of the application in the python file eg : app = Flask(__name__) # Starting point of my application
CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app 