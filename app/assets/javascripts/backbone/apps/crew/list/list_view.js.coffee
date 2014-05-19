@Planet.module 'CrewApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: JST['crew/list/layout']

    regions:
      titleRegion: '#title-region'
      panelRegion: '#panel-region'
      newRegion: '#new-region'
      crewRegion: '#crew-region'

  class List.Title extends App.Views.ItemView
    template: JST['crew/list/_title']

  class List.Panel extends App.Views.ItemView
    template: JST['crew/list/_panel']
    triggers:
      'click #new-crew': 'new:crew:button:clicked'

  class List.CrewMember extends App.Views.ItemView
    template: JST['crew/list/_crew_member']
    tagName: 'li'
    className: 'crew-member'

    events:
      'click': -> @trigger 'crew:member:clicked', @model

  class List.Empty extends App.Views.ItemView
    template: JST['crew/list/_empty']
    tagName: 'li'

  class List.Crew extends App.Views.CompositeView
    template: JST['crew/list/_crew']
    itemView: List.CrewMember
    itemViewContainer: 'ul'
    emptyView: List.Empty
