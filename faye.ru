require 'faye'
fayeServer = Faye::RackAdapter.new(:mount => '/faye', :timeout => 25)
run fayeServer
