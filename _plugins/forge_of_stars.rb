module ForgeOfStars
  class DataGenerator < Jekyll::Generator
    safe true
    priority :high

    def generate(site)
      site.data["weapon_combinations"] =
        combine_weapons(join_weapon_shapes(site.data["weapons"]))

      site.data["powers"] =
        site.data["power_data"].flat_map do |name, school|
          school.map do |name2, power|
            {name2 => power.merge({"school" => name.capitalize()})}
          end
        end.reduce({}, :merge)

      site.data["trait_to_basic_powers"] = {}
      for power in site.data["basic-powers"]
        if power[1]["traits"]
          for t in power[1]["traits"]
            if !site.data["trait_to_basic_powers"].key?(t)
              site.data["trait_to_basic_powers"][t] = []
            end
            site.data["trait_to_basic_powers"][t] << power[0]
          end
        end
      end

      site.data["trait_to_powers"] = {}
      for school in site.data["power_data"]
        for power in school[1]
          if power[1]["traits"]
            for t in power[1]["traits"]
              if !site.data["trait_to_powers"].key?(t)
                site.data["trait_to_powers"][t] = []
              end
              site.data["trait_to_powers"][t] << power[0]
            end
          end
        end
      end

      site.data["trait_to_weapons"] = {}
      for weapon in site.data["weapon_combinations"]
        for s in weapon["special"]
          t = s["name"]
          if !site.data["trait_to_weapons"].key?(t)
            site.data["trait_to_weapons"][t] = []
          end
          site.data["trait_to_weapons"][t] << weapon
        end
      end
    end

    private

    # Replaces the list of weapon shape names for each weapon type with that
    # shape's data.
    def join_weapon_shapes(weapons)
      weapons["types"].flat_map do |name, type|
        shapes = type["shapes"].map do |name|
          weapons["shapes"][name]&.merge({"name" => name})
        end.compact
        type.merge({"name" => name, "shapes" => shapes})
      end
    end

    # Combines weapon types with all of their supported shapes.
    def combine_weapons(joined_weapons)
      joined_weapons.flat_map do |type|
        type["shapes"].map do |shape|
          special =
            (type["special"] + shape["special"]).sort.uniq.map do |trait|
              words = trait.split(" ")
              if /[0-9]/.match?(words.last)
                {"name" => words[0..-2].join(" "), "value" => words.last}
              else
                {"name" => trait}
              end
            end
          
          {
            "category" => shape["category"],
            "name" => "#{type["name"]} #{shape["name"]}".capitalize,
            "cost" => type.key?("cost") && shape.key?("cost") ?
                      (type["cost"] * shape["cost"]).round : nil,
            "damage_mul" =>
              1 + type["damage_mul"].to_i + shape["damage_mul"].to_i,
            "damage" => type.key?("damage") && shape.key?("damage") ?
                        type["damage"] + shape["damage"] : nil,
            "damage_type" => type["damage_type"],
            "range" => type.key?("range") && shape.key?("range") ?
                       (type["range"] * shape["range"]).round : nil,
            "radius" => type.key?("radius") && shape.key?("radius") ?
                        (type["radius"] * shape["radius"]).round : nil,
            "weight" => type.key?("weight") && shape.key?("weight") ?
                        (type["weight"] * shape["weight"]).round : nil,
            "hands" => shape["hands"],
            "special" => special
          }
        end
      end
    end
  end
end