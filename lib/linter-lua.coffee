linterPath = atom.packages.getLoadedPackage("linter").path
Linter = require "#{linterPath}/lib/linter"

class LinterLua extends Linter
  # The syntax that the linter handles. May be a string or
  # list/tuple of strings. Names should be all lowercase.
  @syntax: 'source.lua'

  linterName: 'luac'

  # A regex pattern used to extract information from the executable's output.
  regex:
    '^.+?:.+?:' +
    '(?<line>\\d+):\\s+' +
    '(?<message>.+?' +
    '(?:near (?<near>\'.+\')|$))'

  errorStream: 'stderr'

  constructor: (editor) ->
    super(editor)

    # Set to observe config options
    @configSubscription = atom.config.observe 'linter-lua.executable', => @updateCommand()

  updateCommand: ->
    executable = atom.config.get 'linter-lua.executable'
    if /luajit[^\\/]*$/.test(executable)
        @cmd = [executable, '-bl']
    else
        @cmd = [executable, '-p']

  destroy: ->
    super
    @configSubscription.dispose()

module.exports = LinterLua
