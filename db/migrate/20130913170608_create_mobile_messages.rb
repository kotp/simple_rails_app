class CreateMobileMessages < ActiveRecord::Migration
  def change
    create_table :mobile_messages do |t|
      t.string "platform", :null => false
      t.string "platform_version", :null => false
      t.string "app_version", :null => false
      t.string "message_type", :null => false
      t.text "url"
      t.text "message", :null => false
      t.boolean "dismissible"
      t.boolean "active", :default => true

      t.timestamps
    end
  end
end
