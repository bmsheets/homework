class Stack

    def initialize
        @stack = []
    end

    def add(el)
        @stack.push(el)
        el
    end
    
    def remove
        @stack.pop
    end

    def show
        @stack.dup
    end
end

class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue.push(el)
    end

    def dequeue
        @queue.shift
    end

    def show
        @queue.dup
    end
end

class Map
    def initialize
        @map = []
    end

    def assign(key, value)
        index = @map.index { |pair| pair.first == key }
        if index
            @map[index].last = value
        else
            @map << [key, value]
        end
    end

    def lookup(key)
        @map.each do |pair|
            return pair.last if pair.first == key 
        end
        nil
    end

    def remove(key)
        @map.reject! do |pair|
            pair.first == key
        end
    end

    def show
        @map.dup
    end

    def deep_dup(array)
        array.map do |elem|
            if elem.is_a?(Array)
                deep_dup(elem)
            else
                elem
            end
        end
    end
end
