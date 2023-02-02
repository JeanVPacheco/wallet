class Ledger < ApplicationRecord
  belongs_to :user
  belongs_to :receiver
end
