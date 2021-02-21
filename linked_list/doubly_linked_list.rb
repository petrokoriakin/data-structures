class DoublyLinkedList
  attr_accessor :size, :head, :tail

  def clear
    trav = head
    while trav != nil
      next_node = trav.next_node
      trav.prev_node = trav.next_node = nil
      trav.data = nil
      trav = next_node
    end
    head = tail = trav = nil
    size = 0
  end

  def is_empty?
    size == 0
  end

  def add(item)
    add_last(item)
  end

  def add_last(item)
    if is_empty?
      head = tail = Node.new(item, nil, nil)
    else
      tail.next_node =  Node.new(item, tail, nil)
      tail = tail.next_node
    end
    size += 1
  end

  def add_first(item)
    if is_empty?
      head = tail = Node.new(item, nil, nil)
    else
      head.prev_node = Node.new(item, nil, head)
      head = head.prev_node
    end
    size += 1
  end

  def add_at(index, item)
    raise "Illegal index" if index < 0

    return add_first(item) if index == 0
    return add_last(item) if index == size

    temp = head
    index.times { temp = temp.next_node }
    new_node = Node.new(item, temp, temp.next_node)
    temp.next_node.prev_node = new_node
    temp.next_node = new_node
    size += 1
  end

  def peek_first
    raise "Empty List" if is_empty?

    head.data
  end

  def peek_last
    raise "Empty List" if is_empty?

    tail.data
  end

  def remove_first
    
  end
end
