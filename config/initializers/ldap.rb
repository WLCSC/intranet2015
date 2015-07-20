APP_CONFIG = YAML.load_file(Rails.root.to_s + ('/config/app.yml'))[Rails.env]

unless APP_CONFIG[:ignore_ldap] == true
  require 'active_ldap'

  LDAP_CONFIG = YAML.load_file(Rails.root.to_s + ('/config/ldap.yml'))[Rails.env]
  ActiveLdap::Base.setup_connection LDAP_CONFIG

  class ActiveLdap::Base
    def to_s
      dn.to_s
    end

    def inspect
      "LDAP[#{to_s}]"
    end
  end
end
