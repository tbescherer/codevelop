# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  username            :string           not null
#  email               :string           not null
#  password_digest     :string           not null
#  session_token       :string           not null
#  language            :string           default("none")
#  uid                 :string
#  provider            :string
#  created_at          :datetime
#  updated_at          :datetime
#  about_field_one     :text
#  about_field_two     :text
#  about_field_three   :text
#  age                 :integer
#  job                 :string
#  looking_for         :text
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class User < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_username, :against => :username
  validates :username, :password_digest, :session_token, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, length: { minimum: 6, allow_nil: true}
  has_attached_file :avatar, default_url: "https://s3.amazonaws.com/codevelopavatarproduction/placeholder.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  attr_reader :password

  after_initialize :ensure_session_token

  has_many :user_answers
  has_many :answer_choices, through: :user_answers, source: :answer_choice
  has_many :answered_questions, through: :answer_choices, source: :question

  has_many :conversation_replies
  has_many :conversations, through: :conversation_replies, source: :conversation

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

  # def alternative_match_score(other_user)
  #   num = 0
  #   denom = 1
  #   questions = self.answered_questions & other_user.answered_questions
  #   questions.each do |question|
  #     my_answ = self.answer_choices.find_by(question_id: question.id)
  #     their_answ = other_user.answer_choices.find_by(question_id: question.id)
  #     weight = self.user_answers.find_by(answer_choice_id: my_answ.id).weight
  #     num += weight if my_answ == their_answ
  #     denom += weight
  #   end
  #   return num.to_f/denom * 100
  # end

  def match_score(other_user)
    num = 0
    denom = 1
    my_answer_choices = self.user_answers.map{|i| i.answer_choice}
    other_answer_choices = other_user.user_answers.map{|i| i.answer_choice}
    my_questions = my_answer_choices.map{|i|i.question}
    other_questions = other_answer_choices.map{|i|i.question}
    questions = my_questions & other_questions
    questions.each do |question|
      my_answ = my_answer_choices.detect{|choice| choice.question_id == question.id}
      their_answ = other_answer_choices.detect{|choice| choice.question_id == question.id}
      weight = self.user_answers.detect{|answer| answer.answer_choice_id == my_answ.id}.weight
      num += weight if my_answ == their_answ
      denom += weight
    end
    return num.to_f/denom * 100
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
