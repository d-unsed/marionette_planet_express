@Planet.module 'FooterApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

    show: ->
      App.footerRegion.show @getShowView()

    getShowView: ->
      new Show.Footer
