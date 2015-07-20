class Dummy
	def name
		'Dummy'
	end

	def sid
		'dummy'
	end

	def admin?
		APP_CONFIG['ignore_ldap']
	end
	def sAMAccountName
		'dummy'
	end
end
