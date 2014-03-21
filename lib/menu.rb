require 'csv'

class Menu
  def initialize(file)
    @menu_list = CSV.read(file, headers: true)
    @file = file
  end

  def get_menu
    item_block = []
    @menu_list.each do |item|
      item_block.push(Item.new(item["name"], item["id"]))
    end
    item_block
  end

  def add_item(name)
    CSV.open(@file, 'a+') do |csv|
      csv << [" ", "\n"]
      csv << ["#{name.to_s}","#{@menu_list[-1]["id"].to_i + 1}"]
    end
    @menu_list = CSV.read(@file, headers: true)
  end
end
