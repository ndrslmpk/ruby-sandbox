class Article < ApplicationRecord
  has_many :comments

  # Validations inside this data-based model are used to handle invalid user inputs  
  # params:
  #   @validates <TABLE COLUMN / ATTRIBUTE>: IDENTIFIER (STRING) 
  #     - presence: NOT NULL (BOOLEAN) 
  #     - length; CONSTRAINT (INT)
  validates :title, presence: true 
  validates :body, presence: true, length: { minimum: 10 } # WHY does it have to be enclosed in curly brackets?

  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES}

  def archived?
    status == 'archived'
  end
end
