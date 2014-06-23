class RemoveTechAddDescriptionAndBodyToProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :technologies_used
    add_column :projects, :description, :text
    add_column :projects, :body, :text
  end
end
