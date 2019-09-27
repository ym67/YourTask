class CreateConnects < ActiveRecord::Migration[5.2]
  def change
    create_table :connects do |t|
      t.integer :task_id
      t.integer :label_id

      t.timestamps
    end
  end
end
