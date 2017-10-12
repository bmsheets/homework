fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(fish_array)
    fish_array.each_with_index do |fish, i|
        longest_fish = true
        (i + 1...fish_array.length).each do |j|
           longest_fish = false if fish_array[j].length > fish.length 
        end
        return fish if longest_fish
    end
end

def dominant_octopus(fish_array)
    mergesort(fish_array).last
end

def mergesort(arr)
    return arr if arr.length < 2
    mid = arr.length / 2
    left = mergesort(arr.take(mid))
    right = mergesort(arr.drop(mid))
    merge(left, right)
end

def merge(arr1, arr2)
    result = []
    until arr1.empty? || arr2.empty?
        if arr1.first.length < arr2.first.length
           result << arr1.shift
        else
           result << arr2.shift
        end
    end
    result + arr1 + arr2 
end

def clever_octopus(fish_array)
    longest_fish = fish_array.first
    fish_array.each do |fish|
        longest_fish = fish if fish.length > longest_fish.length
    end
    longest_fish
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, array)
    array.each_index do |idx| 
       return idx if array[idx] == direction 
    end
    nil
end

tiles_hash = { "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7 }

def fast_dance(direction, hash)
    hash[direction]
end

puts sluggish_octopus(fish)
puts dominant_octopus(fish)
puts clever_octopus(fish)

puts slow_dance("up", tiles_array)
puts slow_dance("right-down", tiles_array)

puts fast_dance("up", tiles_hash)
puts fast_dance("right-down", tiles_hash)
