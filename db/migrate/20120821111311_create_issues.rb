class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.references :issued_by, :polymorphic => true
      t.string :description
      t.text :body, :limit => Okvalue::DB_ISSUE_TEXT_LENGTH
      t.string :status, :null => false
      t.string :category, :null => false
      t.timestamps
    end
  end
end
