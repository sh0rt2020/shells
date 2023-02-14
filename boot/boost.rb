#!/usr/bin/ruby

require 'rubygems'
require 'json'
require 'pp'

$configPath = "./will_be_installed.json"

class ConfigItem
  attr_reader :name, :required, :descriptionCommand, :description, :prefixCheck, :path, :action

  def initialize(hash)
    @name               = hash['name']
    @required           = hash['required']
    @descriptionCommand = hash['descriptionCommand']
    @description        = hash['description']
    @prefixCheck        = hash['prefixCheck']
    @path               = hash['path']
    @action             = hash['action']
  end
end

class ConfigParser

  def parseConfig(path)
    if File.exist?(path)
      puts "✅找到配置文件，开始解析！"

      json = File.read(path)
      obj = JSON.parse(json)

      puts obj.length
      puts obj.class
      puts obj[2].class
      puts obj[2]['required']

      item = ConfigItem.new(obj[2])
      puts item.class
      puts item.required
    else
      puts "❌未找到配置文件，解析失败！"
    end
  end
end


ConfigParser.new.parseConfig($configPath)
