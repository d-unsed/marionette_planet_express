@Planet.module 'Components.Form', (Form, App, Backbone, Marionette, $, _) ->

  class Form.FormWrapper extends App.Views.Layout
    template: JST['components/form/form']

    tagName: 'form'
    attributes: ->
      'data-type': @getFormDataType()

    regions:
      formContentRegion: '#form-content-region'

    ui:
      buttonContainer: 'ul.inline-list'

    serializeData: ->
      console.log @options.buttons
      footer: @options.config.footer
      buttons: @options.buttons.toJSON()

    onShow: ->
      _.defer =>
        @focusFirstInput() if @options.config.focusFirstInput
        @buttonsPlacement()

    focusFirstInput: ->
      @$(':input:visible:enabled:first').focus()

    buttonsPlacement: ->
      @ui.buttonContainer.addClass @options.buttons.placement

    getFormDataType: ->
      if @model.isNew() then 'new' else 'edit'
