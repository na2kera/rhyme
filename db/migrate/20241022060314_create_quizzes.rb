class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.string :name
      t.text :question
      t.text :answer

      t.timestamps
    end
  end
end
