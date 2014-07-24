class NotificationController < ApplicationController
	include NotificationHelper

	def authenticate
		send_sms(9099640670, 'authentication testing')
	end

	def 



end
