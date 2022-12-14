class AddSmsverificationToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :verified, :boolean, default: false
    add_column :users, :sms_code, :jsonb
  end
end
