CSV_FILE_NAME      = "dataset/session_data/session_data.csv"
USER_CSV_FILE_NAME = "dataset/session_data/user_data.csv"

STORE_NAMES          = %w(Rock Paper Scissors Lizard Spock) 
SESSION_CATEGORIES   = ["How to", "Kids Hour", "Photo Walks"]
MEDIAN_INCOME_LEVELS = %w(High Medium Low)
SESSIONS             = []

@row_count = 0

schema = %w(user_id item_id rating median_income is_in_shopping_mall is_near_school is_near_microsoft_store crime_rate session_category)
user_schema = %w(user_id median_income is_in_shopping_mall is_near_school is_near_microsoft_store crime_rate)

def build_sessions
	device_types = ["iPad", "iPhone", "Apple Watch", "HomePod", "AppleTV", "Apple Pencil"]
	device_types.each do |dt|
		SESSIONS << { category: 0, name: "How to use #{dt}" }
		SESSIONS << { category: 0, name: "Getting the most from your #{dt}" }
		SESSIONS << { category: 0, name: "Advanced #{dt}" }
		SESSIONS << { category: 0, name: "Tips and tricks with #{dt}" }
	end

	kids_stuff = %w(Sphero Droids Movies Coding SoundFX BeeBo)
	kids_stuff.each do |k|
		SESSIONS << { category: 1, name: "Getting started with #{k}" }
		SESSIONS << { category: 1, name: "Fun with #{k}" }
		SESSIONS << { category: 1, name: "Tricks with #{k}" }
		SESSIONS << { category: 1, name: "How to do your own #{k}" }
	end

	photo_stuff = %w(Nature Building Lights Shadows People Birds)
	photo_stuff.each do |p|
		SESSIONS << { category: 2, name: "Capturing #{p}" }
		SESSIONS << { category: 2, name: "Setting the scene for #{p}" }
		SESSIONS << { category: 2, name: "Filters for #{p}" }
		SESSIONS << { category: 2, name: "Techniques for snapping #{p}" }
	end
end

def random_ambivalent_rating
	whole_number = rand(5) + 1
	decimal = (rand(2) == 1 && whole_number != 5) ? 5 : 0
	"#{whole_number}.#{decimal}"
end

def random_favorable_rating
	whole_number = rand(3) + 3
	decimal = (rand(2) == 1 && whole_number != 5) ? 5 : 0
	"#{whole_number}.#{decimal}"
end

def random_unfavorable_rating
	whole_number = rand(3) + 1
	decimal = (rand(2) == 1 && whole_number != 3) ? 5 : 0
	"#{whole_number}.#{decimal}"
end 

def random_boolean
	rand(2) == 1
end

def write_row(*args)
	row = [*args].join(",")
	%x(echo "#{row}" >> #{CSV_FILE_NAME})
	@row_count += 1
end

def write_user_row(*args)
	row = [*args].join(",")
	%x(echo "#{row}" >> #{USER_CSV_FILE_NAME})
	@row_count += 1
end

# Create CSV
%x(touch #{CSV_FILE_NAME})
%x(touch #{USER_CSV_FILE_NAME})

# Add column headers
%x(echo "#{schema.join(",")}" > #{CSV_FILE_NAME})
%x(echo "#{user_schema.join(",")}" > #{USER_CSV_FILE_NAME})

# Finally, create the rows.
build_sessions

STORE_NAMES.each_with_index do |store, store_index|
	income = MEDIAN_INCOME_LEVELS[store_index < 3 ? store_index : (rand(2) + 1) ] 
	mall   = store_index == 1
	school = store_index == 2
	microsoft = random_boolean
	crime = rand(100)
	write_user_row(store, income, mall, school, microsoft, crime)

	SESSIONS.each do |session|
		if store_index < 4
			rating = STORE_NAMES[session[:category]] == store ? random_favorable_rating : random_unfavorable_rating
		else
			rating = random_ambivalent_rating
		end

		session_name = "#{SESSION_CATEGORIES[session[:category]]}: #{session[:name]}"
                write_row(store, session_name, rating, income, mall, school, microsoft, crime, session[:category]) 
	end	
end

puts "Created #{@row_count} rows of data."
