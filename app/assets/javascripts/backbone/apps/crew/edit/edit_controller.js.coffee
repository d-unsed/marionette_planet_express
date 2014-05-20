@Planet.module 'CrewApp.Edit', (Edit, App, Backbone, Marionette, $, _) ->

  Edit.Controller =

    editCrew: (id, member) ->
      member or= App.request 'crew:entity', id

      App.execute 'when:fetched', member, =>
        editView = @getEditView member
        App.mainRegion.show editView

    getEditView: (member) ->
      new Edit.Crew
        model: member
