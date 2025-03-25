#Image Node.js versi 14
FROM node:14

#Working directory container
WORKDIR /app

#Menyalin seluruh source code ke working directory
COPY . .

#Menjalankan aplikasi dalam production mode dan item-db sebagai database host
ENV NODE_ENV=production
ENV DB_HOST=item-db

#Menginstall dependencies untuk production dan build app
RUN npm install --production --unsafe-perm && npm run build

#Mengekspos port 8080
EXPOSE 8080

#Menjalankan app
CMD ["npm","start"]
