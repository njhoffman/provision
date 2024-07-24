docker build -t puppeteer-chrome-linux .
Run the container by passing node -e "<yourscript.js content as a string>" as the command:

 docker run -i --init --rm --cap-add=SYS_ADMIN \
   --name puppeteer-chrome puppeteer-chrome-linux \
   node -e "`cat yourscript.js`"https://github.com/ebidel/try-puppeteer