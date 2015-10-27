require "i18ndiff/version"
require "yaml"

module I18ndiff

  def self.convert(*args)
    @old_file = args[0]
    @new_file = args[1]
    compare_files(old_file, new_file)
  end

  def self.compare_files(old_file, new_file)
    old_yml_str = YAML.load_file(old_file)
    new_yml_str = YAML.load_file(new_file)
    new_hash = {}
    compare_hash(new_yml_str, old_yml_str, new_hash)
    new_hash.to_yaml
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

  def self.old_file
    @old_file
  end

  def self.new_file
    @new_file
  end

end
