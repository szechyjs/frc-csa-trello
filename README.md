# FRC CSA Trello Request Form

This simple Rails app provides a easy way for teams to submit a new
card to a Trello board for use by CSA's to manage their work queue
at FRC events.

## Requirements
- A Trello board
- Heroku account

## Setup

### Trello
1. Create a board, it can be public or private
2. Add lists to manage your workflow
3. Add labels to help categorize cards. The list of labels will be presented to
the user as a Cateogry selection
4. Obtain API keys
  1. Navigate to https://trello.com/app-key
  2. Save your Developer keys
  3. Click the link to generate a Token
  4. Save the generated user token

### Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

Click the button above to start the deployment process.

Populate the required environment variables:

- TRELLO_DEVELOPER_KEY: The developer key obtained above
- TRELLO_MEMBER_TOKEN: The user token obtained above
- TRELLO_BOARD_ID: The ID of your board. This can be found in the URL. `https://trello.com/b/BOARD_ID/board-name`
- TRELLO_LIST_NAME: The name of the list that new cards should be placed. e.g., `Inbound`
