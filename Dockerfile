# 1. تحديد بيئة التشغيل الأساسية (Node.js)
FROM node:lts-buster

# 2. تثبيت برامج معالجة الصور والفيديو (ضرورية للملصقات والفيديوهات)
RUN apt-get update && apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

# 3. تحديد المجلد الذي سيعمل فيه البوت داخل السيرفر
WORKDIR /app

# 4. سحب الكود من الـ Fork الخاص بك (استبدل YOUR_USERNAME باسمك في GitHub)
RUN git clone https://github.com/openworld2526-arch/KHAN-MD

# 5. تثبيت المكتبات البرمجية الضرورية لتشغيل البوت
RUN npm install && npm install -g pm2

# 6. تعريف المتغيرات البيئية (هنا تضع رقمك للربط)
ENV OWNER_NUMBER=212679226276
ENV SESSION_ID=

# 7. فتح المنفذ الذي تتطلبه منصة Railway
EXPOSE 9090

# 8. الأمر النهائي لتشغيل البوت
CMD ["npm", "start"]
