def windowed_max_range(arr, window_size)
    max_range = -Float::INFINITY 
    for i in 0...arr.length-window_size+1
        window = arr[i...i+window_size]
        range = window.max - window.min 
        max_range = [max_range, range].max
    end
    max_range 
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8