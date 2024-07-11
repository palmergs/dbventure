# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


courtyard = Stage.create!(
  name: "Courtyard",
  description: <<~STR 
    A large open area surrounded by a tall stone wall
    except to the north where there is a forboding stone keep.
  STR
)

hall = Stage.create!(
  name: "Banquet Hall",
  description: <<~STR
    The center of the keep consists of a banquet hall large enough to
    host at least fifty guests.
  STR
)

gatehouse = Stage.create!(
  name: "Gatehouse",
  description: <<~STR
    The bottom floor of the gatehouse is a single large room where the 
    soldiers defending the fortree can gather.
  STR
)

gatehouse_platform = Stage.create!(
  name: "Gatehouse",
  description: <<~STR
    A large platform protected by stone crenelations looks over 
    the approach to the fortress gate to the south and north 
    into the courtyard.
  STR
)

throne_room = Stage.create!(
  name: "Throne Room",
  description: <<~STR
    This large room has hints of its faded glory with flecks of gilt still
    visible on the bas-reliefs that are carved on the walls.
  STR
)

gate = Stage.create!(
  name: "Gate",
  description: <<~STR
    A large stone archway provides access to the interior of the fortress.
  STR
)

approach = Stage.create!(
  name: "Fortress Road",
  start_location: true,
  description: <<~STR
    A dirt road with deep wagon ruts leads to the fortress gate.
  STR
)

Passage.create!(name: "Road", description: "Dirt road leading to the gate.", from: approach, to: gate, direction: "North")
Passage.create!(name: "Road", description: "Dirt road leading away from the gate.", from: gate, to: approach, direction: "South")
Passage.create!(name: "Gateway", description: "Gate leading into the fortress.", from: gate, to: courtyard, direction: "North")
Passage.create!(name: "Gateway", description: "Gate leading out of the fortress.", from: courtyard, to: gate, direction: "South")
Passage.create!(name: "Entryway", description: "A large doorway leading into the keep.", from: courtyard, to: hall, direction: "North")
Passage.create!(name: "Entryway", description: "A large doorway leads out to the courtyard.", from: hall, to: courtyard, direction: "South")
Passage.create!(name: "Archway", description: "A wide archway leads into the throneroom.", from: hall, to: throne_room, direction: "North")
Passage.create!(name: "Archway", description: "A wide archway leads out to the banquet hall.", from: throne_room, to: hall, direction: "South")
Passage.create!(name: "Gatehouse Door", description: "A narrow doorway leading to the gate house.", from: courtyard, to: gatehouse, direction: "Gatehouse")
Passage.create!(name: "Gatehouse Door", description: "A narrow doorway leading to the courtyard.", from: gatehouse, to: courtyard, direction: "North")
Passage.create!(name: "Stairway", description: "A stone stairway leads up.", from: gatehouse, to: gatehouse_platform, direction: "Up")
Passage.create!(name: "Stairway", description: "An opening in the floor leads to stairways down.", from: gatehouse_platform, to: gatehouse, direction: "Down")
Passage.create!(name: "View North", description: "The courtyard is a long distance down to the north", from: gatehouse_platform, to: courtyard, direction: "Jump!")

elf = Creature.create!(name: "Elf", description: "Generally slim and graceful humanoids.")
dwarf = Creature.create!(name: "Dwarf", description: "Generally short and stocky.")
orc = Creature.create!(name: "Orc", description: "Tall and fearsome inhabitants of the deep caves and dungoens.")
goblin = Creature.create!(name: "Goblin", description: "Short and scrawny inhabitants of the deep forests.")
rat = Creature.create!(name: "Rat", description: "Dark grey furred vermin common in cities.")

dime = Item.create(name: "Silver Dime", description: "A simple silver coin that is the most common unit of currency")
shortsword = Item.create(name: "Shortsword", description: "A single handed sword with a blade of less than 2' (60cm)")
shortbow = Item.create!(name: "Shortbow", description: "A yew bow small enough to use from horseback or in tight quarters.")
arrow = Item.create!(name: "Arrow", description: "A simple ash arrow with goose feather fletchings and an iron arrowhead.")
quiver = Item.create!(name: "Quiver", description: "This leather quiver provides easy access to up to twenty arrows.")

urg = Actor.create!(name: "Urg the Gatekeeper",
                    description: "A larger than average orc with a scar on his right cheek",
                    creature: orc,
                    stage: gate)
urg.props.create!(item: shortsword, name: "Shortsword", slots: ["Right Hand"])

griv = Actor.create!(name: "Griv the Archer",
                     description: "A wiry and shifty looking goblin",
                     creature: goblin,
                     stage: gatehouse_platform)
griv.props.create!(item: shortbow, name: "Shortbow", slots: ["Right Hand", "Left Hand"])
quiver = griv.props.create!(item: quiver, name: "Quiver", slots: ["Back"])
quiver.props.create!(item: arrow, name: "Arrow", slots: ["Stored"])




