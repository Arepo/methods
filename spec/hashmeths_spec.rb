describe 'hash methods' do 

hash = Hash.new(42)

hash[:key] = "value"; hash["key2"] = "value2"

	context 'assoc' do
		it 'searches for the key given in the parameter and returns both the key and value in an array if it finds it (else nil)' do
			expect(hash.assoc(:key)).to eq [:key, "value"]
		end
	end
	
	context 'clear' do
		it 'removes the contents of the hash' do
			# expect(hash.clear).to eq({})
		end
	end

hash2 = {key: "value", "key2" => "value2"}

	context 'compare_by_identity' do
		it 'makes the hash indexing more picky, so that only objects with the same ID as the keys in the hash will return the value (symbols only?)' do
			hash2.compare_by_identity
			expect(hash2[:key]).to eq "value"
			expect(hash2["key2"]).to eq nil
		end
	end	

	context 'compare_by_identity?' do
		it 'returns true if the hash has had the previous method applied' do
			expect(hash2.compare_by_identity?).to be_true
		end
	end



	context 'default()' do
		it 'takes an optional argument and returns the key for that argument if it exists, else it returns the default value for the hash' do
			expect(hash["meaning of life"]).to eq 42
		end
	end

	context 'default = ()' do
		it 'reassigns the default value for the hash' do
			hash.default = "broken"
			expect(hash["meaning of life"]).to eq "broken"
		end
	end

hash3 = Hash.new {|hash, key| key.to_s}

	context 'default_proc' do
		it 'runs the block associated with a hash if one exists (else nil)' do
			
			expect(hash3[:bob]).to eq "bob"
			expect(hash3.default_proc.class).to eq Proc
		end
	end

	context 'default_proc = ()' do
		it 'resets the default block for the hash. Apparently gets upset by curly braces' do
			hash3.default_proc = proc do |hash, key| key.upcase end
			expect(hash3["Bob"]).to eq "BOB"
		end
	end

	context 'delete(key)' do
		it 'deletes the pair with specified key, returning the value' do
			expect(hash.delete("key2")).to eq "value2"
		end
	end



	context 'delete_if' do
		it 'deletes each pair for which the supplied block evaluates to true. returns the remaining hash' do
			hash["key2"] = "value2"
			expect(hash.delete_if {|key, value| key.class == String}).to eq({:key => "value"})
		end
	end

hash["key2"] = "value2"

	context 'each {|key, value|}' do
		it 'calls the block for each pair in the hash' do
			
			a = 0
			hash.each {|key, value| a += value.length}
			expect(a).to eq 5 #but this bit makes no sense - why does hash addition work at top but not line 82?*************************
		end
	end

	context 'each_key {|key|}' do
		it 'as above, but only takes the key as argument in the block' do
			b = 0
			hash.each_key {|key| b += key.length}
			expect(b).to eq 3 
		end
	end

	context 'each_pair' do
		it 'is identical to each' do
		end
	end

	context 'each_value' do 
		it 'is equivalent to each_key' do
			c = 0
			hash.each_value {|value| c += value.length}
			expect(c).to eq 5 
		end
	end

	context 'empty?' do
		it "does what you'd expect" do
			expect(hash.empty?).to be_false
		end
	end

	context 'fetch' do
		it "looks at the index in arg1, returning an error unless a default is given as optional arg2, even if the original hash has default values" do
			expect(hash.fetch(:b, "harmless")).to eq "harmless"
		end
	end

	context 'flatten(optional level)' do
		it "returns an array of the keys and values in the hash (but only flattens one level by default, and then only flattens arrays)" do
			bash = {a: {b: {c: :d}}}
			expect(bash.flatten(3)).to eq([:a, {b: {c: :d}}])
			cash = {a: [:b, [:c]]}
			expect(cash.flatten(3)).to eq [:a, :b, :c]
		end
	end

	context 'has_key?' do
		it 'does the obvious - but "key?" is shorter' do
			expect(hash.has_key?(:key)).to be_true
		end
	end

	context 'has_value?' do
		it 'no prizes for guessing this one' do
			expect(hash.has_value?("value")).to be_true
		end
	end

	context 'include?' do
		it 'is identical to has_key?' do
		end
	end

	context 'invert' do
		it "returns a new hash with the old keys as values and vice versa" do
			hash[:key] = "value"; hash["key2"] = "value2"
			expect(hash.invert).to eq({"value" => :key, "value2" => "key2"})
		end
	end

	context 'keep_if{|key, value|}' do
		it "deletes everything that the block doesn't evaluate to true" do
			dash = {key: :value, "key2" => "value2"}
			expect(dash.keep_if{|key, value| key.is_a? Symbol}).to eq({:key => :value})
		end
	end

	context 'key' do
		it 'returns the key corresponding to the given value' do
			expect(hash.key("value2")).to eq "key2"
		end
	end

	context 'key?' do
		it 'yet another version of .has_key?' do
		end
	end

	context 'keys' do
		it 'returns array with the keys from the hash' do
			expect(hash.keys).to eq [:key, "key2"]
		end
	end

	context 'length' do
		it 'returns the number of pairs in the hash' do
			expect(hash.length).to eq 2
		end
	end

	context 'merge!' do
		it 'returns a (new) combined vers of two hashes, overwriting the values of the first where the keys clash, else taking a 3-var block to determine what to do (nonspecified clashes then return nil). Has perm vers' do
			fash = {key: "shoes", "key2" => "stuff", [:key3] => "mockingbird"}
			expect(hash.merge!(fash) {|key, hvalue, fvalue| if key.is_a? String; hvalue; else fvalue end}).to eq({key: "shoes", "key2" => "value2", [:key3]=> "mockingbird"})
		end
	end

	context 'rassoc' do
		it 'searches for a value and returns the first pair that has it as an array' do
			expect(hash.rassoc("mockingbird")).to eq [[:key3], "mockingbird"]
		end
	end

	context 'rehash' do
		xit 'fixes broken links - if keys have changed since being matched, it attempts to re-pair them. Beware - strings and arrays behave differently' do
			earthman = "Ford"
			gash = {earthman => "harmless"}
			earthman.replace "Arthur"
			expect(gash[earthman]).to eq nil
			gash.rehash
			expect(gash[earthman]).to eq "harmless"
		end
	end

end

