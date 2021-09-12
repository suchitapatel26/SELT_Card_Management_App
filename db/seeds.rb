# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   cards = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cards=[{:card_value=>'A',:card_suit=>'S',:pile_id=>0, :visible=>false},
       {:card_value=>'2',:card_suit=>'S',:pile_id=>0, :visible=>false},
       {:card_value=>'3',:card_suit=>'H',:pile_id=>0, :visible=>false},
       {:card_value=>'K',:card_suit=>'D',:pile_id=>0, :visible=>false},
       {:card_value=>'Q',:card_suit=>'C',:pile_id=>0, :visible=>false},
       {:card_value=>'J',:card_suit=>'H',:pile_id=>0, :visible=>false},
       {:card_value=>'6',:card_suit=>'D',:pile_id=>0, :visible=>false}]

users = [{:name=>'Alice', :provider=>'SELT', :uid=>'1234', :account_id=>1234, :email=>'alice@gmail.com', :encrypted_password=>'null', :session_token=>SecureRandom.base64},
         {:name=>'Bob', :provider=>'SELT', :uid=>'7007', :account_id=>7007, :email=>'bob@gmail.com', :encrypted_password=>'null', :session_token=>SecureRandom.base64}]

cards.each do |card|
  Card.create!(card)
end

users.each { |user| User.create!(user) }
