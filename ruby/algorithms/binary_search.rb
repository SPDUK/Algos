# frozen_string_literal: true

def binary_search(list, item)
  low = 0
  high = list.length - 1

  while low <= high
    mid = low + ((high - low) / 2)
    if  list[mid] == item
      return mid
    elsif list[mid] < item
      low = mid + 1
    else
      high = mid - 1
    end
  end
  "Value not in array"
end
