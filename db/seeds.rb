require 'csv'

# create a handful of room types using data at the end of this file
types = [].tap do |types|
  CSV.foreach(Rails.root.join('db/data/room_types.csv')) do |row|
    types << RoomType.create!(name: row[0], description: row[1], photo: File.open(Rails.root.join(row[2])),
                              beds: row[3], bed_size: row[4], handicapped_accessible: row[5], non_smoking: row[6], price: row[7])
  end
end

# create room instances that represent our hotel
(1..5).each do |floor|
  (1..20).each do |room|
    Room.create!(number: floor * 100 + room) { |r| r.room_type = types.sample }
  end
end
