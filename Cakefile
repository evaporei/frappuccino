{ exec, spawn } = require 'child_process'

beautifyCommand = (command) ->
  '\n> ' + command

tasks =
  build:
    name: 'build'
    description: 'Build project from src/*.coffee to lib/*js'
    command: 'coffee --compile --output lib/ src/'
  test:
    name: 'test'
    description: 'Run test files on /tests folder'
    command: 'jest'

printDescriptionAndCommand = (taskName) ->
  console.log tasks[taskName].description
  console.log beautifyCommand tasks[taskName].command

task tasks.build.name, tasks.build.description, ->
  printDescriptionAndCommand tasks.build.name
  exec tasks.build.command, (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

task tasks.test.name, tasks.test.description, ->
  printDescriptionAndCommand tasks.test.name
  spawn tasks.test.command, stdio: 'inherit', (err, stdout, stderr) ->
    throw err if err
