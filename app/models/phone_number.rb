class PhoneNumber < ActiveRecord::Base
  validates :number, presence: true
  validates :contact_id, presence: true
  belongs_to :contact, polymorphic: true
end
