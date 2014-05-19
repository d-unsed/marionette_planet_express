@Planet.module 'CrewApp.List', (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    listCrew: ->
      crew = App.request 'crew:entities'
      @layout = @getLayoutView()

      @layout.on 'show', =>
        @titleRegion()
        @panelRegion()
        @newRegion()
        @crewRegion crew

      App.mainRegion.show @layout

    titleRegion: ->
      console.log
      @layout.titleRegion.show @getTitleView()

    panelRegion: ->
      @layout.panelRegion.show @getPanelView()

    newRegion: ->
      @layout.newRegion.show @getNewView()

    crewRegion: (crew) ->
      @layout.crewRegion.show @getCrewView(crew)

    getTitleView: ->
      new List.Title

    getPanelView: ->
      new List.Panel

    getNewView: ->
      new List.New

    getCrewView: (crew) ->
      new List.Crew
        collection: crew

    getLayoutView: ->
      new List.Layout
