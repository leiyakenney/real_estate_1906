class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.gsub(/\D/,'').to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    rooms.find_all{|room| room.category == category}
  end

  def area
    house_area = 0
    @rooms.find_all do |room|
      room.area
      house_area += room.area
    end
    house_area
  end

  def price_per_square_foot
    (@price.to_f / area).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by { |room| -room.area}
  end
end
