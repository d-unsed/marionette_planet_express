@Planet.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Crew extends App.Entities.Model
    urlRoot: Routes.crew_index_path()

  class Entities.CrewCollection extends App.Entities.Collection
    model: Entities.Crew
    url: Routes.crew_index_path()

  API =

    getCrewMember: (params) ->
      member = new Entities.Crew params
      member.fetch()
      member

    getCrew: ->
      crew = new Entities.CrewCollection
      crew.fetch reset: true
      crew

  App.reqres.setHandler 'crew:entity', (id) ->
    API.getCrewMember
      id: id

  App.reqres.setHandler 'crew:entities', ->
    API.getCrew()
