linterPath = atom.packages.getLoadedPackage("linter").path
Linter = require "#{linterPath}/lib/linter"

class LinterLua extends Linter
  # The syntax that the linter handles. May be a string or
  # list/tuple of strings. Names should be all lowercase.
  @syntax: 'source.lua'

  # A string, list, tuple or callable that returns a string, list or tuple,
  # containing the command line (with arguments) used to lint.
  cmd: 'luac -p'

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

    atom.config.observe 'linter-lua.luacExecutablePath', =>
            @executablePath = atom.config.get 'linter-lua.luacExecutablePath'

  destroy: ->
    atom.config.unobserve 'linter-lua.luacExecutablePath'

module.exports = LinterLua
