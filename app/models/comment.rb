class Comment < ApplicationRecord
  # @variable belongs_to
  # defines a Active Record association
  belongs_to :article

  # ???? Why does comment does not have an entry for the commenter and its body
end
