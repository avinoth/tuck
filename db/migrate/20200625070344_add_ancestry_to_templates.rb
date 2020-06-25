class AddAncestryToTemplates < ActiveRecord::Migration[6.0]
  def change
    add_column :templates, :ancestry, :string
    add_index :templates, :ancestry
  end
end
