FROM alpine:3.11
RUM mkdir -p /usr/local/app
WORKDIR /usr/local/app
RUN apk add --no-cache bash wget node npm
RUN export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"
RUN nvm install node && nvm run node --version
RUN npm install -g dashing-js
RUN npm install jenkins-api && npm install cron && npm install moment && npm install request $$ npm install memory-cache
RUN dashing-js install https://github.com/kj187/dashing-jenkins_job/archive/master.zip && mkdir config && mv widgets/jenkins_job/config.jenkins_job.sample.js config.jenkins_job.js
