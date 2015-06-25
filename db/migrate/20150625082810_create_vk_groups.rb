class CreateVkGroups < ActiveRecord::Migration
  def change
    create_table :vk_groups do |t|
      t.string :name_group
      t.string :link_group

      t.timestamps
    end
  end
end
