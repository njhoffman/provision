chrome-headless-shell disables GPU compositing
chrome-headless-shell requires --enable-gpu to enable GPU acceleration in headless mode.

const browser = await puppeteer.launch({
  headless: 'shell',
  args: ['--enable-gpu'],
});
Setting up GPU with Chrome
Generally, Chrome should be able to detect and enable GPU if the system has appropriate drivers. For additional tips, see the following blog post https://developer.chrome.com/blog/supercharge-web-ai-testing.

Setting Up Chrome Linux Sandbox
In order to protect the host environment from untrusted web content, Chrome uses multiple layers of sandboxing. For this to work properly, the host should be configured first. If there's no good sandbox for Chrome to use, it will crash with the error No usable sandbox!.

If you absolutely trust the content you open in Chrome, you can launch Chrome with the --no-sandbox argument:

const browser = await puppeteer.launch({
  args: ['--no-sandbox', '--disable-setuid-sandbox'],
});
:::caution

Running without a sandbox is strongly discouraged. Consider configuring a sandbox instead.

:::

There are 2 ways to configure a sandbox in Chromium.

[recommended] Enable user namespace cloning
User namespace cloning is only supported by modern kernels. Unprivileged user namespaces are generally fine to enable, but in some cases they open up more kernel attack surface for (unsandboxed) non-root processes to elevate to kernel privileges.

sudo sysctl -w kernel.unprivileged_userns_clone=1
[alternative] Setup setuid sandbox
The setuid sandbox comes as a standalone executable and is located next to the Chrome that Puppeteer downloads. It is fine to re-use the same sandbox executable for different Chrome versions, so the following could be done only once per host environment:

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

ENV CHROME_DEVEL_SANDBOX /usr/local/sbin/chrome-devel-sandboxhttps://github.com/ebidel/try-puppeteer