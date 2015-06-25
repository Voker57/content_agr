require "test_helper"

class VkGroupTest < ActiveSupport::TestCase
  def vk_group
    @vk_group ||= VkGroup.new
  end

  def test_valid
    assert vk_group.valid?
  end
end
