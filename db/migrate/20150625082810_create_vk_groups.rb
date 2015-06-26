class CreateVkGroups < ActiveRecord::Migration
  def change
    create_table :vk_groups do |t|
      t.string :name
      t.string :link

      t.timestamps
    end
  end
end
