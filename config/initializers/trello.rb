require 'trello'

Trello.configure do |config|
  config.developer_public_key = ENV['TRELLO_DEVELOPER_KEY']
  config.member_token = ENV['TRELLO_MEMBER_TOKEN']
end

board = Trello::Board.find(ENV['TRELLO_BOARD_ID'])

if board
  Rails.configuration.trello_board_id = board.id
  list = board.lists.detect { |l| l.name == ENV['TRELLO_LIST_NAME'] }

  if list
    Rails.configuration.trello_list_id = list.id
  else
    abort 'The requested list was not found'
  end
else
  abort 'The requested board was not found'
end
