class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :answer_values,   :foreign_key => :from,  :class_name => 'User'
  has_many :answer_values,   :foreign_key => :who,   :class_name => 'User'

  # accessors
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :user_name

  # validation

   validates :first_name, :last_name, :user_name, presence: :true
   validates :user_name, uniqueness: :true


#De estas, tenemos que quedaron solamente con las que son de tipo :Administrador
   def calculate_scoring(questionnaire_id)

      value = 0
      AnswerValue.find_all_by_questionnaire_id_and_who_id(questionnaire_id, self.id).each do |a|
          value += (a.answer.percentage.to_f/100) * (a.questionnaire.question_weight(a.answer.question.id)).to_f
      end

      questionnaire = Questionnaire.find_by_id(questionnaire_id)

      (value * 100 / questionnaire.total_score).round
   end
end

