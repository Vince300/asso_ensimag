# Production server settings
server '173.214.168.34', {
  user: 'root',
  roles: %{web app},
  ssh_options: {
    keys: %w(C:/Users/Vincent/.ssh/ae_interserver),
    forward_agent: false,
    auth_methods: %w(publickey)
  }
}
