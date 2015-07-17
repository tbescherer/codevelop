class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true}

  attr_reader :password

  after_initialize :ensure_session_token

  has_many :user_answers
  has_many :answer_choices, through: :user_answers, source: :answer_choice
  has_many :answered_questions, through: :answer_choices, source: :question

  has_many :conversation_replies

  def conversations
    Conversation.by_user(self.id)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user && user.is_password?(password)
    user
  end

  def self.find_or_create_by_auth_hash(auth_hash)
    user = User.find_by(
      provider: auth_hash[:provider],
      uid: auth_hash[:uid])

    unless user
      user = User.create!(
            username: auth_hash[:info][:nickname],
            provider: auth_hash[:provider],
            uid: auth_hash[:uid],
            email: auth_hash[:info][:email] || "blank",
            password: SecureRandom::urlsafe_base64
      )
    end

    user
  end

  def match_score(other_user)
    denom = 1
    num = 0
    my_answer_choices = self.answer_choices
    puts other_user.user_answers
    # questions = self.answered_questions & other_user.answered_questions
    # questions.each do |question|
      # my_answer = my_answer_choices.find_by(question_id: question.id)
      # other_answer = other_user.answer_choices.find_by(question_id: question.id)
    #   if my_answer == other_answer
    #     num += 1
    #   end
    #     denom += 1
    # end
    return (num.to_f/denom).round(2)*100
  end


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end
