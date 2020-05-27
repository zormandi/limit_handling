require 'zeitwerk'

loader = Zeitwerk::Loader.new
loader.push_dir 'lib/models'
loader.push_dir 'lib/registries'
loader.push_dir 'lib/use_cases'
loader.setup
