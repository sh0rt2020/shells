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
      items = Array.new
      obj.each do |hash|
        items.push(ConfigItem.new(hash))
      end

      return items
    else
      puts "❌未找到配置文件，解析失败！"
      return Array.new
    end
  end
end


items = ConfigParser.new.parseConfig($configPath)
items.each do |item|
  if item.required == true
    # 打印指令名称
    puts "********** 准备安装 #{item.name} ************"

    # 打印指令描述信息
    if item.descriptionCommand == true
      exec item.description
    else
      puts item.description
    end

    # 检查指令是否已安装
    checkPath = item.path
    if item.prefixCheck == true
      Dir::foreach('/Applications/') { |appname|
        if appname.include?(checkPath)
          puts "*********** #{item.name} 已安装 *************"
        else
          puts "*********** 正在安装 #{item.name} ************"
          exec item.action
        end
      }
    else
      if File.absolute_path?(checkPath) == false
        checkPath = File.expand_path(checkPath, "~")
      end

      if File.directory?(checkPath) || File.symlink?(checkPath) || File.exist?(checkPath)
        puts "*********** #{item.name} 已安装 *************"
      else
        puts "*********** 正在安装 #{item.name} ************"
        exec item.action
      end
    end

    puts
    puts
  end
end
