@Planet.module 'CrewApp.Edit', (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Layout extends App.Views.Layout
    template: JST['crew/edit/edit_layout']

    regions:
      formRegion: '#form-region'

  class Edit.Form extends App.Views.ItemView
    template: JST['crew/edit/_form']
