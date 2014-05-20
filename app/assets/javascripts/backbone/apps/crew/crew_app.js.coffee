@Planet.module 'CrewApp', (CrewApp, App, Backbone, Marionette, $, _) ->

  class CrewApp.Router extends Marionette.AppRouter

    appRoutes:
      'crew':          'list'
      'crew/:id/edit': 'edit'

  API =
    list: ->
      CrewApp.List.Controller.listCrew()
    new: ->
      CrewApp.New.Controller.newCrew()
    edit: (id, member) ->
      CrewApp.Edit.Controller.editCrew id, member

  App.reqres.setHandler 'new:crew:member:view', ->
    API.new()

  App.vent.on 'crew:member:clicked', (member) ->
    App.navigate Routes.edit_crew_path(member.id)
    API.edit member.id, member

  App.addInitializer ->
    new CrewApp.Router
      controller: API
