{CompositeDisposable} = require('atom')

module.exports =
  config:
    executablePath:
      type: 'string'
      default: 'luac'
      description: 'The executable path to luac or luajit.'
  activate: ->
    require('atom-package-deps').install('linter-lua');
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.config.observe 'linter-lua.executablePath', (executablePath) =>
      @executablePath = executablePath
  deactivate: ->
    @subscriptions.dispose()
  provideLinter: ->
    helpers = require('atom-linter')
    regex = \
    '^.+?:.+?:' +
      '(?<line>\\d+):\\s+' +
      '(?<message>.+?' +
      '(?:near (?<near>.+)|$))'
    provider =
      grammarScopes: ['source.lua']
      scope: 'file'
      lintOnFly: true
      lint: (textEditor) =>
        parameters = []
        if @executablePath.indexOf('luajit') isnt -1
          parameters.push('-bl')
        else
          parameters.push('-p')
        parameters.push('-') # to indicate that the input is in stdin
        return helpers.exec(@executablePath, parameters, {stdin: textEditor.getText(), stream: 'stderr'}).then (output) ->
          return helpers.parse(output, regex, filePath: textEditor.getPath()).map (error) ->
            error.type = 'Error'
            return error
