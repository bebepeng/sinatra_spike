require 'csv'

class Menu
  def initialize(file)
    @menu_list = CSV.read(file, headers: true)
    puts @menu_list.inspect
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
      csv << ["#{name.to_s}", "#{@menu_list[-1]["id"].to_i + 1}",]
    end
    @menu_list = CSV.read(@file, headers: true)
  end

  def edit_item(name, id)
    counter = 0
    @menu_list.each do |row|
      if row["id"] == id.to_s
        @menu_list[counter]["name"] = name
      end
      counter += 1
    end

    CSV.open(@file, 'w') do |csv|
      csv << %w(name id)
      @menu_list.each do |row|
        csv << row
      end
    end
    @menu_list = CSV.read(@file, headers: true)
  end
end
