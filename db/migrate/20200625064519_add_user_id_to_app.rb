class AddUserIdToApp < ActiveRecord::Migration[6.0]
  def change
    add_reference :apps, :user, index: true
  end
end
