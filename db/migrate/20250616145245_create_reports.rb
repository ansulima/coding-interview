class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|
      t.string :report_type, null: false
      t.string :status, default: 'pending'
      t.text :result_data

      t.timestamps
    end
  end
end