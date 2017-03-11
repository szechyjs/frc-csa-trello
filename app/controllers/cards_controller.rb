class CardsController < ApplicationController
  before_action :set_labels

  def index
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    title = "#{@card.team_number} - #{@card.title}"
    if @card.valid?
      begin
        c = Trello::Card.create({
          name: title,
          desc: make_desc(@card),
          list_id: Rails.configuration.trello_list_id,
          card_labels: @card.category,
          pos: 'bottom'
        })
        c.save
        flash[:notice] = 'Request successfuly submitted. Thank You!'
        redirect_to action: 'index'
      rescue Trello::Error => e
        logger.error e
        flash[:alert] = 'There was an error processing your request. Please try again or contact a CSA by other means.'
        render :index
      end
    else
      flash[:alert] = 'Invalid request, please correct form and try again.'
      render :index
    end
  end

  private

  def card_params
    params.require(:card).permit(:team_number, :name, :email, :mobile, :title, :description, :category)
  end

  def make_desc(card)
    <<~EOF
    #{card.description}

    Name: #{card.name}
    Email: #{card.email}
    Mobile: #{card.mobile}
    EOF
  end

  def set_labels
    board = Trello::Board.find(Rails.configuration.trello_board_id)
    @labels = board.labels.map { |l| Label.new(id: l.id, name: l.name) }
    @labels.sort_by! { |l| l.name }
  end
end
