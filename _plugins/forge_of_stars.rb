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
            "category" => shape["category"],
            "Name" => "#{type["name"]} #{shape["name"]}".capitalize,
            "Cost" => ("#{(type["cost"] * shape["cost"]).round} cred" if type["cost"] && shape["cost"]),
            "Damage" => ("#{1 + type["damage_mul"].to_i + shape["damage_mul"].to_i}d#{type["damage"] + shape["damage"]} #{type["damage_type"]}" if type["damage"] && shape["damage"]),
            "Range" => ("#{(type["range"] * shape["range"]).round} ft" if type["range"] && shape["range"]),
            "Radius" => ("#{(type["radius"] * shape["radius"]).round} ft" if type["radius"] && shape["radius"]),
            "Weight" => ("#{(type["weight"] * shape["weight"]).round} lb" if type["weight"] && shape["weight"]),
            "Hands" => shape["hands"],
            "Special" => (type["special"] + shape["special"]).sort.uniq.join(", ").capitalize
          }
        end
      end
    end
  end
end