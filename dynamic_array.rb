class DynamicArray

  attr_accessor :len, :capacity, :arr

  def initialize(size = 16)
    raise "Illegal capacity: #{capacity}" if size < 0
    capacity = size
    puts "initialized! the capacity is #{capacity}"
    arr = Array.new(capacity)
  end

  def size
    len
  end

  def is_empty?
    size == 0
  end

  def get(index)
    arr[index]
  end

  def set(index, value)
    arr[index] = value
  end

  def clear!
    len.times { |index| arr[index] = nil }
    len = nil
  end

  def add(value)
    if len + 1 >= capacity
      capacity = if capacity == 0
        1
      else
        capacity*2
      end
      new_arr = Array.new(capacity)
      len.times { |index| new_arr[index] = arr[index] }
      arr = new_arr
    end
    len += 1
    arr[len] = value
  end

  def remove_at(rm_index)
    raise "Out of Bounds" if rm_index < 0 || rm_index >= len
    item = arr[rm_index]
    new_arr = Array.new(capacity)
    new_index = 0
    len.times do |index|
      next if index == rm_index
      new_arr[new_index] = arr[index]
      new_index += 1
    end
    arr = new_arr
    len -= 1
    item
  end

  def remove(value)
    removed = false
    len.times do |index|
      if arr[index] == value
        remove_at(index)
        removed = true
      end
    end
    removed
  end

  def index_of(value)
    len.times do |index|
      if arr[index] == value
        return index
      end
    end
    nil
  end

  def contains?(value)
    index_of(value) != nil
  end

  def to_string
    return '[]' if len.zero?

    "[#{arr.join(',')}]"
  end
end


DynamicArray.new(20)


