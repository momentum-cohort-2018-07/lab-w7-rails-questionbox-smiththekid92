class Answer < ApplicationRecord
# belongs_to :user, :question_id

validates :title, :body, presence: true


end
