class CreateMessages < ActiveRecord::Migration[6.1]
  def up
    unless ActiveRecord::Base.connection.table_exists?(:messages)
      create_table :messages do |t|
        t.string :body
        t.string :username
        t.timestamps
      end
    end
  end

  def down
    drop_table :messages, if_exists: true
  end
end
