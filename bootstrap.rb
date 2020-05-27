require 'zeitwerk'

loader = Zeitwerk::Loader.new
loader.push_dir 'lib/models'
loader.setup
