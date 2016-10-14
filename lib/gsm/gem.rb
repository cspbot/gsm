module Gsm
  class Gem
    require "yaml"
    
    attr_reader :conf_path, :name_pivot
    attr_reader :sources
    attr_reader :use_name

    MAX_GENERATED_NAMES = 11
    GEMSTONE_NAMES = [
      "Amethyst",
      "Emerald",
      "Chrysocolla",
      "Hematite",
      "Jasper",
      "Malachite",
      "Quartz",
      "Ruby",
      "Sapphire",
      "Sugilite",
      "Turquoise"
    ].freeze

    def initialize(conf_path)
      @sources = Hash.new
      @name_pivot = 0
      @conf_path = conf_path

      if !load_from_yaml?
        # load from `gem sources`
        load

        @use_name = ""
      end
    end

    def load
      outputs = `gem source -l`
      outputs.split("\n").each do |line|
        line.strip!
        if validate_url?(line)
          name = generate_name
          @sources[name] = line
        end
      end
    end

    def add(name, url)
      return false if validate_name?(name)

      # validate url
      if !validate_url?(url)
        return false
      end

      @sources[name] = url
      save
    end

    def del(name)
      return false if @use_name.eql?(name)
      @sources.delete(name)
      save
    end

    def get
      @use_name
    end

    def use(name)
      return false if validate_name?(name)

      @use_name = name

      apply_source
      save
    end

    def save
      data = {
        "use": @use_name,
        "sources": @sources
      }
      # write to file
      f = File.new(@conf_path, "w")
      f.syswrite(YAML.dump(data))
    end

    def to_s
      return @sources[@use_name] if @sources.has_key?(@use_name)
    end

    private
    def apply_source
      `gem sources -c`

      url = @sources[@use_name]

      `gem sources --add #{url}`
    end

    private
    def validate_name?(name)
      return false if name.empty?
      return false if name.start_with?("--")
      return false if @sources.has_key?(name)
      true
    end

    private
    def validate_url?(url)
      url.start_with?("http://") || url.start_with?("https://") ? true : false
    end

    private
    def load_from_yaml?
      # read yaml
      if File.exist?(@conf_path)
        data = YAML.load_file(@conf_path)
        @use_name = data["use"]
        @sources = data["sources"]
        true
      else
        f = File.new(@conf_path, "w")
        f.close
        false
      end
    end

    private
    def generate_name
      if @name_pivot >= MAX_GENERATED_NAMES - 1
        return GEMSTONE_NAMES[(++@name_pivot)-MAX_GENERATED_NAMES] << 
          "-" << 
          (@name_pivot/MAX_GENERATED_NAMES).to_s
      end

      GEMSTONE_NAMES[++@name_pivot]
    end
  end
end