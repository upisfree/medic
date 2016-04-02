help = ->
  str = """
Manage your Windows apps from command line.

Usage:
  medik [command] [options]

Commands:
  update, list, reset, help

Options:
  --id

Examples:
  medik update --id="APP_ID"  creates new submission of app in the store
  medik list                  print list of all your apps
  medik reset                 delete cache and all medik settings
        """

  console.log str

# Creates new submission in the store for the app.
# export
module.exports = help