require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork
include Publish
include Sort

every( 10.second, 'Start Mechanize agent' )                 { Article.agent_session }
every( 10.second, 'Sort according Like to the VKontakte' )  { Sort.puts }
every( 10.second, 'Published Articles' )                    { Publish.publication }
