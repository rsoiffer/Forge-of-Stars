module ForgeOfStars
  class DataGenerator < Jekyll::Generator
    safe true

    def generate(site)
      site.data["weapon_combinations"] =
        combine_weapons(join_weapon_shapes(site.data["weapons"]))
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
          {
            "name" => "#{type["name"]} #{shape["name"].downcase}",
            "skill" => shape["skill"],
            "cost" => (type["cost"] * shape["cost"]).round,
            "damage" => type["damage"] + shape["damage"],
            "damage_type" => type["damage_type"],
            "weight" => (type["weight"] * shape["weight"]).round,
            "special" => type["special"] + shape["special"]
          }
        end
      end
    end
  end
end