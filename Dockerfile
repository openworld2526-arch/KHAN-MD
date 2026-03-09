FROM node:lts-buster

# Set working directory
WORKDIR /app

# Copy all local files to container
COPY . .

# Install dependencies
RUN npm install && npm install -g pm2

# Expose the port your app listens on
EXPOSE 9090

# Start the app
CMD ["npm", "start"]

# RUN git clone https://github.com/openworld2526-arch/KHAN-MD . && \
    npm install

