class VkGroup < ActiveRecord::Base

  scope :with_links, -> { where.not( link_group: nil ) }


end
