class CreatePayForms < ActiveRecord::Migration[6.0]
  def change
    create_table :pay_forms do |t|

      t.timestamps
    end
  end
end
