#Userfox Ruby Gem

A Ruby Wrapper for the [Userfox API](http://www.userfox.com/docs/#rest-api)

##Installation

	gem install userfox
    
##Getting Started

It’s as easy as pie, create a client like so :

	userfox = Userfox.new(«client_id», «client_secret»)

Track a user :

	userfox.track(«hello@example.com», «http://example.com», name: «Antoine»)
    
Send him an email :
 
	userfox.send(«hello@example.com», «Password Recovery», hello: «world»)
 
 Change Its email : 
 
 	userfox.change(«hello@example.com», «hi@example.com»)
 	
 Unsubscribes him :
 
 	userfox.unsubscribes(«hello@example.com»)
 	
See [Userfox API Documentation](http://www.userfox.com/docs/#rest-api) for further informations about what you can do with all of that.
 	
##Contributing to userfox

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

##Copyright

Copyright (c) 2013 Antoine Lagadec. See LICENSE.txt for
further details.