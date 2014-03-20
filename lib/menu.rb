require 'csv'

class Menu
  def get_menu(file)
    @menu_list = CSV.read(file, headers: true)
    item_block = []
    @menu_list.each do |item|
      item_block.push(Item.new(item["name"], item["id"]))
    end
    item_block
  end
end

