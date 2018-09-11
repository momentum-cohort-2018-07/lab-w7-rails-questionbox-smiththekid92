class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :username
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end
