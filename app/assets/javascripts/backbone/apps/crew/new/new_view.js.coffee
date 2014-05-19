@Planet.module 'CrewApp.New', (New, App, Backbone, Marionette, $, _) ->

  class New.Crew extends App.Views.ItemView
    template: JST['crew/new/new_member']
    triggers:
      'click [data-form-button="cancel"]': 'form:cancel:button:clicked'
