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

printDescriptionAndCommand = (taskName) ->
  console.log tasks[taskName].description
  fullCommand = tasks[taskName].command + ' ' + tasks[taskName].args.join(' ')
  console.log beautifyCommand fullCommand

task tasks.build.name, tasks.build.description, ->
  printDescriptionAndCommand tasks.build.name
  spawn tasks.build.command, tasks.build.args, stdio: 'inherit'

task tasks.test.name, tasks.test.description, ->
  printDescriptionAndCommand tasks.test.name
  spawn tasks.test.command, tasks.test.args, stdio: 'inherit'
