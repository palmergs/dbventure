# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'can be instantiated' do
    expect(create(:item)).to be_persisted
    expect(create(:item)).to be_persisted
  end

  describe :scopes do
    it :has_props do
      actor = create(:actor)
      item = create(:item)
      expect(item.props.create(slotted: actor)).to be_persisted
    end
  end

  describe :slots do
    it 'creatures have slots' do 
      # expect(create(:dwarf).slots).to eq([
      #   :head,
      #   :earings,
      #   :spectacles,
      #   :neck,
      #   :shoulder,
      #   :torso,
      #   :strong_arm,
      #   :string_hand,
      #   :weak_arm,
      #   :weak_hand,
      #   :legs,
      #   :feet,
      # ]
      #
      # expect(create(:horse).slots).to eq([
      #   :saddle,
      #   :barding,
      #   :hoofs,
      # ])
      #
      # expect(create(:wolf).slots).to eq([
      #   :saddle,
      #   :barding,
      #   :bite,
      # ])
      #
      # expect(create(:barghast).slots).to eq([
      #   :earing,
      #   :earing,
      #   :spectacles,
      #   :neck,
      #   :shoulder,
      #   :torso,
      #   :arm,
      #   :strong_hand,
      #   :ring,
      #   :arm,
      #   :weak_hand,
      #   :ring,
      #   :legs,
      #   :feet,
      #   :bite,
      #   :claws,
      # ])
    end


    def template_examples
      body_shape_templates = {
        headed: %i[head ears eyes neck],
        erect: %i[shoulder back chest],
        bipedal: %i[legs feet],
        quadrupedal: %i[barding fore_legs hind_legs],
        mount: %i[saddle],
        strong_arm: %i[strong_arm strong_hand ring],
        weak_arm: %i[weak_arm weak_hand ring],
        tailed: %i[tail],
        winged: %i[wings],
        biter: %i[bite],
        puncher: %i[fists],
        slasher: %i[claws],
        raker: %i[hind_claws],
      }

      # human = :headed + :erect + :strong_arm + :weak_arm + :bipedal
      # barghast = :headed + :erect + :strong_arm + :weak_arm + :bipedal + :biter + :slasher
      # dragon = %i[eyes neck] + :quadrupedal + :mount + :tailed + :winged + :biter + :slasher + :raker
      # skeleton = %i[head eyes neck] + :erect + :strong_arm + :weak_arm + :bipedal
      # wraith = :biter + :slasher # no corporeal form ... spooky
    end


    it 'has slots where it can be carried and the actions that can be taken' do
      # expect(create(:sword).slots).to eq(
      #     strong_hand: {
      #       actions: [:attack, :throw, :drop, :use],
      #       modifiers: [],
      #     },
      #     weak_hand: {
      #       actions: [:attack, :throw, :drop, :use],
      #       modifiers: [:damage_penalty, :range_penalty, :attack_penalty],
      #     },
      #     [:strong_hand, :weak_hand] => {
      #       actions: [:attack, :throw, :drop, :use],
      #       modifiers: [:damange_bonus],
      #     },
      #     scabbard: {
      #       actions: [:drop, :equip, :use],
      #       modifiers: [],
      #     },
      #     store: {
      #       actions: [:get, :equip],
      #       modifiers: [],
      #     },
      #     rack: {
      #       actions: [:get, :equip],
      #       modifiers: [],
      #     })
      #
      # expect(create(:short_bow)).to eq(
      #     [:strong_hand, :weak_hand] => {
      #       actions: [:attack, :shoot, :drop, :use],
      #       modifiers: [],
      #     },
      #     shoulder: {
      #       actions: [:drop, :equip],
      #       modifiers: [],
      #     },
      #     store: {
      #       actions: [:get, :equip],
      #       modifiers: [],
      #     },
      #     rack: {
      #       actions: [:get, :equip],
      #       modifiers: [],
      #     })
      #
      # expect(create(:plate_armor)).to eq(
      #     [:strong_arm, :weak_arm, :torso, :legs] => {
      #       actions: [:remove, :use],
      #       modifiers: [:loud, :heavy],
      #     },
      #     store: {
      #       actions: [:get, :equip],
      #       modifiers: [],
      #     },
      #     rack: {
      #       actions: [:get, :equip],
      #       modifiers: [],
      #     })
      #
    end

    it 'has slots where things can be stored' do
      # belt = create(:belt)
      # expect(belt.size).to eq :small
      # expect(belt.slots).to eq(
      #     waist: {
      #       actions: [:drop],
      #       modifiers: [],
      #     },
      #     store: {
      #       actions: [:get, :equip],
      #       modifiers: [],
      #     }
      # expect(belt.storage_slots).to eq[:scabbard, :scabbard, :attach]
      # expect(belg.storage_size).to eq :small
      #
      # pouch = create(:pouch)
      # expect(pouch.size).to eq :small
      # expect(pouch.slots).to eq(
      #     attach: {
      #       actions: [:drop, :use],
      #       modifiers: [],
      #     })
      # expect(pouch.storage_slots).to eq[:store, :store, :store, :store, :store, :store, :store, :store, :store]
      # expect(pouch.storage_size).to eq :tiny
    end

    it 'has size' do
      # expect(create(:coin).size).to eq :coin
      # expect(create(:dagger).size).to eq :tiny
      # expect(create(:sword).size).to eq :small
      # expect(create(:short_bow).to eq :small
      # expect(create(:long_bow).to eq :medium
      # expect(create(:armor).size).to eq :medium
      # expect(create(:bed).size).to eq :large
    end

    it 'can is stackable' do
      # sword = create(:sword)
      # braodsword = create(:broadsword)
      # expect(broadsword).to stackable_with(sword)
    end

    it 'can be combined' do
      # expect(create(:coin)).to be combinable
      # expect(create(:coin).count).to eq 1
    end
  end
end
