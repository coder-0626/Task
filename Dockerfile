# Use official nginx image as base
FROM nginx:alpine

# Copy static files to nginx directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Command to run nginx
CMD ["nginx", "-g", "daemon off;"]
