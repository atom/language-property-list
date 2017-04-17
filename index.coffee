{exec} = require 'child_process'

module.exports =
	activate: ->
		atom.workspace.observeTextEditors (editor) ->

			plist = editor.getPath()

			if /\.plist$/.test plist
				# Convert from binary to XML for editing
				exec "plutil -convert xml1 #{plist}"

				# Convert back to binary from XML
				editor.onDidDestroy ->
					exec "plutil -convert binary1 #{plist}"
