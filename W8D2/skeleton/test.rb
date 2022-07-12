def bsearch(arr, target) 
    return -1 if arr.length == 0 
    mid = arr.length/2
    if target == arr[mid] 
        return mid 
    elsif target < arr[mid]
        return bsearch(arr[0...mid], target)
    else
        return bsearch(arr[mid + 1..-1], target)
    end
end

p bsearch([2,5,7,12,15], 2)