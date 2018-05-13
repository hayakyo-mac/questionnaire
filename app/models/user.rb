class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    uniqueness: { case_sensitive: false }
  has_secure_password
  
  
  has_many :questions
  
  has_many :answers
  has_many :choice_answer, through: :answers, source: :answer
  
  def answer(choice)
    self.answers.find_or_create_by(answer_id: choice.id)
  end

  def answering?(choice)
    self.choice_answer.include?(choice)
  end

  def answered?(question)
    choice_ids = self.answers.where(user_id: self.id).pluck(:choice_id)
    (choice_ids & question.choices.pluck(:id)).present?
  end
end