class AddAppIdToTemplate < ActiveRecord::Migration[6.0]
  def change
    add_reference :templates, :app, index: true
  end
end
