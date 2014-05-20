@Planet.module 'CrewApp.Edit', (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Crew extends App.Views.ItemView
    template: JST['crew/edit/edit_crew']
