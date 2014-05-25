@string = "hello world"

describe 'string methods' do

	context 'chop' do
		it 'returns a new string with the last char removed (also has a permanent version)' do
			 
		end
	end

	context 'clear' do
		it '(pointlessly given reassignment?) removes all chars in the string' do
			expect("hello".clear).to be_empty
		end
	end

	context 'count' do
		it 'returns the number of chars in all of the strings passed as arguments that also exist within the original string' do
			expect("captain horatio hornblower".count("pti", "toi")).to eq 4
		end
	end
	
	context 'each_char' do

		it 'runs a block for each character but returns the original string unchanged' do
			string = "hello world"
			expect(string.each_char {|char| char.upcase!}).to eq "hello world"
		end
	end

	context 'empty?' do
		it 'returns true if the string has no characters, else false' do
			expect("a".empty?).to be_false
		end
	end

	context 'each_line' do

		it 'separates lines at the argument given, runs a block on them, then returns the original string' do
			whatever = ""
			expect("hello world".each_line("o") {|line| whatever.upcase }).to eq "hello world"
		end
	end

	context 'delete' do
		it 'deletes all the characters common to all the arguments from the original string' do
			expect("captain hornblower".delete("pac", "hcb")).to eq "aptain hornblower"
		end
	end

	context 'gsub' do

		it 'finds the first string-argument in the original string and replaces it with the second argument. It also has a permanent vers' do
			expect("captain hornblower".gsub!("o", "SUP")).to eq "captain hSUPrnblSUPwer"
		end

		it 'alternatively looks for the first argument as a key in a hash and replaces it in the original string with the relevant key' do
			expect("captain hornblower".gsub!("captain", {"captain"=> "Aubrey"})).to eq "Aubrey hornblower"
		end
	end

	context 'include?' do
		it 'does what it says on the tin' do
			expect("hello world".include?("hello")).to be_true
		end
	end

	context 'index' do
		it 'returns the index of the first character of the first substring matching that in the argument' do
			expect("captain horatio hornblower".index("hor")).to eq 8
		end
	end

	context 'insert' do
		it 'adds the string in argument1 to the index in argument2' do
			expect("helloworld".insert(5, " ")).to eq "hello world"
		end
	end

	context 'length' do
		it 'unlike arr.length differs from .count, since here it just returns the number of chars in the string' do
			expect('hello'.length).to eq 5
		end
	end

	context 'lines' do
		it "much like .split, but doesn't omit the char(s?) given as an argument - keeps them in the line before the break" do
			expect("hello world".lines(" ")).to eq ["hello ", "world"]
		end
	end

	context 'ljust' do
		it "indents from the right by (the number of spaces in argument1 - the number of chars in the original string), filling the gap with the chars in argument2" do
			expect("hello world".ljust(3, "!!")).to eq "hello world"
		end
	end

	context 'lstrip!' do
		it 'deletes all spaces at the beginning of the string - has a permanent version' do
			expect("    hello".lstrip!).to eq "hello"
		end
	end

	context 'next!' do
		it 'increments the the string, starting with the rightmost character, cycling round character sets - has a perm version' do
			expect("ZZ".next).to eq "AAA"
		end
	end

	context 'partition' do
		it 'splits a string by the argument, and returns three arrays - the left of the argument, the argument and the right' do
			expect("captain hornblower".partition(" h")).to eq ["captain", " h", "ornblower"]
		end
	end

	context 'prepend' do
		it 'prepends the argument onto the original string' do
			expect("hornblower".prepend("captain ")).to eq "captain hornblower"
		end
	end

	context 'reverse!' do
		it 'returns the characters in the string from last to first - has a perm version' do
			expect("hello".reverse).to eq ("olleh")
		end
	end

	context 'rindex' do
		it 'returns the index of the first character of the last substring matching that in the argument' do
			expect("captain hornblower".rindex("bl")).to eq 12
		end
	end

	context 'rjust' do
		it "indents from the left by the number of the argument iff it's higher than the number of chars in the string, filling with chars from the second arg" do
			expect("hello".rjust(6, "x")).to eq "xhello"
		end
	end
end

