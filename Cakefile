{ spawn } = require 'child_process'

beautifyCommand = (command) ->
  '\n> ' + command

tasks =
  build:
    name: 'build'
    description: 'Build project from src/*.coffee to lib/*js'
    command: 'coffee'
    args: ['--compile', '--output', 'lib/', 'src/']
  test:
    name: 'test'
    description: 'Run test files on /tests folder'
    command: 'jest'
    args: []

printDescriptionAndCommand = (taskObj) ->
  console.log taskObj.description
  fullCommand = taskObj.command + ' ' + taskObj.args.join(' ')
  console.log beautifyCommand fullCommand

setupTasks = (taskObj) ->
  task taskObj.name, taskObj.description, ->
    printDescriptionAndCommand taskObj
    spawn taskObj.command, taskObj.args, stdio: 'inherit'

setupTasks obj for name, obj of tasks
