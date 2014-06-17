class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :ratable, polymorphic: true
  validates_numericality_of :stars
  validates :stars, inclusion: {in: 0..5}
  validate :user_rate
  def user_rate
    if Rating.where(user_id: self.user_id, ratable_id: self.ratable_id, ratable_type: self.ratable_type).exists?
       errors.add(:user_id," user cannot rate twice")
      end
  end

end
