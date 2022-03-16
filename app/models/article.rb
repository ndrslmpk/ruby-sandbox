class Article < ApplicationRecord
  # Validations inside this data-based model are used to handle invalid user inputs  
  # params:
  #   @validates <TABLE COLUMN / ATTRIBUTE>: IDENTIFIER (STRING) 
  #   @presence: NOT NULL (BOOLEAN) 
  #   @length; CONSTRAINT (INT)
  validates :title, presence: true 
  validates :body, presence: true, length: { minimum: 10 } # WHY does it have to be enclosed in curly brackets?
end
