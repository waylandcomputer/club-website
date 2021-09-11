# First Working Example with Front & Backend Combined

## Requirements
You need to have Node.js + npm, Python, and Postgresql installed.

## Setup
### Prepare Database:
```
psql postgres
CREATE DATABASE club_website;
\c club_website
\i site/src/data_loader/setup.sql
```
### Install libraries:
```
cd site
npm install  # installs javascript dependencies
pip install -r src/data_loader/requirements.txt  # installs python modules
```

We use javascript for routing the website, together with a separate Flask app for loading data.

Start the main app with `npm run serve` (development) or `npm run build` (production).

Go to `site/src/data_loader` and start the Flask app with `flask run`. Don't forget to change `.env` and `.flaskenv` during production (`git update-index --skip-worktree .env` to be safe).
###
###
#### Lints and fixes files
```
npm run lint
```

#### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).
