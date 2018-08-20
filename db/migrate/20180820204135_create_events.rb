class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :address
      t.datetime :time
      t.references :user, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
