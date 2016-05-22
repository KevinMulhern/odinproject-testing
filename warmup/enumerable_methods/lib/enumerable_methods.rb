module Enumerable

# My each enumerable method
	def my_each
		i = 0
		while i < self.size
			yield(self[i])
			i += 1
		end
		return self
	end


#My each_with_index method
	def my_each_with_index
		i = 0
		while i < self.size
			yield(self[i], i)
			i +=1
		end
		return self
	end


# My Select method
	def my_select
		new_array = []
		self.my_each {|item| new_array << item if yield item}
		return new_array
	end

# My all method
	def my_all?
		all_good = true
		self.my_each do |i|
			if yield(i) == false
				all_good = false
			end
		end
		return all_good
	end


# My any method
	def my_any?
		self.my_each do |i|
			if yield(i)
				 return true
			end
		end
		return false
	end


# My none method
	def my_none?
		self.my_each do |i|
			if yield(i)
				return false
			end
		end
		return true
	end


# My count method
	def my_count
		counter = 0
		self.my_each do |i|
			if yield(i) == true
				counter += 1
			end
		end
		return counter
	end


# My map method
	def my_map
		new_array = []
		self.my_each do |i|
			new_value = yield(i)
			new_array  << new_value
		end
		return new_array
	end


# My inject method
	def my_inject(sum=nil)
		if sum == nil
			sum = self[0]
			x = 1
		else
			x = 0
		end
		if size > 0
			self[x..self.size].my_each do |i|
				sum =  (yield sum, i)
			end
			return sum
		else
			nil
		end
	end


# My second map method, It takes either/both a proc and a block as input
# if both the proc and block are provided then it will execute both
# if only the proc is provided then it will execute the proc.
	def my_map_2(proc=nil)
		new_array = []
			if proc && block_given?
				self.my_each  {|i| new_array << proc.call(yield(i))}
			elsif proc and !block_given?
				self.my_each {|i| new_array << proc.call(i)}
			end
		return new_array
	end


end




# puts "-------------------------------"
# puts "            Tests              "
# puts "-------------------------------"

# array = [5,2,3,4,5]
# # Proc for my_map_2 method
# map_proc = Proc.new {|i| i * 2}
# puts "The array for the tests: #{array.inspect}"
# puts
#
# puts "This is the test for my_each method: "
# array.my_each {|item| puts item}
# puts
#
# puts "This is the test for my_each with index method: "
# array.my_each_with_index {|item, index| puts "item is #{item} index is #{index}"}
# puts
#
# puts "This is the the test for my_select method: "
# puts array.my_select {|item|  item  > 2}
# puts
#
# puts "This is the test for my_all method: "
# puts array.my_all? {|item| item > 0}
# puts
#
# puts "This is the test for my_any method: "
# puts array.my_any? {|item| item == 2}
# puts
#
# puts "This is the test for my_none method: "
# puts array.my_none? {|item| item == 2}
# puts
#
# puts "This is the test for my_count method: "
# puts array.my_count {|item| item == 5}
# puts
#
# puts "This is the test for my map method: "
# puts array.my_map {|x| x * 2}
# puts
#
# puts "This is the test for my inject method: "
# puts array.my_inject {|sum, x| sum + x}
# puts
#
# puts "This is the test for my second map method"
# puts array.my_map_2(map_proc) {|x| x * 2}
# puts
# end
#
#
# # My multiply method, it uses my inject method
# def multiply_els(array)
# 		array.my_inject {|total, i| total * i}
# end
#
# puts "This is the test for my multiply method: "
# puts multiply_els([2,4,5])
# puts
# puts "-------------------------------"


