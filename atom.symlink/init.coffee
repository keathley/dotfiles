# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

#init.coffee
atom.commands.add 'atom-text-editor', 'exit-insert-mode-if-proceeded-by-k': (e) ->
  editor = @getModel()
  pos = editor.getCursorBufferPosition()
  range = [pos.traverse([0,-1]), pos]
  lastChar = editor.getTextInBufferRange(range)
  if lastChar != "k"
    e.abortKeyBinding()
  else
    editor.backspace()
    atom.commands.dispatch(e.currentTarget, 'vim-mode:activate-command-mode')

atom.commands.add 'atom-text-editor', 'ruby:extract-method', ->
  return unless editor = atom.workspace.getActiveTextEditor()
  selection = editor.getLastSelection()

atom.commands.add 'atom-text-editor', 'open-tasks', ->
  open_local_or_global_tasks()

atom.commands.add 'atom-text-editor', 'open-global-tasks', ->
  open_global_tasks()

open_tasks = (path) ->
  atom.workspace.open( path )

open_global_tasks = () ->
  path = '~/dotfiles/lists/tasks.todo'
  open_tasks( path )

open_local_or_global_tasks = () ->
  console.log 'test'
  local_tasks = 'tasks.todo'
  directory = atom.project.getDirectories()[0]
  file = directory.getFile( local_tasks )

  file.exists().then (isExisting) ->
    if isExisting
      open_tasks( local_tasks )
    else
      open_global_tasks()
