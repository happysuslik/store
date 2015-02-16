class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :credit_card
  has_many :line_items
  belongs_to :billing_address, class_name: "Address"
  belongs_to :shipping_address, class_name: "Address"

  #validates :amount, :date, :state, presence: true
   validates :state, inclusion: { in: %w(in_queue in_progress in_delivery canceled) }

  before_create :return_order_state

  def return_order_state
    self.state = "in_progress" if self.state == ""
  end
end




# before_validation
# before_validation_on_create
# after_validation - after - что сделать после валидации
# after_validation_on_create
# before_save
# before_create
# DATABASE INSERT
# after_create
# after_save