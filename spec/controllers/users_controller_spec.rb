require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'make visible' do
    it 'should make a card toggle visibility' do
      # given the ace is in the deck

      Card.create!(:card_value=>'A', :card_suit=>'H',:pile_id=>0,:visible=>false)
      ace = Card.find_by(card_value: 'A')

      params = ActionController::Parameters.new(selected_card: {ace[:id] => "a"})
      allow(controller).to receive(:params) {params}

      controller.makeVisible

      expect(Card.find_by(card_value:'A')[:visible]).to eq(true)

    end
  end

  describe 'make visible' do
    it 'should make a card toggle visibility' do
      # given the ace is in the deck

      Card.create!(:card_value=>'A', :card_suit=>'H',:pile_id=>0,:visible=>true)
      ace = Card.find_by(card_value: 'A')

      params = ActionController::Parameters.new(selected_card: {ace[:id] => "a"})
      allow(controller).to receive(:params) {params}

      controller.makeVisible

      expect(Card.find_by(card_value:'A')[:visible]).to eq(false)

    end
  end
end
