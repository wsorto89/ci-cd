# Use an official Nginx image as the base
FROM nginx:alpine

# Copy build files to Nginx’s HTML folder
COPY build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
