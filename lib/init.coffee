module.exports =
  config:
    executable:
      type: 'string'
      default: 'luac'
      description: 'The executable path to luac or luajit.'

  activate: ->
    console.log 'activate linter-lua'
