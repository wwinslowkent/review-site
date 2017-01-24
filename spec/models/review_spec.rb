require 'spec_helper'
require 'rails_helper'

describe Review do
  user = FactoryGirl.build(:user)
  game = FactoryGirl.build(:game)

  it { should have_valid(:rating).when("1", "2", "3", "4", "5") }
  it { should_not have_valid(:rating).when(nil, '', '0', '6') }

  it { should have_valid(:user).when(user) }
  it { should_not have_valid(:user_id).when(nil) }

  it { should have_valid(:game).when(game) }
  it { should_not have_valid(:game_id).when(nil) }

end
