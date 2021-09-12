class SessionsController < ApplicationController
  def new
  end

  def show

  end

  def create
    @user = User.from_omniauth(request.env['omniauth.auth'])
    session[:session_token] = @user.session_token
    new_score = Score.new
    new_score.email = @user.email
    new_score.name = @user.name
    new_score.score = 0
    new_score.save!
    redirect_to sessions_show_path, notice: 'signed in'
  end

  def createDeck(num_decks,deck_options,deck_num)
    number_deck = num_decks.to_i
    ranks = %w[A 2 3 4 5 6 7 8 9 10 J Q K]
    suits = %w[C D H S]
    deck = []
    if deck_options == 'random half deck'
      half_ranks = ranks.sample(7)
      suits.each do |suit|
        half_ranks.each do |rank|
          deck << {:card_value => rank,:card_suit => suit, :pile_id =>deck_num}
        end
      end
    elsif deck_options == 'only black cards'
      black_suit = %w[C S]
      black_suit.each do |suit|
        ranks.each do |rank|
          deck << {:card_value => rank,:card_suit => suit, :pile_id =>deck_num}
        end
      end
    elsif deck_options == 'only red cards'
      red_suit = %w[D H]
      red_suit.each do |suit|
        ranks.each do |rank|
          deck << {:card_value => rank,:card_suit => suit, :pile_id =>deck_num}
        end
      end
    else
      suits.each do |suit|
        ranks.each do |rank|
          deck << {:card_value => rank,:card_suit => suit, :pile_id =>deck_num}
        end
      end
    end
    number_deck.times do
      deck.each do |card|
        Card.create!(card)
      end
    end
  end

  def createSession
    #params[:setting] is obtained sent from a submit tag from /views/settings/index.html.erb
    settingsHash = params[:settings]

    session_id = rand(10 ** 6)
    setting = Settings.new
    if Settings.find_by_session_id(session_id).nil?
      setting.session_id = session_id
    else
      setting.session_id = rand(10 ** 6)
    end
    current_user[:role] = 'owner'
    current_user[:active_session] = session_id
    current_user.save!
    setting.uid = current_user.uid
    setting.num_decks = settingsHash[:num_decks]
    setting.num_players =settingsHash[:num_players]
    setting.deck_settings =settingsHash[:card_options]
    createDeck(settingsHash[:num_decks],settingsHash[:card_options],session_id)
    setting.save!
    redirect_to users_show_path, notice: 'Session created successfully, Share session code with others to join'
  end

  def joinSession
    if params[:sessionCode].present?
      code = params[:sessionCode]
      total_user = User.where(active_session: code)
      setting = Settings.find_by_session_id(code)
      if setting.present?
        if total_user.length <= setting.num_players
          current_user[:active_session] = code
          current_user[:role] = 'player'
          current_user.save!
          redirect_to users_show_path, notice: "You joined the session #{code}"
        else
          flash[:notice] = 'no such session exist. try again or create new'
          redirect_to sessions_show_path
        end
      else
        flash[:notice] = 'no such session exist. try again or create new'
        redirect_to sessions_show_path
      end
    else
      redirect_to sessions_show_path, notice: 'invalid input. check session code and try again'
    end
  end

  def destroy
    user = User.find_by_account_id(current_user.account_id)
    user.update(active_session: nil)
    cards = Card.where(pile_id: current_user.account_id)
    cards.each(&:destroy)
    Score.find_by_email(current_user.email).update(score: 0)
    session[:session_token] = nil
    redirect_to root_url, notice: 'signed out'
  end
end
