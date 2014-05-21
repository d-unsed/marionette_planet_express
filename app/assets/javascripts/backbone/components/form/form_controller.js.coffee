@Planet.module 'Components.Form', (Form, App, Backbone, Marionette, $, _) ->

  class Form.Controller extends Marionette.Controller
    initialize: (options = {}) ->
      @contentView = options.view

      @layout = @getFormLayout options.config
      @listenTo @layout, 'show', @formContentRegion
      @listenTo @layout, 'close', @close

    formContentRegion: ->
      @layout.formContentRegion.show @contentView

    getFormLayout: (options = {}) ->
      config = @getDefaultConfig _.result(@contentView, 'form')
      buttons = @getButtons config.buttons

      new Form.FormWrapper
        config: config
        model: @contentView.model
        buttons: buttons

    getDefaultConfig: (config = {}) ->
      _.defaults config,
        footer: true
        focusFirstInput: true

    getButtons: (buttons = {}) ->
      unless buttons is false
        App.request 'form:button:entities', buttons, @contentView.model

  App.reqres.setHandler 'form:wrapper', (contentView, options = {}) ->
    formController = new Form.Controller
      view: contentView
      config: options

    formController.layout
