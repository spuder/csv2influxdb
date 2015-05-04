Gem::Specification.new do |s|
  s.name        = 'csv2influxdb'
  s.version     = '0.1.1'
  s.date        = '2015-05-04'
  s.summary     = "Converter for influxdb"
  s.description = "Converts CSV to JSON for influxdb"
  s.authors     = ["Spencer Owen"]
  s.email       = 'owenspencer@gmail.com'
  s.files       = ["bin/csv2influxdb"]
  s.homepage    =
    'https://github.com/spuder/csv2influxdb'
  s.license       = 'MIT'
  s.executables = ['csv2influxdb']
  s.add_runtime_dependency 'slop', '~> 3.6.0', '< 4.0.0'
end
