module ForgeOfStars
  class DataGenerator < Jekyll::Generator
    safe true

    def generate(site)
      weapon_types = site.data["weapons"]["types"].flat_map do |name, type|
        shapes = type["shapes"].map do |name|
          site.data["weapons"]["shapes"][name]&.merge({"name" => name})
        end.compact
        type.merge({"name" => name, "shapes" => shapes})
      end

      site.data["weapon_combinations"] =
        weapon_types.flat_map do |type|
          type["shapes"].map do |shape|
            {
              "name" => "#{type["name"]} #{shape["name"]}",
              "skill" => shape["skill"],
              "cost" => type["cost"] * shape["cost"],
              "damage" => type["damage"] + shape["damage"],
              "damage_type" => type["damage_type"],
              "weight" => type["weight"] * shape["weight"],
              "special" => type["special"] + shape["special"]
            }
          end
        end
    end
  end
end