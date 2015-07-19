module.exports =
  config:
    executable:
      type: 'string'
      default: 'luac'
      description: 'The executable path to luac or luajit.'
  provideLinter: ->
    provider =
      grammarScopes: ['source.lua']
      scope: 'file' # or 'project'
      lintOnFly: false # must be false for scope: 'project'
      lint: (textEditor)->
        return new Promise (resolve, reject)->
          message = {type: 'Error', text: 'Something went wrong', range:[[0,0], [0,1]]}
          resolve([message])