# app/models/todo.rb
class Todo < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  enum status: { pending: 0, completed: 1 }  # Ensure this is defined

  # Set the default status to 'pending'
  after_initialize :set_default_status, if: :new_record?

  private

  def set_default_status
    self.status ||= :pending
  end
end