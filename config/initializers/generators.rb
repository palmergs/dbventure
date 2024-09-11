require 'eunomia'

Eunomia.add(JSON.parse(File.read(File.join(Rails.root, "gen", "colors.json"))))
Eunomia.add(JSON.parse(File.read(File.join(Rails.root, "gen", "animals.json"))))
Eunomia.add(JSON.parse(File.read(File.join(Rails.root, "gen", "plants.json"))))
