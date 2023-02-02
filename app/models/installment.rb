class Installment < ApplicationRecord
  belongs_to :entity
  belongs_to :user
  belongs_to :receiver
end
