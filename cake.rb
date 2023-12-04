RAISIN_CHAR = "0"

def perform_cake_cutting(cake)
  height = cake.size
  width = cake[0].size
  raisin_count = cake.flatten.count(RAISIN_CHAR)

  available_cuts = generate_possible_cuts(cake, height, width)

  sorted_cuts = available_cuts.sort_by { |cut| -cut[2] }

  result = []
  covered = Array.new(height) { Array.new(width, false) }

  sorted_cuts.each do |cut|
    x, y, w, h = cut

    unless is_area_covered?(covered, x, y, w, h)
      result << get_slice(cake, x, y, w, h)
      mark_area_as_covered(covered, x, y, w, h)
      break if result.size == raisin_count
    end
  end

  result
end

def generate_possible_cuts(cake, height, width)
  (1..height).flat_map do |h|
    (1..width).flat_map do |w|
      (0..height-h).flat_map do |y|
        (0..width-w).select do |x|
          count_raisins_in_cut(cake, x, y, w, h) == 1
        end.map { |x| [x, y, w, h] }
      end
    end
  end
end

def count_raisins_in_cut(cake, x, y, w, h)
  cake[y..y+h-1].map { |row| row[x..x+w-1].count(RAISIN_CHAR) }.sum
end

def get_slice(cake, x, y, w, h)
  cake[y..y+h-1].map { |row| row[x..x+w-1] }
end

def is_area_covered?(covered, x, y, w, h)
  covered[y..y+h-1].any? { |row| row[x..x+w-1].any? }
end

def mark_area_as_covered(covered, x, y, w, h)
  covered[y..y+h-1].each { |row| row[x..x+w-1] = [true] * w }
end

cake = [
  ".0......",
  "......0.",
  "....0...",
  "..0....."
]

result = perform_cake_cutting(cake)
result.each_with_index { |piece, index| puts "#{index + 1}) #{piece.join(", ")} , " }
