class CreateReviews < ActiveRecord::Migration
  def up
    create_table 'reviews' do |t|
      t.integer    'potatoes'
      t.text       'comment'
      t.references 'moviegoer'
      t.references 'movie'
      t.timestamps
    end
  end
  def down ; drop_table 'reviews' ; end
end