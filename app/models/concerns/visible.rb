module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = ['private', 'public', 'archieved']
  
  #included is a featrue provided by the ActiveSupport::Concern class
  included do 
    validates :status, inclusion: { in: VALID_STATUSES }
  end
  
  def archived?
    status == 'archived'
  end
end