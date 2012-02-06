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

In your layout, add:

    :javascript
      $(document).ready(function(){
        jQuery.post("/stats", {
          professional_id: #{@professional.id},
          patient_id: #{@patient.id},
          url: $(location).attr('href'),

          browser: {
            document: {
              width: $(document).width(),
              height: $(document).height()
            }
          }
        });
      });

# TODO

* Rack middleware component `SimpleStats::Middleware` that logs
  information from the server-side of the request.
* View helpers like

    <%= 
      simple_stats_collector(:professional_id => @professional.id)
    %>

## Copyright

Copyright (c) 2012 RGOc. See LICENSE.txt for further details.
