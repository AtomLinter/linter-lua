linter-lua
===========

> luac — The luac program parses lua files. It can be used for detecting errors in lua code. See [http://www.lua.org/manual/4.0/luac.html](http://www.lua.org/manual/4.0/luac.html) for more informations about luac.

This package will lint your `.lua` opened files in Atom through luac.  **It will lint on edit and/or save**, so you'll see instantly if your code has errors.

Due to the way that luac works it will only notify you of the first error found in the file.

## Linter Installation
Before using this package, you must ensure that `luac` is installed on your system.

## Installation

* `$ apm install linter` (if you don't have [AtomLinter/Linter](https://github.com/AtomLinter/Linter) installed).
* `$ apm install linter-lua`


## Other available linters
- [linter-php](https://atom.io/packages/linter-php), for PHP using `php -l`
- [linter-phpcs](https://atom.io/packages/linter-phpcs) - Linter plugin for PHP, using phpcs.
- [linter-phpmd](https://atom.io/packages/linter-phpmd) - Linter plugin for PHP, using phpmd.
- [linter-jshint](https://atom.io/packages/linter-jshint) - Linter plugin for JavaScript, using jshint.
- [linter-scss-lint](https://atom.io/packages/linter-scss-lint) - Sass Linter plugin for SCSS, using scss-lint.
- [linter-coffeelint](https://atom.io/packages/linter-coffeelint) Linter plugin for CoffeeScript, using coffeelint.
- [linter-csslint](https://atom.io/packages/linter-csslint) Linter plugin for CSS, using csslint.
- [linter-rubocop](https://atom.io/packages/linter-rubocop) - Linter plugin for Ruby, using rubocop.
- [linter-tslint](https://atom.io/packages/linter-tslint) Linter plugin for TypeScript, using tslint.
