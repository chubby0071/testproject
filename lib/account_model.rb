# Document the responsibility of the class

class Environment
$url
  URL = {
    qa:   "https://qa-diagnostics.mynexia.com/login",
    prod: "https://diagnostics.mynexia.com/login",
  }

  attr_accessor :url

  def initialize(env)
    $url = URL[env]
  end
end # Environment

# Document the responsibility of the class

class Account < Environment

  LOGIN = {
    qa:     { username: "dso", password: "13ebusiness" },
    prod:   { username: "dso", password: "13ebusiness" },
  }

  attr_accessor :username, :password

  def initialize(env)
    super
    @username = LOGIN[env][:username]
    @password = LOGIN[env][:password]
  end
end # Account

# Document the responsibility of the class

class Customer < Account
end # Customer

# Document the responsibility of the class

class Device < Customer
  # include Faceplate
  # include Smil

  attr_reader :type
  attr_accessor :name, :state

  def initialize(type, name)
    @type  = type
    @name  = name
  end
end # Device

# env = Environment.new(browser, url)

# acc = Account.new(username, password)
