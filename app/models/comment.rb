class Comment < ApplicationRecord
  include Visible
  # @variable belongs_to
  # defines a Active Record association
  belongs_to :article
end
