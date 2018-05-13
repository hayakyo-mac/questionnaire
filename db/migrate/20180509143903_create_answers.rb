class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.references :user, foreign_key: true
      t.references :choice, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :choice_id], unique: true
    end
  end
end