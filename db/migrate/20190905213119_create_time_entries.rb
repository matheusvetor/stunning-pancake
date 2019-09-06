class CreateTimeEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :time_entries do |t|
      t.references :employee
      t.datetime :entry

      t.timestamps
    end
  end
end
