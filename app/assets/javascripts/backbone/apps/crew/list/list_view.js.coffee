@Planet.module 'CrewApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: JST['crew/layout']

    regions:
      titleRegion: '#title-region'
      panelRegion: '#panel-region'
      newRegion: '#new-region'
      crewRegion: '#crew-region'

  class List.Title extends App.Views.ItemView
    template: JST['crew/_title']

  class List.Panel extends App.Views.ItemView
    template: JST['crew/_panel']

  class List.New extends App.Views.ItemView
    template: JST['crew/_new']

  class List.CrewMember extends App.Views.ItemView
    template: JST['crew/_crew_member']
    tagName: 'ul'
    className: 'crew-member'

  class List.Empty extends App.Views.ItemView
    template: JST['crew/_empty']
    tagName: 'li'

  class List.Crew extends App.Views.CompositeView
    template: JST['crew/_crew']
    itemView: List.CrewMember
    itemViewContainer: 'ul'
    emptyView: List.Empty
