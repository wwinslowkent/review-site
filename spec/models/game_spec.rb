require "rails_helper"
require "spec_helper"

describe Game do
  it { should have_valid(:name).when('Pokemon Soon', 'Pokemon Mun')}
  it { should_not have_valid(:name).when(nil, '')}

  it { should have_valid(:summary).when('Cool pokemon', 'Awesome pokemon')}
  it { should_not have_valid(:summary).when(nil, '')}

  it { should have_valid(:cover_url).when('img.png', 'thing.png')}
  it { should_not have_valid(:cover_url).when(nil, '')}
end
