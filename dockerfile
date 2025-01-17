# Usa la imagen oficial de Node.js como base
FROM node:16

# Crea y establece el directorio de trabajo
WORKDIR /usr/src/app

# Copia los archivos package.json y package-lock.json
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Copia el resto del código de la aplicación
COPY . .

# Expone el puerto en el que la aplicación correrá
EXPOSE 4000

# Comando para iniciar la aplicación
CMD [ "sh", "-c", "npx prisma migrate deploy && npx prisma generate && node index.js" ]
