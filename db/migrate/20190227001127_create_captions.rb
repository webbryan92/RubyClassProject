class CreateCaptions < ActiveRecord::Migration[5.2]
  def change
    create_table :captions do |t|
      t.string :imgurl
      t.string :captioner
      t.text :caption
      t.integer :votes

      t.timestamps
    end
  end
end
