class CreateBanners < ActiveRecord::Migration
  def change
    create_table(:banners) do |t|
      t.string :place
      t.string :position
      t.integer :width
      t.integer :height
      t.string :style
      t.references :bannered, :polymorphic => true
    end
  end
end
