class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :email, null: false, default: ''
      t.string :password_digest, null: false, default: ''
      t.boolean :is_admin, null: false, default: false

      t.string :name
      t.string :cpf
      t.string :pis
      t.string :position
      t.string :team

      t.timestamps
    end
  end
end
