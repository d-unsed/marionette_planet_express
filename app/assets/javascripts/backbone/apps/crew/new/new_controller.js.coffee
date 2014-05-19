@Planet.module 'CrewApp.New', (New, App, Backbone, Marionette, $, _) ->

  New.Controller =

    newCrew: ->
      @getNewView()

    getNewView: ->
      new New.Crew
