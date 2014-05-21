@Planet.module 'CrewApp.Edit', (Edit, App, Backbone, Marionette, $, _) ->

  Edit.Controller =

    editCrew: (id, member) ->
      member or= App.request 'crew:entity', id

      App.execute 'when:fetched', member, =>
        @layout = @getLayoutView member
        @layout.on 'show', =>
          @formRegion member

        App.mainRegion.show @layout

    formRegion: (member) ->
      editView = @getEditView member
      formView = App.request 'form:wrapper', editView
        
      @layout.formRegion.show formView

    getEditView: (member) ->
      new Edit.Form
        model: member

    getLayoutView: (member) ->
      new Edit.Layout
        model: member
