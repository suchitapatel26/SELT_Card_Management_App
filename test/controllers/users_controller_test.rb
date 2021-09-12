require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_show_url
    assert_response :success
  end

  describe UsersController do
    describe 'User properties' do
      it 'has a hand' do
        expect(UsersController).to receive(@hand_cards)
        UsersController.user_hand
      end
      it 'can show cards' do
        expect(UsersController).to receive(Settings.find_by_uid(current_user.uid))
        UsersController.show
      end
      it 'can draw cards' do
        UsersController.draw
        assert(!card.nil?)
      end
      it 'can increase the score' do
        testScore = Score.find_by(email: current_user.email)
        UsersController.increment_score
        assert(testScore+10 == Score.find_by(email: current_user.email))
      end
      it 'can decrease the score' do
        testScore = Score.find_by(email: current_user.email)
        UsersController.dedcrement_score
        assert(testScore-10 == Score.find_by(email: current_user.email))
      end

    end
  end

end
