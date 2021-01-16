# Installing or Preparing Application

npx create-probot-app qs-bot

{or}

npm install --global create-probot-app
create-probot-app qs-bot

# Registering the GitHub App

- Under Profile menu click "Settings" (https://github.com/settings/profile)
- Click menu "Developer settings"
- Click menu "GitHub Apps"
- Click button "New GitHub App"
- Fill in the form
  ![alt text][probot_githubapp_new]
- Click "generate a private key"
- Save PEM file
- Upload a Logo
- Change ".env" file.

[probot_githubapp_new]: ./assests/probot_githubapp_new.pdf "Register New GitHub App"

# Running the Application

npm start
http://localhost:3000

# Linking the GitHub App with Repository

- Open https://github.com/apps/q-smith-gitapp
- Click "Install" button

# Simulate Receiving Webhooks

node_modules/.bin/probot receive -e <event-name> -p <path-to-fixture> ./index.js
