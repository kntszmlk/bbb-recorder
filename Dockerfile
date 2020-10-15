#Download base image debian
FROM  node

# Create app directory
WORKDIR /root
# LABEL about the custom image
RUN mkdir /root/bbb-recorder
#Update Software Repository
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
#RUN apt-get -y curl
RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
RUN apt-get -y update
RUN apt-get -y install google-chrome-stable
RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:jonathonf/ffmpeg-4
#RUN apt-get -y update
RUN apt-get -y install ffmpeg
RUN apt -y install xvfb
RUN apt -y install gconf-service libgconf-2-4 libappindicator1 fonts-noto
#RUN git clone https://github.com/jibon57/bbb-recorder

WORKDIR /root/bbb-recorder
COPY . .
RUN npm install --ignore-scripts
