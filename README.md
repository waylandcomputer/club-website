
# waylandcs.com

## Requirements
* Terminal
	* Already installed on Mac/Linux
		* If Terminal is disabled (e.g. by administrator), use iTerm ([download](https://iterm2.com)) or an application with a built-in Terminal like PyCharm (available through Self Service; `Alt+fn+F12` is the shortcut for Terminal panel) or VSCode.
	* Use ?? on Windows
* Node/npm
	* Download from [Node website](https://nodejs.org/en/) (LTS version is recommended).
	* If you do not have administrative privileges, paste the following lines into Terminal:
        1. `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash`
        2. If you are using an application other than iTerm/Terminal, such as PyCharm, you need to run an additional line: `if ! command grep -qc '/nvm.sh' ~/.zprofile; then command printf 'export NVM_DIR="$HOME/.nvm"; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zprofile; fi;`
        3. Sanity Check: make sure `command -v nvm` outputs `nvm`
        4. Finally, to actually install Node/npm: `nvm install 16.9.1`.
        5. Make sure `node --version` and `npm --version` work.
* Git/Python
	* These are listed together because they should be installed by default on Macs. 
	* If not, (or if you want to update to the latest version), download them from the official websites: [Git](https://git-scm.com/downloads) and [Python](https://www.python.org/downloads/). At the time of writing, `Git_2-18-0` and `Python 3.9.1` are also available in Self Service.

## Run Website Locally
```
cd ~/Documents  # Navigate to Documents folder
git clone https://github.com/waylandcomputer/club-website.git  # Download code from Github
cd club-website/site  # Navigate to main code folder
./verify_setup.sh  # Check everything is installed (only run if on school Mac)
python3 new_member_subpage.py <First> <Last>  # Generate files for your own subpage
npm install
npm run serve
```
The website should be running at `http://localhost:8080/`.

For production, replace `npm run serve` with `npm run build`.
