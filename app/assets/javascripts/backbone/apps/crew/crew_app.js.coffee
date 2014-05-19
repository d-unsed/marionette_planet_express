@Planet.module 'CrewApp', (CrewApp, App, Backbone, Marionette, $, _) ->

  class CrewApp.Router extends Marionette.AppRouter

    appRoutes:
      'crew': 'list'

  API =
    list: ->
      CrewApp.List.Controller.listCrew()

  App.addInitializer ->
    new CrewApp.Router
      controller: API
