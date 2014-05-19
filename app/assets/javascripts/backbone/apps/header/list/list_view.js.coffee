@Planet.module 'HeaderApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Header extends App.Views.CompositeView
    template: JST['header/list']
