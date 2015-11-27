class AddEcologicalIssueToPost < ActiveRecord::Migration
  def change
    add_column :posts, :ecological_issue, :boolean, :default => false
  end
end
