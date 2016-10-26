class AddImageLinkToRewards < ActiveRecord::Migration[5.0]
  def change
    add_column :rewards, :image_link, :string
  end
end
