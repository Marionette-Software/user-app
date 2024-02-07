#Stage 1 - Install dependencies and build the app
FROM debian:latest AS build-env

# Install flutter dependencies
RUN apt-get update
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3
RUN apt-get clean

# Clone the flutter repo
RUN git clone --branch 3.13.2  https://github.com/flutter/flutter.git /usr/local/flutter

# Set flutter path
# RUN /usr/local/flutter/bin/flutter doctor -v
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Run flutter doctor
RUN flutter doctor -v
# Enable flutter web
RUN flutter config --enable-web

# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter pub get
#RUN flutter build web --release --pwa-strategy none
RUN flutter build web --release --web-renderer auto




# Stage 2 - Create the run-time image
FROM nginx:mainline-alpine
COPY --from=build-env /app/build/web /usr/share/nginx/html
COPY --from=build-env /app/assets/icons  /usr/share/nginx/html/assets/icons
#COPY --from=build-env /app/assets/fonts /usr/share/nginx/html/assets/fonts
COPY --from=build-env /app/assets/lang  /usr/share/nginx/html/assets/lang
COPY --from=build-env /app/assets/version.txt  /usr/share/nginx/html/assets/version.txt


EXPOSE 3000
