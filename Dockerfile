FROM node:24.1-slim

# Cấu hình Timezone
ENV TZ=Asia/Ho_Chi_Minh

# Báo cho Puppeteer biết đường dẫn tới Chromium của hệ thống
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Cài đặt các thư viện nặng (LibreOffice, Chromium, Fonts...)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libreoffice \
    fonts-dejavu \
    chromium \
    ca-certificates \
    tzdata && \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*