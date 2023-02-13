#!/usr/bin/ruby

class ConfigItem
  def initialize(name, required, descriptionCommand, description, prefixCheck, path, action)
    @name = name
    @required = required
    @descriptionCommand = descriptionCommand
    @description = description
    @prefixCheck = prefixCheck
    @path = path
    @action = action
  end
end

class ConfigParser
  @@configPath = "./will_be_installed.json"

  def parseConfig
    if !File.exist(@@configPath)
      puts "✅找到配置文件，开始解析！"

    else
      puts "❌未找到配置文件，解析失败！"
    end
  end
end
