# Use the official Nginx image as our base image
# This gives us a pre-configured Linux environment with Nginx already installed
# "latest" means we want the most recent stable version of Nginx
FROM nginx:latest

# Copy our custom HTML file to replace the default Nginx welcome page
# This takes our local index.html file and places it in the container's web directory
# /usr/share/nginx/html/ is where Nginx serves static files from by default
# So when someone visits our website, they'll see our custom page instead of the default Nginx page
COPY index.html /usr/share/nginx/html/index.html

# Tell Docker that this container will listen on port 80
# Port 80 is the standard port for web traffic (HTTP)
# This doesn't actually open the port - it just documents that the container uses it
# The actual port mapping happens when you run the container with docker run -p
EXPOSE 80
# Start the Nginx web server in the foreground
# The "-g" flag allows us to pass global directives to Nginx
# "daemon off;" tells Nginx to run in the foreground instead of as a background daemon
# This is essential for Docker containers because:
# 1. Docker containers need a foreground process to stay alive
# 2. If Nginx runs as a daemon (background process), the container will immediately exit
# 3. Running in foreground allows Docker to properly manage the container lifecycle
# 4. Any output/logs from Nginx will be visible in Docker logs
CMD ["nginx", "-g", "daemon off;"]