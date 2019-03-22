class MyQueue

  def initialize
    @store = []
  end

  def peek
    @store[0]
  end

  def enqueue(val)
    @store << val
  end

  def dequeue
    @store.shift
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

end

class MyStack

  def initialize
    @store = []
  end

  def peek
    @store[0]
  end

  def push(val)
    @store << val
  end

  def pop
    @store.pop
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

end