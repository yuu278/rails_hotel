class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :guests, presence: true, numericality: { greater_than_or_equal_to: 1 }
  
  validate :check_in_cannot_be_in_the_past
  validate :check_out_after_check_in_date

  def check_in_cannot_be_in_the_past
    if check_in.present? && check_in< Date.today
      errors.add(:check_in, "は今日以降の日付を選択してください")
    end
  end
  
  def check_out_after_check_in_date
    if check_in.present? && check_out.present? && check_out <= check_in
      errors.add(:check_out, "はチェックイン日より後の日付を選択してください")
    end
  end
  
  def stay_days
    (check_out - check_in).to_i
  end

  def total_amount
    stay_days * guests * room.price if stay_days > 0
  end 
end