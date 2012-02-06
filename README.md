# SimpleStats

SimpleStats is a fairly minimalistic web stats package. It will track every
request to your app. It consists of two parts: a Rack middleware component
that can track information from the server-side processing of a request, and
a view helper that tracks information from the client-side of a request.

Both parts can be used independently, and when used together, SimpleStats will
automatically store them together in the same MongoDB record.

# How to use

Mount as engine somewhere in your application:

    mount SimpleStats, "/stats"

The following stuff is still TODO:

* Add SimpleStats::Middleware as Rack middleware to collect
  information from the server-side of the request.
* In your layout, add

    <%= simple_stats_collector %>

## Contributing to simplestats
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 Marten Veldthuis. See LICENSE.txt for further details.

