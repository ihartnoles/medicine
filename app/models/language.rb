class Language < ActiveRecord::Base
  set_primary_key 'language_id'
  has_many	:affiliatelanguages
  attr_accessible :abbreviation, :language, :language_id
end
