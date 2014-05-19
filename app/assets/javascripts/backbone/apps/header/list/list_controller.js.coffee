@Planet.module 'HeaderApp.List', (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    list: ->
      App.headerRegion.show @getListView()

    getListView: ->
      new List.Header
