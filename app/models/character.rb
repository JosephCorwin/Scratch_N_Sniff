class Character < ApplicationRecord
  belongs_to :guild
  has_many :notes
  accepts_nested_attributes_for :notes

  validates :xp, numericality: { greater_than_or_equal_to: 0 }
  validates :rocks, numericality: { greater_than_or_equal_to: 0 }
  validates :gems, numericality: { greater_than_or_equal_to: 0 }
  validates :hair, numericality: { greater_than_or_equal_to: 0 }

  def alter_value(attribute, delta)
    raise InvalidAttribute unless %i[xp rocks gems hair].include? attribute

    update!({ attribute => send(attribute) + delta })
  end

  class InvalidAttribute < StandardError; end
end
