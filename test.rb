earthman = "Ford"
puts earthman.object_id
hash = {earthman => "harmless"}
puts "hash is -------- #{hash}"
puts hash[earthman]
earthman.replace "Arthur"
puts hash[earthman]
hash.rehash
puts "hash is -------- #{hash}"
puts earthman.object_id
puts hash.keys.first.object_id
puts hash[earthman]
# puts "****" * 5
# arr = ["a"]
# puts arr.object_id
# bash = {arr => "hello world"}
# arr[0] = "b"
# puts bash[arr]
# bash.rehash
# puts arr.object_id
# puts bash[arr]