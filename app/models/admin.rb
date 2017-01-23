class Admin < ApplicationRecord
  devise :database_authenticatable, :timeoutable
end
