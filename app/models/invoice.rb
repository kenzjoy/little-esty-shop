class Invoice < ApplicationRecord
  has_many :invoice_items, dependent: :destroy
  has_many :items, through: :invoice_items
  belongs_to :customer
  has_many :transactions, dependent: :destroy
  has_many :merchants, through: :items

  enum status: [ :"in progress", :cancelled, :completed ]

  def invoice_item(item_id)
    invoice_items.find_by(item_id: item_id)
  end

  def total_revenue(merchant_id)
    invoice_items
    .joins(:item)
    .where("items.merchant_id = ?", merchant_id)
    .sum("quantity * invoice_items.unit_price")
  end

  def admin_total_revenue
    invoice_items
    .joins(:item)
    .sum("quantity * invoice_items.unit_price")
  end
end
