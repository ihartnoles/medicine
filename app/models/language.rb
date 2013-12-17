class Language < ActiveRecord::Base
  has_many	:affiliatelanguages
  attr_accessible :abbreviation, :language, :language_id

  validates :language, length: {minimum: 1, maximum: 50} ,:presence => true
  validates :abbreviation, length:  {minimum: 1, maximum: 5} ,:presence => true
end
