require_relative './controller/ui'

class App
  def initialize
    @ui = UI.new
    @run_app = false
  end

  def run
    @run_app = true
    puts "\n*** WELCOME TO YOUR PERSONAL CATALOG ***"
    @ui.run while @run_app
  end
end

app = App.new
app.run
