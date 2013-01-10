class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :title

      t.timestamps
    end
  end
end
