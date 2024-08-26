require_relative 'knight_position'

def search_knight_path(source, destination)
  queue = []
  visited = []

  queue.push({ position: source, path: [] })
  until queue.empty?
    queue.shift => { position: current_position, path: current_path }

    next if current_position.included_in? visited

    new_path = current_path + [current_position]
    return new_path if current_position.equal? destination

    visited << current_position

    queue += current_position.next_positions.map do |position|
      { position: position, path: new_path }
    end
  end

  []
end

source = KnightPosition.new(size: 4, x: 0, y: 0)
destination = KnightPosition.new(size: 4, x: 3, y: 3)
p search_knight_path source, destination
puts

source = KnightPosition.new(size: 4, x: 3, y: 3)
destination = KnightPosition.new(size: 4, x: 0, y: 0)
p search_knight_path source, destination
puts

source = KnightPosition.new(size: 8, x: 0, y: 0)
destination = KnightPosition.new(size: 8, x: 7, y: 7)
p search_knight_path source, destination
puts

source = KnightPosition.new(size: 6, x: 3, y: 3)
destination = KnightPosition.new(size: 6, x: 4, y: 3)
p search_knight_path source, destination
puts