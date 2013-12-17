{fs} = require 'atom'

module.exports =
  activate: ->
    atom.workspaceView.command 'revert-buffer:revert', =>
      paneItem = atom.workspaceView.getActivePaneItem()

      return unless paneItem.getPath? and paneItem.setText?
      fs.readFile paneItem.getPath(), (error, contents) ->
        paneItem.setText(contents.toString()) unless error
