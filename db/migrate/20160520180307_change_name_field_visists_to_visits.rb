class ChangeNameFieldVisistsToVisits < ActiveRecord::Migration
  def change
  	rename_column :viewers, :visists, :visits
  end
end
