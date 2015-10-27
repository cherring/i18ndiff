require "i18ndiff/version"
require "yaml"

module I18ndiff

  def self.convert(old_file, new_file)
    compare_files(old_file, new_file)
  end

  def self.compare_files(old_file, new_file)
    old_yml_str = YAML.load_file(old_file)
    new_yml_str = YAML.load_file(new_file)
    new_hash = {}
    begin
      compare_hash(new_yml_str, old_yml_str, new_hash)
      new_hash.to_yaml
    rescue NoMethodError => e
      puts "Sorry there appears to be a problem\n"
      puts "The error reported is: \n"
      puts e
    end
  end

  def self.compare_hash(new_yaml, old_yaml, new_hash, context = [])
    new_yaml.each do |key, value|

      unless old_yaml.key?(key)
        hash = new_hash

        context.each do |c|
          if hash.has_key?(c)
            hash = hash[c]
          else
            hash = hash.store(c, {})
          end
        end

        hash = hash.store(key, value)
        next
      end

      value2 = old_yaml[key]
      if value.is_a?(Hash)
        compare_hash(value, value2, new_hash, (context + [key]))
        next
      end
    end
  end

end
