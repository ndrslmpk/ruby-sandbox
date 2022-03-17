class Comment < ApplicationRecord
  # @variable belongs_to
  # defines a Active Record association
  belongs_to :article

  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES}

  def archived?
    status == 'archived'
  end
end
