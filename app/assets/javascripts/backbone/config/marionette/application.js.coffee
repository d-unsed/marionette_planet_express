do (Backbone) ->

  _.extend Backbone.Marionette.Application::,

    navigate: (route, options = {}) ->
      route = "##{route}" if route.charAt(0) is '/'
      Backbone.history.navigate route, options

    getCurrentRoute: ->
      fragment = Backbone.history.fragment
      if _.isEmpty(fragment) then null else fragment

    startHistory: ->
      Backbone.history.start()
