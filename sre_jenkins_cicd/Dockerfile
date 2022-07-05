# choose the base image
FROM node:16.9.0
ENV NODE_ENV=production
# label add info about the creator of this image - optional
LABEL MAINTAINER=shazid.tipu@gmail.com

# copy the app from localhost to the container
WORKDIR /app
COPY /app .
RUN npm install --production

# Expose the required port
EXPOSE 3000

# Run the command to launch the server/container - create container
CMD ["node", "app.js"]
# docker run -dp 3000:3000 node shazid98/eng114-shazid-app