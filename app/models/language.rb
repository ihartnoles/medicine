class Language < ActiveRecord::Base
  has_many	:affiliatelanguages
  attr_accessible :abbreviation, :language, :language_id
end
