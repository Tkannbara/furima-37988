class OrderForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :post_code, :shipping_charges_id, :municipality, :house_number, :building_name, :pohne, :token 
   
  with_options presence: true do
    VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
    validates :user_id, presence: true
    validates :item_id, presence: true


    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_charges_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :house_number
    validates :pohne, format: { with:VALID_PHONE_REGEX, message: 'is invalid' }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Addressse.create(order_id: order.id, post_code: post_code, shipping_charges_id: shipping_charges_id, municipality: municipality, house_number: house_number, building_name: building_name, pohne: pohne)
    end
  end
