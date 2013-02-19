module TimelineHelper
	def self.posts_to_timeline_data(posts_hash)
		data = []
		posts_hash.each_value do |v|
			if v["question"]["occured"].present?
				puts v["question"]["occured"]
				err = v["question"]["occured"].to_s
				
				puts err
				d = {
					"startDate" => v["question"]["occured"].to_s.gsub(/-/,','),
	                "endDate" => (v["question"]["occured"]+1).to_s.gsub(/-/,','),
	                "headline" => v["title"],
	                "text" => v["body"],
	                "tag" =>"This is Optional"
				}
				data << d
			end
		end
		puts data.inspect
		return data
	end
end