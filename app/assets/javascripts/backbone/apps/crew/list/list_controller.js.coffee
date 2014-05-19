@Planet.module 'CrewApp.List', (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    listCrew: ->
      crew = App.request 'crew:entities'
      @layout = @getLayoutView()

      @layout.on 'show', =>
        @titleRegion()
        @panelRegion()
        @crewRegion crew

      App.mainRegion.show @layout

    titleRegion: ->
      console.log
      @layout.titleRegion.show @getTitleView()

    panelRegion: ->
      panelView = @getPanelView()

      panelView.on 'new:crew:button:clicked', =>
        @newRegion()

      @layout.panelRegion.show panelView

    newRegion: ->
      region = @layout.newRegion
      newView = App.request 'new:crew:member:view'

      newView.on 'form:cancel:button:clicked', =>
        region.close()

      region.show newView

    crewRegion: (crew) ->
      crewView = @getCrewView crew

      crewView.on 'itemview:crew:member:clicked', (itemView, member) ->
        App.vent.trigger 'crew:member:clicked', member

      @layout.crewRegion.show crewView

    getTitleView: ->
      new List.Title

    getPanelView: ->
      new List.Panel

    getCrewView: (crew) ->
      new List.Crew
        collection: crew

    getLayoutView: ->
      new List.Layout
