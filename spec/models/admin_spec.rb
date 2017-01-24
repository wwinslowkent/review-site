require "rails_helper"
require "spec_helper"

describe Admin do

  it { should have_valid(:email).when('harry@snape.com', 'hermione@snape.com') }
  it { should_not have_valid(:email).when(nil, '') }

end
