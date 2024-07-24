# cd to Puppeteer cache directory (adjust the path if using a different cache directory).
cd ~/.cache/puppeteer/chrome/linux-<version>/chrome-linux64/
sudo chown root:root chrome_sandbox
sudo chmod 4755 chrome_sandbox
# copy sandbox executable to a shared location
sudo cp -p chrome_sandbox /usr/local/sbin/chrome-devel-sandbox
# export CHROME_DEVEL_SANDBOX env variable
export CHROME_DEVEL_SANDBOX=/usr/local/sbin/chrome-devel-sandbox
You might want to export the CHROME_DEVEL_SANDBOX env variable by default. In this case, add the following to the ~/.bashrc or .zshenv:

export CHROME_DEVEL_SANDBOX=/usr/local/sbin/chrome-devel-sandbox
or to your Dockerfile:

ENV CHROME_DEVEL_SANDBOX /usr/local/sbin/chrome-devel-sandbox