class Notification < ActiveRecord::Base
	skip_before_filter :force_ssl
end
