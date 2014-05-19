@Planet.module 'CrewApp', (CrewApp, App, Backbone, Marionette, $, _) ->

  class CrewApp.Router extends Marionette.AppRouter

    appRoutes:
      'crew': 'list'

  API =
    list: ->
      CrewApp.List.Controller.listCrew()
    new: ->
      CrewApp.New.Controller.newCrew()
    edit: (member) ->
      CrewApp.Edit.Controller.editCrew member

  App.reqres.setHandler 'new:crew:member:view', ->
    API.new()

  App.vent.on 'crew:member:clicked', (member) ->
    API.edit member

  App.addInitializer ->
    new CrewApp.Router
      controller: API
