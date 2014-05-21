@Planet.module 'Components.Form', (Form, App, Backbone, Marionette, $, _) ->

  class Form.Controller extends Marionette.Controller
    initialize: (options = {}) ->
      @contentView = options.view

      @layout = @getFormLayout options.config
      @layout.on 'show', =>
        @formContentRegion()

    formContentRegion: ->
      @layout.formContentRegion.show @contentView

    getFormLayout: (config = {}) ->
      new Form.FormWrapper

  App.reqres.setHandler 'form:wrapper', (contentView, options = {}) ->
    formController = new Form.Controller
      view: contentView
      config: options

    formController.layout
