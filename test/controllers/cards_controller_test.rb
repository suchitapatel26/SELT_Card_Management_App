require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cards_path
    assert_response :success
  end

  describe CardsController do
    describe 'dealing to all players' do
      cards = Card.where(pile_id: current_user.active_session)
      CardsController.deal_all
      assert(cards-52 == Card.where(pile_id: current_user.active_session))
    end
  end

end