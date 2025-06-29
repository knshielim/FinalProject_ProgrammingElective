DROP DATABASE halabo_tour;
CREATE DATABASE IF NOT EXISTS halabo_tour;
USE halabo_tour;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    profile_image LONGBLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE destinations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    destination_name VARCHAR(255) NOT NULL UNIQUE,
    caption VARCHAR(255),
    description TEXT,
    destination_image LONGBLOB,
    image_path VARCHAR(255) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE packages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    destination_id INT NOT NULL,
    package_name VARCHAR(255) NOT NULL,
    package_image LONGBLOB,
    image_path VARCHAR(255) NULL,
    price VARCHAR(100),
    duration VARCHAR(100),
    min_people VARCHAR(50),
    tour_type VARCHAR(255),
    tour_code VARCHAR(100),
    description TEXT,
    itinerary TEXT,
    price_details TEXT,
    hotel TEXT,
    remarks TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (destination_id) REFERENCES destinations(id) ON DELETE CASCADE
);

CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    package_id INT NOT NULL,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    travel_date DATE NOT NULL,
    number_of_travelers INT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL, -- Or appropriate type for your price
    status VARCHAR(50) DEFAULT 'Pending', -- E.g., Pending, Confirmed, Cancelled
    special_requests TEXT,
    contact_name VARCHAR(255), -- If different from user's name
    contact_email VARCHAR(255),
    contact_phone VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE, -- Or SET NULL if preferred
    FOREIGN KEY (package_id) REFERENCES packages(id) ON DELETE CASCADE -- Or SET NULL if preferred
);

CREATE TABLE IF NOT EXISTS enquiries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    package_type VARCHAR(100) NOT NULL,
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    payment_method VARCHAR(50) NOT NULL,
    payment_details TEXT,
    amount DECIMAL(10,2),
    status VARCHAR(20) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES bookings(id)
);

CREATE TABLE IF NOT EXISTS feedbacks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    feedback TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SHOW TABLES;
-- SELECT * FROM

INSERT INTO users (first_name,last_name,username,email,password,phone,created_at) 
VALUES ('Super',
		'Admin',
		'admin',
		'admin@halabo.com',
		'admin123',
		'08123456789',
		NOW());

INSERT INTO destinations (destination_name, caption, description) 
VALUES ('Borobudur Temple', 
		'The world’s largest Buddhist temple, rich with ancient history.', 
		'Borobudur Temple is the world’s largest Buddhist temple and a UNESCO World Heritage Site located in Central Java, Indonesia. 
		Constructed in the 9th century during the reign of the Sailendra Dynasty, the temple is a stunning example of Mahayana Buddhist architecture. 
		It is decorated with over 2,600 relief panels and 504 Buddha statues, making it one of the most intricately designed ancient structures in the world. 
		Visitors can climb to the top of the temple for panoramic views of the surrounding hills and lush forests.');
INSERT INTO destinations (destination_name, caption, description) 
VALUES ('Bali Island', 
		'Beautiful beaches, temples, and a unique spiritual vibe.', 
		'Bali is Indonesia’s most popular tourist island, known for its breathtaking beaches, vibrant culture, and picturesque rice terraces. 
		Visitors can explore ancient temples like Uluwatu and Tanah Lot, experience traditional Balinese dance performances, and indulge in wellness retreats. 
		The island also offers world-class surfing, diving, and snorkeling opportunities. 
		With its rich artistic heritage and spiritual atmosphere, Bali provides an unforgettable travel experience for every kind of traveler.');
INSERT INTO destinations (destination_name, caption, description) 
VALUES ('Raja Ampat', 
		'A diver’s paradise with stunning marine biodiversity.', 
		'Raja Ampat, located in West Papua, is an archipelago comprising over 1,500 islands and cays. 
		It is renowned as one of the most biodiverse marine habitats on Earth. 
		Divers and snorkelers from around the globe flock to Raja Ampat for its vibrant coral reefs and exotic marine life, including manta rays, reef sharks, and sea turtles. 
		The islands also feature lush jungles and limestone karsts, offering adventure seekers plenty to explore both above and below the waterline.');
INSERT INTO destinations (destination_name, caption, description) 
VALUES ('Mount Bromo', 
		'Witness a sunrise over one of Indonesia’s iconic volcanoes.', 
		'Mount Bromo, located in East Java, is one of Indonesia\'s most iconic volcanoes. 
		It stands in the middle of the Tengger caldera and is part of Bromo Tengger Semeru National Park. 
		The area is famous for its dramatic sunrises, where the smoky peak of Bromo is silhouetted against the glowing sky. 
		Tourists can hike or ride jeeps across the sea of volcanic sand to reach the crater\'s edge. 
		Bromo\'s otherworldly landscape makes it a must-visit for nature lovers and photographers.');
INSERT INTO destinations (destination_name, caption, description) 
VALUES ('Lake Toba', 
		'The largest volcanic lake in the world, nestled in North Sumatra.', 
		'Lake Toba, situated in North Sumatra, is the largest volcanic lake in the world. 
		Formed by a massive supervolcanic eruption around 75,000 years ago, the lake spans over 1,100 square kilometers and reaches depths of up to 500 meters. 
		At its center lies Samosir Island, a cultural heartland of the Batak people. 
		Tourists can enjoy scenic boat rides, explore traditional Batak villages, soak in hot springs, and admire the tranquil natural surroundings.');
INSERT INTO destinations (destination_name, caption, description) 
VALUES ('Pulau Seribu', 
		'A chain of tropical islands near Jakarta, perfect for snorkeling and beach getaways.', 
		'Pulau Seribu, or the Thousand Islands, is a chain of tropical islands stretching north of Jakarta in the Java Sea. 
		These islands are ideal for weekend getaways, offering pristine beaches, coral reefs, and clear blue waters. 
		Popular activities include snorkeling, scuba diving, and island hopping. 
		Many islands have eco-resorts and cultural heritage sites, such as the colonial-era buildings on Onrust Island. 
		It’s a convenient escape for those seeking serenity and marine adventures close to the capital city.');
INSERT INTO destinations (destination_name, caption, description) 
VALUES ('Monas National Monument', 
		'A symbol of Indonesia\'s independence in the heart of Jakarta.', 
		'Monas, short for Monumen Nasional, is an iconic landmark located in the heart of Jakarta. 
		It was constructed to commemorate Indonesia’s struggle for independence. 
		Standing at 132 meters tall, Monas is crowned with a flame covered in gold foil. 
		Visitors can take an elevator to the top for panoramic views of the capital. 
		The monument also houses a museum that showcases Indonesia’s rich history, making it both a symbol of national pride and a center of education.');
INSERT INTO destinations (destination_name, caption, description) 
VALUES ('Komodo Island', 
		'Home to the world-famous Komodo dragons and vibrant marine life.', 
		'Komodo Island is part of the Komodo National Park and is globally known as the natural habitat of the Komodo dragon, the largest lizard on Earth. 
		Located in the Lesser Sunda Islands, it offers a dramatic landscape of rugged hills, savannahs, and pink beaches. 
		Visitors can trek through the island with guides to observe the dragons and enjoy world-class diving sites teeming with marine biodiversity. 
		The unique ecosystem and scenery make it a true natural wonder.');
INSERT INTO destinations (destination_name, caption, description) 
VALUES ('Labuan Bajo', 
		'A charming harbor town and gateway to Komodo National Park.', 
		'Labuan Bajo is a charming port town located on the western tip of Flores Island. 
		It serves as the main gateway to Komodo National Park and the nearby islands. 
		Once a sleepy fishing village, Labuan Bajo has transformed into a vibrant tourist hub with upscale resorts, dive centers, and restaurants. 
		From here, visitors can embark on boat tours to see the Komodo dragons, snorkel in pristine coral reefs, and admire the beauty of Padar Island’s viewpoints.');
INSERT INTO destinations (destination_name, caption, description) 
VALUES ('Prambanan Temple', 
		'A majestic Hindu temple complex with stunning architecture and history.', 
		'Prambanan is a magnificent Hindu temple complex located near Yogyakarta in Central Java. 
		Built in the 9th century, the complex is dedicated to the Trimurti: Brahma the creator, Vishnu the preserver, and Shiva the destroyer. 
		The main temple stands at 47 meters tall and is surrounded by smaller temples adorned with detailed bas-reliefs. 
		Prambanan is a UNESCO World Heritage Site and is also a venue for traditional dance performances held under the moonlight, adding to its mystical charm.');

INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    1, 
    '3D2N Borobudur (Family Journey) – Java Family Stay',
    'From RM899.00',
    '3 Days, 2 Nights',
    '2',
    'Family, Culture',
    'HALA-BORO-FAM',
    '<h2>Overview</h2><p>This cultural experience is designed especially for families, blending education, exploration, and relaxation. It features a guided temple visit, family picnic near Borobudur, and a leisure day to explore Yogyakarta’s cultural market streets and local food.</p><h2>Included / Excluded</h2><ul><li>✅ 2 nights’ stay at 3★ family-friendly hotel</li><li>✅ Daily breakfast & 1 picnic lunch</li><li>✅ Borobudur entrance tickets</li><li>✅ Guided historical tour</li><li>❌ Flights to/from Yogyakarta</li><li>❌ Personal expenses</li><li>❌ Travel insurance</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrival in Yogyakarta, check-in, sunset walk, family dinner</li><li><strong>Day 2:</strong> Guided Borobudur tour, picnic lunch, visit to temple museum</li><li><strong>Day 3:</strong> Explore local market, children’s batik workshop, return</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>2-3 pax</td><td>899</td></tr><tr><td>4-6 pax</td><td>859</td></tr><tr><td>7 pax and above</td><td>829</td></tr></table><p>Note: Child rates (aged 2–11) available on request. Infants travel free without bed. Group discount applicable for more than 10 pax.</p>',
    'Java Family Stay',
    '<ul><li>Rates quoted are for the minimum number of pax mentioned; rates may vary depending on the number of pax requested.</li><li>This is a quotation only — no reservation is confirmed until written acceptance and deposit are received.</li><li>Prices may be subject to surcharges (e.g., peak season, weekend, or public holidays).</li><li>All bookings are subject to hotel and land arrangement availability.</li><li>A 50% deposit is required upon booking; full payment is due one month before the tour.</li><li>Travel dates can be changed with notice, up to 2 weeks before departure.</li><li>Written notice is required for cancellations. Penalties apply based on notice period:</li><ul><li>30 days and over: 20% penalty</li><li>15–29 days: 30% penalty</li><li>8–14 days: 50% penalty</li><li>1–7 days: 75% penalty</li><li>Arrival day/No Show: 100% penalty</li></ul><li>If full payment is not received a month before departure, the company may cancel your reservation.</li><li>Any room change due to cancellation (e.g., Twin to Single) will incur cost differences borne by the remaining party.</li><li>No refunds for illness, absence, or early return from the trip.</li></ul>'
);
INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    1, 
    '3D2N Borobudur (Adventure Trail) – Sunrise & Trek',
    'From RM1,099.00',
    '3 Days, 2 Nights',
    '2',
    'Adventure, Culture',
    'HALA-BORO-ADV',
    '<h2>Overview</h2><p>For thrill-seekers and nature lovers, this adventurous package is designed to provide unforgettable moments around Borobudur. Begin with an early morning sunrise trek to Punthuk Setumbu Hill, followed by a cycling tour to nearby villages, temple visits, and cultural immersion.</p><h2>Included / Excluded</h2><ul><li>✅ Sunrise trekking to Punthuk Setumbu</li><li>✅ Borobudur entry tickets and guide</li><li>✅ Village cycling tour with local guide</li><li>✅ 2 nights stay at local eco lodge</li><li>✅ Breakfast & 1 local lunch</li><li>❌ Airfare to Yogyakarta</li><li>❌ Personal shopping or gratuities</li><li>❌ Travel insurance</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrive Yogyakarta, hotel check-in, welcome orientation</li><li><strong>Day 2:</strong> Sunrise trek, local breakfast, cycling tour, Borobudur temple tour</li><li><strong>Day 3:</strong> Leisure morning, explore local art stalls, return trip</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>2-3 pax</td><td>1,099</td></tr><tr><td>4-6 pax</td><td>1,059</td></tr><tr><td>7 pax and above</td><td>1,019</td></tr></table><p>Discounts available for students and groups of 10+. Minimum age for trekking: 12 years old.</p>',
    'Jogja Eco Retreat',
    '<ul><li>Booking is based on availability; early booking recommended during peak season.</li><li>Adventurous activities require a moderate fitness level.</li><li>Itinerary may shift due to weather conditions or temple regulations.</li><li>All cancellation policies apply as per Halabo Indonesia Tour policy guide.</li></ul>'
);
INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    1, 
    '4D3N Borobudur (Cultural Luxury) – Borobudur Heritage Resort',
    'From RM1,799.00',
    '4 Days, 3 Nights',
    '2',
    'Luxury, Culture',
    'HALA-BORO-LUX',
    '<h2>Overview</h2><p>Indulge in the elegance and tranquility of Java with our Cultural Luxury package. This tour is curated for travelers seeking a high-end experience, featuring private guides, spa treatments, and exclusive access to cultural performances near Borobudur.</p><h2>Included / Excluded</h2><ul><li>✅ 3 nights at Borobudur Heritage Resort (5★)</li><li>✅ Daily breakfast & 2 deluxe dinners</li><li>✅ Private tour of Borobudur & Mendut Temple</li><li>✅ Traditional Javanese spa experience</li><li>✅ Evening cultural dance show (VIP seating)</li><li>❌ Flights and personal shopping</li><li>❌ Optional activities outside itinerary</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrival, welcome mocktail, check-in at luxury resort</li><li><strong>Day 2:</strong> Guided Borobudur & Mendut tour, afternoon spa</li><li><strong>Day 3:</strong> Optional sunrise yoga, cultural dance performance</li><li><strong>Day 4:</strong> Breakfast and checkout</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>2-3 pax</td><td>1,799</td></tr><tr><td>4-6 pax</td><td>1,699</td></tr><tr><td>7 pax and above</td><td>1,599</td></tr></table><p>Perfect for honeymoons or anniversary getaways. Add-ons available upon request.</p>',
    'Borobudur Heritage Resort',
    '<ul><li>Bookings must be made 3 weeks in advance for VIP performance access.</li><li>Rates include taxes; optional gratuities not included.</li><li>Flexible date changes allowed up to 14 days before travel.</li><li>Deposit of 50% required upon confirmation.</li></ul>'
);

INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    2, 
    '3D2N Bali (Beach Getaway) – Ocean Breeze Hotel',
    'From RM1,099.00',
    '3 Days, 2 Nights',
    '2',
    'Leisure, Scenic',
    'HALA-BALI-ESC',
    '<h2>Overview</h2><p>Escape to the magical island of Bali where azure waters meet white sand beaches. This leisure package offers a laid-back island holiday with time for local cuisine, gentle beach walks, and scenic temple visits perfect for couples or friends.</p><h2>Included / Excluded</h2><ul><li>✅ 2 nights at Ocean Breeze Hotel (4★)</li><li>✅ Daily breakfast and one beachside dinner</li><li>✅ Sunset Uluwatu Temple tour</li><li>✅ Roundtrip airport transfers</li><li>❌ Flights to/from Bali</li><li>❌ Personal travel insurance</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrival in Bali, check-in, sunset beach stroll</li><li><strong>Day 2:</strong> Morning leisure time, Uluwatu Temple tour, beachside dinner</li><li><strong>Day 3:</strong> Local craft market visit, return transfer</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>2-3 pax</td><td>1,099</td></tr><tr><td>4-6 pax</td><td>1,059</td></tr><tr><td>7 pax and above</td><td>999</td></tr></table><p>Ask us about honeymoon room decorations or Balinese massage add-ons!</p>',
    'Ocean Breeze Hotel',
    '<ul><li>Rates are valid for the mentioned travel period only.</li><li>Bookings subject to room availability at time of reservation.</li><li>Deposit of 50% is required to confirm your reservation.</li><li>Cancellation policy applies with tiered penalties based on advance notice.</li></ul>'
);
INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    2, 
    '5D4N Bali (Adventure Retreat) – Ubud Jungle Lodge',
    'From RM1,299.00',
    '5 Days, 4 Nights',
    '2',
    'Adventure, Nature',
    'HALA-BALI-ADV',
    '<h2>Overview</h2><p>This action-packed adventure is ideal for thrill-seekers and nature lovers. Explore Bali''s rugged terrains, waterfalls, and jungles with guided treks, rafting experiences, and an unforgettable sunrise hike to Mount Batur.</p><h2>Included / Excluded</h2><ul><li>✅ 4 nights at Ubud Jungle Lodge (3★)</li><li>✅ Daily breakfast & 2 adventure lunches</li><li>✅ Mount Batur sunrise hike & rafting tour</li><li>✅ Trekking guide and safety equipment</li><li>✅ Bali nature park access</li><li>❌ Flights & personal gear</li><li>❌ Meals not mentioned in the itinerary</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrival and check-in at Ubud Jungle Lodge</li><li><strong>Day 2:</strong> Jungle trek and local village exploration</li><li><strong>Day 3:</strong> White-water rafting and riverside lunch</li><li><strong>Day 4:</strong> Mount Batur sunrise hike, hot spring soak</li><li><strong>Day 5:</strong> Free day, checkout, departure</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>2-3 pax</td><td>1,299</td></tr><tr><td>4-6 pax</td><td>1,249</td></tr><tr><td>7 pax and above</td><td>1,199</td></tr></table><p>Gear rentals available upon request. Children under 12 not recommended for this package.</p>',
    'Ubud Jungle Lodge',
    '<ul><li>Physical fitness required for hiking and rafting activities.</li><li>Insurance coverage for adventure activities is advisable.</li><li>Itinerary is weather dependent and may be adjusted for safety.</li><li>Advance booking of at least 2 weeks required.</li></ul>'
);
INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    2,
    '3D2N Bali (Beachside Romance) – Seminyak Bliss Resort',
    'From RM1,099.00',
    '3 Days, 2 Nights',
    '2',
    'Couple, Relaxation',
    'HALA-BALI-ROM',
    '<h2>Overview</h2><p>Perfect for couples, this romantic Bali escape features beachfront dinners, sunset views, spa relaxation, and leisure time by the sea. A dreamy experience to reconnect and rejuvenate amidst the beauty of Seminyak.</p><h2>Included / Excluded</h2><ul><li>✅ 2 nights at Seminyak Bliss Resort (4★)</li><li>✅ Romantic beachfront dinner</li><li>✅ 60-minute couples spa session</li><li>✅ Daily breakfast</li><li>✅ Free time for leisure and optional island tour</li><li>❌ Flights and alcohol beverages</li><li>❌ Travel insurance and optional excursions</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrival, check-in, couples massage, romantic dinner</li><li><strong>Day 2:</strong> Free day for beach, shopping, or optional Uluwatu tour</li><li><strong>Day 3:</strong> Breakfast, checkout, airport transfer</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Couple (RM)</th></tr><tr><td>2 pax</td><td>1,099</td></tr><tr><td>4 pax</td><td>1,049</td></tr><tr><td>6 pax and above</td><td>999</td></tr></table><p>Great for anniversaries or honeymooners. Ask about optional flower bed setup and custom arrangements.</p>',
    'Seminyak Bliss Resort',
    '<ul><li>Package available for couples only.</li><li>Must book at least 10 days in advance.</li><li>Seasonal surcharge may apply during festive periods.</li><li>Free airport transfer included in the price.</li></ul>'
);

INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    3, 
    '4D3N Raja Ampat (Marine Discovery) – Coral Reef Lodge',
    'From RM2,499.00',
    '4 Days, 3 Nights',
    '2',
    'Nature, Marine, Leisure',
    'HALA-RAJA-MAR',
    '<h2>Overview</h2><p>Embark on a once-in-a-lifetime marine journey across Raja Ampat, one of the most biodiverse marine ecosystems in the world. Snorkel with manta rays, explore vibrant coral reefs, and relax on remote paradise beaches.</p><h2>Included / Excluded</h2><ul><li>✅ 3 nights’ stay at Coral Reef Lodge (3★ beachfront)</li><li>✅ Daily breakfast & 2 seafood lunches</li><li>✅ Guided snorkeling tour & boat transfers</li><li>✅ Marine park permits</li><li>✅ Beach barbecue dinner</li><li>❌ Flights to Sorong</li><li>❌ Equipment rental (available at additional charge)</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrival in Sorong, speedboat to resort, welcome dinner</li><li><strong>Day 2:</strong> Island-hopping tour, snorkel at Friwen Wall and Yenbuba</li><li><strong>Day 3:</strong> Morning snorkeling trip, beach barbecue, free leisure time</li><li><strong>Day 4:</strong> Sunrise beach walk, check-out and return transfer</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>2-3 pax</td><td>2,499</td></tr><tr><td>4-6 pax</td><td>2,399</td></tr><tr><td>7 pax and above</td><td>2,299</td></tr></table><p>Note: Equipment rental (fins, snorkel mask) is available for RM50 per person per day.</p>',
    'Coral Reef Lodge',
    '<ul><li>Best travel season: October to April (dry season)</li><li>All tours depend on sea conditions; flexibility is required</li><li>Advance booking required due to remote access</li><li>Guests must follow conservation guidelines in marine park</li></ul>'
);
INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    3,
    '6D5N Raja Ampat (Eco Explorer) – Coral Reef Resort',
    'From RM2,899.00',
    '6 Days, 5 Nights',
    '2',
    'Eco, Marine',
    'HALA-RAJA-ECO',
    '<h2>Overview</h2><p>Perfect for eco-conscious travelers, this journey offers snorkeling, reef education, and low-impact island hopping in one of the world''s richest marine ecosystems. Includes environmental talks and village tours.</p><h2>Included / Excluded</h2><ul><li>✅ 5 nights at Coral Reef Resort (Eco-certified)</li><li>✅ Daily meals (Breakfast, Lunch, Dinner)</li><li>✅ Snorkeling sessions and reef preservation tour</li><li>✅ Local village and conservation project visits</li><li>✅ Marine park entry fee</li><li>❌ Flights to Sorong</li><li>❌ Alcoholic drinks</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrival in Sorong, boat to resort, orientation</li><li><strong>Day 2:</strong> Snorkeling tour, reef preservation session</li><li><strong>Day 3:</strong> Visit local village and beach clean-up activity</li><li><strong>Day 4:</strong> Island hopping (Gam, Mansuar), sunset cruise</li><li><strong>Day 5:</strong> Leisure at resort, marine lecture with local expert</li><li><strong>Day 6:</strong> Return to Sorong and departure</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>2-3 pax</td><td>2,899</td></tr><tr><td>4-6 pax</td><td>2,799</td></tr><tr><td>7 pax and above</td><td>2,699</td></tr></table><p>Optional dive packages available. Single traveler surcharge RM400.</p>',
    'Coral Reef Resort',
    '<ul><li>This is a low-impact, conservation-focused tour. Respect local customs and wildlife.</li><li>Bring reef-safe sunscreen and reusable bottles.</li><li>Booking recommended 1 month in advance due to limited access permits.</li><li>All schedules are weather-permitting and may change with notice.</li></ul>'
);
INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    3, 
    '6D5N Raja Ampat (Luxury Dive Cruise) – Ocean Pearl Explorer',
    'From RM4,899.00',
    '6 Days, 5 Nights',
    '4',
    'Luxury, Diving, Cruise',
    'HALA-RAJA-LUX',
    '<h2>Overview</h2><p>Indulge in a premium diving experience aboard a private liveaboard yacht. This luxury package offers full-board meals, guided underwater tours with professional divemasters, and access to some of the world''s most stunning coral reefs and marine life.</p><h2>Included / Excluded</h2><ul><li>✅ 5 nights on Ocean Pearl Explorer liveaboard</li><li>✅ Full-board gourmet meals & refreshments</li><li>✅ Up to 3 dives per day with certified divemaster</li><li>✅ Airport and pier transfers</li><li>✅ National marine park fees</li><li>❌ Dive insurance</li><li>❌ Dive gear rental (available on request)</li><li>❌ Flights to Sorong</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrival in Sorong, transfer to pier, welcome onboard</li><li><strong>Day 2:</strong> Dive at Manta Sandy, relax on deck</li><li><strong>Day 3:</strong> Dive at Cape Kri and Blue Magic</li><li><strong>Day 4:</strong> Dive and snorkeling around Arborek Island</li><li><strong>Day 5:</strong> Final dives, sunset cruise celebration</li><li><strong>Day 6:</strong> Return to Sorong, disembarkation, airport transfer</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>4-6 pax</td><td>4,899</td></tr><tr><td>7-10 pax</td><td>4,699</td></tr><tr><td>11 pax and above</td><td>4,499</td></tr></table><p>Dive gear rental is RM300 per person for full trip. Discounts apply for group bookings of 8 or more.</p>',
    'Ocean Pearl Explorer',
    '<ul><li>Participants must have valid open-water dive certification.</li><li>Medical clearance is recommended for diving activities.</li><li>Payment in full is required 45 days before departure.</li><li>Limited slots available – early booking is encouraged.</li></ul>'
);

INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    4, 
    '2D1N Mount Bromo (Sunrise Experience) – Bromo Hillside Lodge',
    'From RM599.00',
    '2 Days, 1 Night',
    '2',
    'Nature, Scenic',
    'HALA-BROMO-SUN',
    '<h2>Overview</h2><p>This quick getaway is perfect for travelers seeking an awe-inspiring sunrise view of Mount Bromo. The package includes a scenic 4WD jeep ride across the Tengger Caldera and a brief hike to the sunrise viewpoint, followed by crater exploration.</p><h2>Included / Excluded</h2><ul><li>✅ 1 night stay at Bromo Hillside Lodge (2★)</li><li>✅ Return 4WD jeep transfer to sunrise point</li><li>✅ Entrance to Mount Bromo National Park</li><li>✅ Local guide service</li><li>✅ Breakfast after sunrise tour</li><li>❌ Meals not mentioned in itinerary</li><li>❌ Travel insurance</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrival at Bromo Hillside Lodge, rest & dinner at leisure</li><li><strong>Day 2:</strong> 3AM jeep transfer to viewpoint, sunrise tour, crater visit, breakfast, departure</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>2-3 pax</td><td>599</td></tr><tr><td>4-6 pax</td><td>549</td></tr><tr><td>7 pax and above</td><td>529</td></tr></table><p>Children under 5 years old travel free (no bed). Optional horse ride to crater rim available on-site.</p>',
    'Bromo Hillside Lodge',
    '<ul><li>Tour timing is weather dependent and may change due to volcanic activity.</li><li>Warm clothing is highly recommended for early morning tours.</li><li>Advance booking required for weekends and public holidays.</li><li>Minimum 2 persons per booking.</li></ul>'
);
INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    4,
    '3D2N Mount Bromo (Scenic Discovery) – Lava View Resort',
    'From RM899.00',
    '3 Days, 2 Nights',
    '2',
    'Nature, Photography',
    'HALA-BROMO-DISC',
    '<h2>Overview</h2><p>This extended Mount Bromo experience is tailored for travelers who want to fully immerse in the dramatic landscape. Enjoy both sunrise and sunset views, visit the Whispering Sands, and explore nearby Madakaripura Waterfall in one scenic package.</p><h2>Included / Excluded</h2><ul><li>✅ 2 nights stay at Lava View Resort (3★)</li><li>✅ 2 breakfasts and 1 local lunch</li><li>✅ Mount Bromo National Park entrance & jeep tour</li><li>✅ Guided trek to Madakaripura Waterfall</li><li>✅ Local English-speaking guide</li><li>❌ Travel insurance</li><li>❌ Meals not listed</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrival, sunset viewing at Mount Bromo rim, overnight at resort</li><li><strong>Day 2:</strong> Sunrise tour via jeep, crater walk, visit Whispering Sands, local lunch</li><li><strong>Day 3:</strong> Madakaripura Waterfall trek, return and checkout</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>2-3 pax</td><td>899</td></tr><tr><td>4-6 pax</td><td>859</td></tr><tr><td>7 pax and above</td><td>829</td></tr></table><p>Children aged 5–11 enjoy 30% off. Trekking shoes recommended for the waterfall trail.</p>',
    'Lava View Resort',
    '<ul><li>All activities subject to weather and volcanic conditions.</li><li>Not suitable for guests with mobility issues due to uneven trails.</li><li>Book at least 1 week in advance for optimal planning.</li><li>Guests should bring waterproof jackets and walking shoes.</li></ul>'
);
INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    4,
    '4D3N Mount Bromo & Ijen (Crater Adventure) – Volcanic Trekker''s Delight',
    'From RM1099.00',
    '4 Days, 3 Nights',
    '4',
    'Adventure, Nature',
    'HALA-BROMO-IJEN',
    '<h2>Overview</h2><p>This adrenaline-fueled volcanic expedition is ideal for nature enthusiasts and trekkers seeking raw beauty. Experience both Mount Bromo and the mesmerizing blue fire of Ijen Crater in a single package. Perfect for small groups and backpackers ready for physical challenges.</p><h2>Included / Excluded</h2><ul><li>✅ 3 nights’ accommodation (mixed lodges near Bromo & Ijen)</li><li>✅ All ground transportation with driver</li><li>✅ Guided sunrise trek to Mount Bromo & Ijen Crater</li><li>✅ Entrance fees to both national parks</li><li>✅ Daily breakfast, 1 local lunch, 1 BBQ dinner</li><li>✅ Gas mask for Ijen Crater climb</li><li>❌ Flight or train to Probolinggo/Banyuwangi</li><li>❌ Travel insurance</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrive Probolinggo, transfer to lodge near Bromo, evening bonfire</li><li><strong>Day 2:</strong> Sunrise trek to Mount Bromo, explore caldera, scenic drive to Banyuwangi</li><li><strong>Day 3:</strong> Midnight trek to Ijen Crater, blue flame viewing, descent & rest</li><li><strong>Day 4:</strong> Breakfast and return transfer to Banyuwangi/Surabaya</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>4-5 pax</td><td>1099</td></tr><tr><td>6-8 pax</td><td>999</td></tr><tr><td>9 pax and above</td><td>949</td></tr></table><p>Note: Suitable only for guests with moderate fitness. Travel insurance strongly recommended.</p>',
    'Mix of rustic lodges – Lava View Lodge near Bromo and Ketapang Indah Hotel in Banyuwangi. Basic amenities with proximity to trekking routes.',
    '<ul><li>Blue fire at Ijen is visible only during early morning hours under clear skies.</li><li>Proper trekking shoes and jackets required.</li><li>Itinerary may be adjusted due to weather or volcanic conditions.</li><li>This tour is not recommended for children under 10 or elderly with mobility issues.</li></ul>'
);

INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    5,
    '3D2N Lake Toba (Cultural Retreat) – Toba Serenity Resort',
    'From RM799.00',
    '3 Days, 2 Nights',
    '2',
    'Nature, Culture',
    'HALA-TOBA-RET',
    '<h2>Overview</h2><p>Immerse yourself in Batak culture with this relaxing retreat to Lake Toba, the world’s largest volcanic lake. Experience the beauty of nature, traditional villages, and authentic cuisine.</p><h2>Included / Excluded</h2><ul><li>✅ 2 nights at Toba Serenity Resort (3★)</li><li>✅ Round-trip land transfers from Medan</li><li>✅ Boat tour to Samosir Island</li><li>✅ Visit to Batak museum and cultural dance show</li><li>✅ 2 breakfasts & 1 traditional dinner</li><li>❌ Domestic airfare to Medan</li><li>❌ Optional watersport activities</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrival at Medan, land transfer to Lake Toba, check-in, free and easy evening</li><li><strong>Day 2:</strong> Full-day Samosir Island boat tour, traditional Batak lunch, visit Ambarita and Tomok villages</li><li><strong>Day 3:</strong> Cultural dance performance and museum visit, return transfer to Medan</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>2-3 pax</td><td>799</td></tr><tr><td>4-6 pax</td><td>759</td></tr><tr><td>7 pax and above</td><td>729</td></tr></table><p>Note: Optional private guide available for RM120/day. Children under 6 stay free (no extra bed).</p>',
    'Toba Serenity Resort',
    '<ul><li>Prices may vary during peak holiday seasons.</li><li>Bookings must be confirmed at least 7 days before travel date.</li><li>Subject to weather and lake transport conditions.</li><li>Deposit of 50% required upon booking, non-refundable within 10 days of departure.</li></ul>'
);
INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    5, 
    '4D3N Lake Toba (Adventure Discovery) – Summit Eco Lodge',
    'From RM999.00',
    '4 Days, 3 Nights',
    '2',
    'Adventure, Nature',
    'HALA-TOBA-ADV',
    '<h2>Overview</h2><p>This package is tailored for adventure seekers wanting to explore the raw beauty of Lake Toba. Hike scenic trails, kayak on the lake, and discover hidden waterfalls while still enjoying local hospitality and traditions.</p><h2>Included / Excluded</h2><ul><li>✅ 3 nights at Summit Eco Lodge</li><li>✅ Guided jungle trek and waterfall visit</li><li>✅ Kayaking experience on Lake Toba</li><li>✅ 3 breakfasts, 2 lunches, and 1 dinner</li><li>✅ Entrance fees to eco-parks</li><li>❌ Flights to Medan</li><li>❌ Extra meals and drinks</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrive in Medan, transfer to lodge, welcome dinner and campfire</li><li><strong>Day 2:</strong> Jungle hike to Sipiso-Piso Waterfall, picnic lunch, return and rest</li><li><strong>Day 3:</strong> Morning kayak on the lake, cultural exploration in local village</li><li><strong>Day 4:</strong> Sunrise lakefront breakfast, transfer to Medan airport</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>2-3 pax</td><td>999</td></tr><tr><td>4-6 pax</td><td>959</td></tr><tr><td>7 pax and above</td><td>929</td></tr></table><p>Note: Adventure gear (boots, kayak) provided. Participants must be physically fit for moderate hiking.</p>',
    'Summit Eco Lodge',
    '<ul><li>Eco tours are subject to availability based on weather.</li><li>Minimum age: 12 years old for trekking and kayaking activities.</li><li>Bookings require confirmation 10 days prior to travel.</li><li>50% deposit needed. Cancellation within 7 days forfeits deposit.</li></ul>'
);
INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    5,
    '5D4N Lake Toba (Honeymoon Escape) – Samosir Romantic Villas',
    'From RM1299.00',
    '5 Days, 4 Nights',
    '2',
    'Romance, Relaxation',
    'HALA-TOBA-HONEY',
    '<h2>Overview</h2><p>Celebrate love and tranquility in this specially curated honeymoon escape. With romantic lakeside stays, candlelight dinners, spa indulgence, and private tours, this is the perfect getaway for newlyweds or couples seeking peace and intimacy by nature’s beauty.</p><h2>Included / Excluded</h2><ul><li>✅ 4 nights’ stay in honeymoon villa at Samosir Romantic Villas</li><li>✅ Private return land & boat transfers</li><li>✅ Candlelight dinner & floating breakfast</li><li>✅ 1-hour couple’s massage session</li><li>✅ Daily breakfast & 2 special dinners</li><li>✅ Local sightseeing in a private car</li><li>❌ Domestic flights to Medan</li><li>❌ Additional spa treatments or alcoholic beverages</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrival in Medan, scenic transfer to Lake Toba, welcome drink and villa check-in</li><li><strong>Day 2:</strong> Leisure breakfast, spa therapy, romantic dinner under the stars</li><li><strong>Day 3:</strong> Samosir Island tour, visit to romantic viewpoints, lunch by the lake</li><li><strong>Day 4:</strong> Free day for couples’ activities or optional lake cruise</li><li><strong>Day 5:</strong> Floating breakfast, check-out, return transfer to Medan airport</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Total per Couple (RM)</th></tr><tr><td>Standard Honeymoon</td><td>1299</td></tr><tr><td>Deluxe Villa Upgrade</td><td>1499</td></tr><tr><td>Luxury Suite Package</td><td>1799</td></tr></table><p>Note: Honeymoon decorations included. Add-on photo session available upon request.</p>',
    'Samosir Romantic Villas',
    '<ul><li>Package valid for couples only (honeymoon or anniversary proof may be requested).</li><li>Upgrade options subject to availability upon booking.</li><li>Booking must be confirmed at least 14 days before arrival.</li><li>Non-refundable within 7 days of departure. 50% deposit required at time of booking.</li></ul>'
);

INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    6, 
    '2D1N Pulau Seribu (Island Escape) – Tidung Serenity Resort',
    'From RM399.00',
    '2 Days, 1 Night',
    '2',
    'Island Leisure',
    'HALA-SERIBU-ECO',
    '<h2>Overview</h2><p>Perfect for weekend getaways, this short and sweet Pulau Seribu escape includes white sandy beaches, crystal waters, snorkeling tours, and fresh island seafood. A relaxed and carefree time awaits just a short boat ride from Jakarta.</p><h2>Included / Excluded</h2><ul><li>✅ Return boat transfers from Marina Ancol</li><li>✅ 1 night’s stay at Tidung Serenity Resort</li><li>✅ Snorkeling tour with guide & gear</li><li>✅ 3 meals: 1 breakfast, 1 lunch, 1 dinner</li><li>✅ Bicycle rental to explore island</li><li>❌ Personal expenses</li><li>❌ Travel insurance</li></ul>',
    '<ul><li><strong>Day 1:</strong> Depart Marina Ancol, arrive at Tidung Island, check-in, snorkeling, sunset bike tour, seafood dinner</li><li><strong>Day 2:</strong> Island walk, leisure breakfast, free time at the beach, return to Marina Ancol</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>2-3 pax</td><td>399</td></tr><tr><td>4-6 pax</td><td>379</td></tr><tr><td>7 pax and above</td><td>359</td></tr></table><p>Note: Child rate (5-11 yrs) available at RM299. Children under 5 stay free (no extra bed).</p>',
    'Tidung Serenity Resort',
    '<ul><li>Subject to availability and weather conditions for sea travel.</li><li>Minimum 2 pax per booking, max 10 per villa unit.</li><li>Bookings must be confirmed at least 5 days prior to travel.</li><li>No refunds for late arrival or early return.</li></ul>'
);
INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    6, 
    '3D2N Pulau Seribu (Couple''s Getaway) – Coral Bliss Resort',
    'From RM1,099.00',
    '3 Days, 2 Nights',
    '2',
    'Romantic, Island',
    'HALA-PULAU-COUP',
    '<h2>Overview</h2><p>Perfect for couples, this romantic island escape in Pulau Seribu offers a serene tropical setting, complete with sunset cruises, candlelit beach dinners, and relaxing spa moments. Ideal for honeymoons or anniversaries.</p><h2>Included / Excluded</h2><ul><li>✅ Return speedboat transfer from Jakarta</li><li>✅ 2 nights at Coral Bliss Resort (Seaview Room)</li><li>✅ Breakfasts and 1 romantic dinner on the beach</li><li>✅ Sunset sailing cruise</li><li>✅ Couple’s spa session</li><li>❌ Flights to Jakarta</li><li>❌ Optional island hopping fees</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrive at Jakarta, speedboat to Pulau Seribu, resort check-in, evening beach walk</li><li><strong>Day 2:</strong> Leisure morning, sunset sailing, romantic candlelight dinner</li><li><strong>Day 3:</strong> Spa session, farewell breakfast, return transfer</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Couple (RM)</th></tr><tr><td>2 pax</td><td>1,099</td></tr><tr><td>4 pax (2 couples)</td><td>1,049</td></tr><tr><td>6 pax and above</td><td>999</td></tr></table><p>Note: Prices based on couple sharing. Special honeymoon decorations available upon request.</p>',
    'Coral Bliss Resort',
    '<ul><li>Check-in time: 2:00 PM; check-out time: 12:00 PM</li><li>Couples are advised to bring sunscreen and appropriate beachwear</li><li>All bookings must be confirmed at least 7 days before departure</li><li>Full payment required upon confirmation</li></ul>'
);
INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    6, 
    '3D2N Pulau Seribu (Water Adventure) – Marina Dive Lodge',
    'From RM1,099.00',
    '3 Days, 2 Nights',
    '4',
    'Water Sports, Group',
    'HALA-PULAU-WADV',
    '<h2>Overview</h2><p>This action-packed water adventure package is ideal for thrill-seekers and ocean lovers. Enjoy island hopping, snorkeling, banana boat rides, and jet skiing while soaking up the sun in the stunning Pulau Seribu archipelago.</p><h2>Included / Excluded</h2><ul><li>✅ 2 nights stay at Marina Dive Lodge</li><li>✅ Return speedboat transfer from Marina Ancol</li><li>✅ Snorkeling gear and guided sessions</li><li>✅ Banana boat & jet ski experience</li><li>✅ Island hopping tour (3 islands)</li><li>✅ 2 breakfasts, 2 lunches, 1 dinner</li><li>❌ Underwater camera rental</li><li>❌ Insurance and optional diving sessions</li></ul>',
    '<ul><li><strong>Day 1:</strong> Speedboat to Pulau Seribu, check-in, snorkeling at sunset point, welcome BBQ</li><li><strong>Day 2:</strong> Island hopping (Kelor, Onrust, and Cipir), banana boat & jet ski rides</li><li><strong>Day 3:</strong> Morning leisure time, souvenir shopping, speedboat back to Jakarta</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>4-5 pax</td><td>1,099</td></tr><tr><td>6-9 pax</td><td>1,049</td></tr><tr><td>10 pax and above</td><td>999</td></tr></table><p>Note: Life jackets included. Additional water activities (diving, night kayaking) available at surcharge.</p>',
    'Marina Dive Lodge',
    '<ul><li>Minimum 4 participants required. Children under 12 not recommended due to water safety.</li><li>Subject to weather conditions; alternate activities will be arranged in case of bad weather.</li><li>Bookings must be confirmed 7 days before departure. No refund for missed boat departure.</li><li>Cancellation charges apply based on notice period: 30% if within 5 days, 50% within 3 days.</li></ul>'
);

INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    7,
    '2D1N Monas (Historical Exploration) – Jakarta Heritage Hotel',
    'From RM549.00',
    '2 Days, 1 Night',
    '2',
    'History, City',
    'HALA-MONAS-HIST',
    '<h2>Overview</h2><p>Discover Jakarta''s rich historical legacy with this short yet insightful city tour centered around Monas. Learn about Indonesia''s journey to independence, visit surrounding museums, and enjoy a relaxed urban stay.</p><h2>Included / Excluded</h2><ul><li>✅ 1 night stay at Jakarta Heritage Hotel</li><li>✅ Monas tower entrance ticket & museum tour</li><li>✅ Local city guide for a half-day tour</li><li>✅ 1 breakfast and 1 lunch included</li><li>❌ Dinner</li><li>❌ Airport transfer (can be arranged upon request)</li></ul>',
    '<ul><li><strong>Day 1:</strong> Check-in, Monas tower visit, National Museum and Freedom Square tour</li><li><strong>Day 2:</strong> Morning local walking tour, souvenir stop, check-out</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>2-3 pax</td><td>549</td></tr><tr><td>4-6 pax</td><td>519</td></tr><tr><td>7 pax and above</td><td>499</td></tr></table><p>Note: Children aged 5 and below can join for free without meals. Group rates available for institutions and schools.</p>',
    'Jakarta Heritage Hotel',
    '<ul><li>Monas tower access subject to weather and government regulations.</li><li>Bookings require confirmation 5 days in advance.</li><li>Additional nights or airport pickup available upon request with extra charge.</li><li>50% deposit required. Cancellation less than 48 hours before departure forfeits deposit.</li></ul>'
);
INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    7,
    '2D1N Monas (Heritage Tour) – Jakarta City Stay',
    'From RM589.00',
    '2 Days, 1 Night',
    '2',
    'Heritage, City',
    'HALA-MONAS-HER',
    '<h2>Overview</h2><p>This package is perfect for culture enthusiasts seeking a short yet immersive experience in Jakarta. Visit Monas, Indonesia''s iconic National Monument, learn about its rich independence history, and enjoy traditional cuisine in the heart of the capital city.</p><h2>Included / Excluded</h2><ul><li>✅ 1-night stay at Jakarta City Stay hotel</li><li>✅ Monas entrance tickets</li><li>✅ Guided historical walk & city tour</li><li>✅ Traditional lunch at a heritage restaurant</li><li>✅ Transportation for tour duration</li><li>❌ Flights to Jakarta</li><li>❌ Personal shopping expenses</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrival in Jakarta, hotel check-in, Monas guided visit, museum walk, traditional dinner</li><li><strong>Day 2:</strong> Cultural city tour (Kota Tua), Batavia café brunch, transfer to airport</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>2-3 pax</td><td>589</td></tr><tr><td>4-6 pax</td><td>549</td></tr><tr><td>7 pax and above</td><td>529</td></tr></table><p>Note: Ideal for weekend getaways or short city breaks. Private tours available upon request.</p>',
    'Jakarta City Stay',
    '<ul><li>Tour timings may vary based on local traffic and events.</li><li>Advance booking required at least 5 days before travel.</li><li>No refunds for missed attractions due to late arrivals or personal delays.</li><li>Itinerary can be customized for private groups.</li></ul>'
);
INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    7,
    '3D2N Monas (Night City Escape) – Urban Glow Hotel',
    'From RM789.00',
    '3 Days, 2 Nights',
    '2',
    'City Lights, Nightlife',
    'HALA-MONAS-NIGHT',
    '<h2>Overview</h2><p>Perfect for night owls and urban explorers, this package showcases Jakarta''s city lights and after-dark attractions. Highlights include Monas’ evening illumination, a culinary night tour, and rooftop dining with skyline views.</p><h2>Included / Excluded</h2><ul><li>✅ 2 nights at Urban Glow Hotel</li><li>✅ Monas night illumination experience</li><li>✅ Nighttime food street tour</li><li>✅ Rooftop dinner reservation</li><li>✅ 2 breakfasts, 1 dinner</li><li>❌ Flights to/from Jakarta</li><li>❌ Additional snacks and drinks</li></ul>',
    '<ul><li><strong>Day 1:</strong> Check-in, evening Monas light tour, welcome drink</li><li><strong>Day 2:</strong> Free morning, street food tour in Glodok, rooftop dinner</li><li><strong>Day 3:</strong> Late breakfast, leisure time, checkout</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>2-3 pax</td><td>789</td></tr><tr><td>4-6 pax</td><td>759</td></tr><tr><td>7 pax and above</td><td>729</td></tr></table><p>Note: Rooftop dinner includes 3-course set meal. Vegetarian options available upon request.</p>',
    'Urban Glow Hotel',
    '<ul><li>City traffic may cause minor delays in evening tours.</li><li>Smart casual attire required for rooftop dinner experience.</li><li>Minimum age for rooftop access: 13 years.</li><li>Bookings close 5 days before tour start. Full payment required upfront.</li></ul>'
);

INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    8,
    '3D2N Komodo Encounter (Explorer Package) – Labuan Bajo Stay',
    'From RM1099.00',
    '3 Days, 2 Nights',
    '2',
    'Wildlife, Adventure',
    'HALA-KMD-EXP',
    '<h2>Overview</h2><p>This Explorer Package offers a thrilling short expedition to Komodo Island, perfect for travelers looking for a mix of wildlife, boat trips, and stunning scenery. You''ll track the legendary Komodo dragons with an expert guide, snorkel at Pink Beach, and unwind with sunset views from Padar Island.</p><h2>Included / Excluded</h2><ul><li>✅ 2 nights'' hotel accommodation in Labuan Bajo</li><li>✅ Full-day Komodo Island boat trip</li><li>✅ Park ranger and island entrance fees</li><li>✅ Snorkeling gear & boat transport</li><li>✅ Daily breakfast, 1 packed lunch</li><li>❌ Domestic flight to Labuan Bajo</li><li>❌ Personal expenses, tips</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrive in Labuan Bajo, check-in and explore harborfront</li><li><strong>Day 2:</strong> Komodo boat tour: Komodo dragon trek, snorkel at Pink Beach, hike Padar Island</li><li><strong>Day 3:</strong> Leisure morning, souvenir shopping, transfer to airport</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>2-3 pax</td><td>1099</td></tr><tr><td>4-6 pax</td><td>1049</td></tr><tr><td>7 pax and above</td><td>999</td></tr></table><p>Note: Additional conservation tax applies at entrance. Children under 10 are not allowed on Komodo trek for safety reasons.</p>',
    'Labuan Bajo Stay',
    '<ul><li>Tour availability is subject to weather and park regulations.</li><li>Wear sturdy footwear and sun protection during island trek.</li><li>Bookings should be confirmed 7 days in advance with 50% deposit.</li></ul>'
);
INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    8,
    '3D2N Komodo (Wildlife Trek) – Komodo Hillside Inn',
    'From RM1,199.00',
    '3 Days, 2 Nights',
    '2',
    'Wildlife, Nature',
    'HALA-KOM-WILD',
    '<h2>Overview</h2><p>Get up close with nature on this adventurous wildlife-focused journey. Trek the rugged terrain of Komodo Island, encounter the legendary Komodo dragons in their natural habitat, and enjoy serene views over coastal hills. This tour is perfect for travelers seeking wild beauty and island exploration.</p><h2>Included / Excluded</h2><ul><li>✅ 2 nights stay at Komodo Hillside Inn</li><li>✅ Guided Komodo dragon trekking tour</li><li>✅ Entrance fees to Komodo National Park</li><li>✅ Daily breakfast, 1 lunch during trekking</li><li>✅ Speedboat transfers from Labuan Bajo</li><li>❌ Flights to Labuan Bajo</li><li>❌ Dinner and extra personal expenses</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrival in Labuan Bajo, check-in, sunset view from Bukit Sylvia</li><li><strong>Day 2:</strong> Early morning boat to Komodo Island, ranger-guided trek to spot Komodo dragons, lunch picnic, Pink Beach snorkeling</li><li><strong>Day 3:</strong> Free morning, souvenir shopping, transfer to airport</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>2-3 pax</td><td>1,199</td></tr><tr><td>4-6 pax</td><td>1,159</td></tr><tr><td>7 pax and above</td><td>1,129</td></tr></table><p>Note: Komodo trek includes basic safety gear. Visitors must follow park ranger instructions at all times for safety.</p>',
    'Komodo Hillside Inn',
    '<ul><li>Visitors must be physically fit for moderate hiking.</li><li>Tours depend on weather and sea conditions. Alternative routes may be used during rough weather.</li><li>Non-refundable deposit of 40% required to confirm booking.</li><li>No refunds for missed activities due to personal reasons or delay in arrival.</li></ul>'
);
INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    8,
    '4D3N Komodo (Explorer''s Escape) – Ocean Breeze Resort',
    'From RM1,399.00',
    '4 Days, 3 Nights',
    '2',
    'Exploration, Wildlife, Marine',
    'HALA-KOM-EXP',
    '<h2>Overview</h2><p>For those who crave deeper exploration, this package offers multi-island visits, marine experiences, and the opportunity to spot Komodo dragons in their full glory. Dive into adventure with island-hopping, sunset cruises, and guided ranger walks through pristine natural trails.</p><h2>Included / Excluded</h2><ul><li>✅ 3 nights’ stay at Ocean Breeze Resort</li><li>✅ Island-hopping tour to Komodo, Rinca, and Padar Islands</li><li>✅ Pink Beach snorkeling and manta ray watching</li><li>✅ Daily breakfast, 2 lunches, 1 sunset cruise dinner</li><li>✅ Entrance and conservation fees</li><li>❌ Domestic flights</li><li>❌ Optional scuba diving experience</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrival and resort check-in, free time, sunset dinner cruise</li><li><strong>Day 2:</strong> Komodo Island and Rinca trek with ranger, beach lunch</li><li><strong>Day 3:</strong> Padar Island hike, Pink Beach snorkeling, Manta Point boat visit</li><li><strong>Day 4:</strong> Leisure morning, resort breakfast, transfer to airport</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>2-3 pax</td><td>1,399</td></tr><tr><td>4-6 pax</td><td>1,349</td></tr><tr><td>7 pax and above</td><td>1,299</td></tr></table><p>Note: Life jackets and snorkeling gear provided. Guests are advised to carry reef-safe sunscreen and light hiking shoes.</p>',
    'Ocean Breeze Resort',
    '<ul><li>Excursions are subject to weather and tidal conditions.</li><li>Tour slots are limited; early booking is recommended (at least 2 weeks prior).</li><li>Children under 10 not allowed on Padar Island hike due to terrain.</li><li>All national park regulations apply strictly.</li></ul>'
);

INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    9,
    '2D1N Labuan Bajo (Quick Adventure) – Bajo Harbor Lodge',
    'From RM799.00',
    '2 Days, 1 Night',
    '2',
    'Sightseeing, Short Stay',
    'HALA-LBJ-QUICK',
    '<h2>Overview</h2><p>Perfect for travelers with limited time, this short adventure offers a taste of Labuan Bajo’s scenic beauty and local flavor. Enjoy a quick cruise around the bay, panoramic viewpoints, and a peaceful night near the harbor. Ideal for a weekend break.</p><h2>Included / Excluded</h2><ul><li>✅ 1 night stay at Bajo Harbor Lodge</li><li>✅ Short bay cruise with local snacks</li><li>✅ Roundtrip airport transfers</li><li>✅ Light breakfast included</li><li>❌ Flights to Labuan Bajo</li><li>❌ Lunch/dinner not included</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrival in Labuan Bajo, welcome drink, evening boat cruise with sunset view</li><li><strong>Day 2:</strong> Morning at leisure, breakfast, optional visit to local souvenir market, transfer to airport</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>2-3 pax</td><td>799</td></tr><tr><td>4-6 pax</td><td>769</td></tr><tr><td>7 pax and above</td><td>739</td></tr></table><p>Note: Price may vary slightly based on boat availability and weekend surcharges.</p>',
    'Bajo Harbor Lodge',
    '<ul><li>This package is ideal for weekend getaways or add-ons to longer trips.</li><li>Subject to room and boat availability at time of booking.</li><li>Deposit of 30% required for confirmation.</li><li>Activities may shift due to tide/weather conditions.</li></ul>'
);
INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    9,
    '4D3N Labuan Bajo (Island Discovery) – Bajo Bay Villas',
    'From RM1,599.00',
    '4 Days, 3 Nights',
    '2',
    'Adventure, Nature',
    'HALA-LAB-ISL',
    '<h2>Overview</h2><p>This 4-day package is perfect for travelers who want to fully experience the island charm of Labuan Bajo and beyond. Visit hidden beaches, snorkeling havens, and the iconic Padar Island. The tour is a blend of adventure and serenity, with enough time to relax and recharge after each excursion.</p><h2>Included / Excluded</h2><ul><li>✅ 3 nights’ stay at Bajo Bay Villas</li><li>✅ Guided tours to Padar Island, Pink Beach, and Kanawa Island</li><li>✅ Snorkeling gear and boat transfers</li><li>✅ Entrance fees to park and beaches</li><li>✅ Breakfasts, 2 lunches onboard the boat</li><li>❌ Dinner and flights to Labuan Bajo</li><li>❌ Personal purchases and travel insurance</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrival at Labuan Bajo, welcome check-in, evening walk at Marina Bay</li><li><strong>Day 2:</strong> Early boat to Padar Island for panoramic view hike, Pink Beach snorkeling, lunch onboard, return</li><li><strong>Day 3:</strong> Island hopping to Kanawa Island and Taka Makassar sandbank, fish feeding and free snorkeling</li><li><strong>Day 4:</strong> Breakfast, souvenir shopping, airport transfer</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>2-3 pax</td><td>1,599</td></tr><tr><td>4-6 pax</td><td>1,549</td></tr><tr><td>7 pax and above</td><td>1,499</td></tr></table><p>Note: All tours are subject to weather conditions. Private tour upgrade available at additional charge.</p>',
    'Bajo Bay Villas',
    '<ul><li>Bookings must be made at least 2 weeks before departure.</li><li>All activities are group-based unless otherwise requested for private arrangements.</li><li>A 50% deposit is required to confirm this package. Remaining balance is due 10 days before departure.</li><li>No refund for last-minute cancellations (within 7 days).</li><li>Custom itinerary available upon request for larger groups.</li></ul>'
);
INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    9,
    '3D2N Labuan Bajo (Romantic Escape) – Sunset View Villas',
    'From RM1,399.00',
    '3 Days, 2 Nights',
    '2',
    'Honeymoon, Relaxation',
    'HALA-LAB-ROM',
    '<h2>Overview</h2><p>This package is crafted for couples seeking a romantic and peaceful retreat. From sunset cruises and candlelit dinners to island strolls and private snorkeling, every detail is planned to offer a dreamy and memorable escape in the heart of Labuan Bajo’s paradise.</p><h2>Included / Excluded</h2><ul><li>✅ 2 nights’ stay at Sunset View Villas (honeymoon suite)</li><li>✅ Welcome flower arrangement and mocktail</li><li>✅ Sunset cruise with light snacks</li><li>✅ Guided island walk and snorkeling trip</li><li>✅ Daily breakfast and 1 candlelight dinner</li><li>❌ Flights to Labuan Bajo</li><li>❌ Additional meals and optional spa treatments</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrival, romantic room setup, evening cruise on Flores Sea</li><li><strong>Day 2:</strong> Leisure breakfast, guided trip to Seraya Island for private snorkeling, candlelight dinner by the sea</li><li><strong>Day 3:</strong> Free morning for spa or beach walk, check-out and airport transfer</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Couple (RM)</th></tr><tr><td>Standard Rate</td><td>1,399</td></tr><tr><td>With Spa Add-on</td><td>1,599</td></tr><tr><td>Premium Suite Upgrade</td><td>1,749</td></tr></table><p>Note: Romantic cruise is subject to favorable weather. Flexible rescheduling available in case of rain.</p>',
    'Sunset View Villas',
    '<ul><li>Honeymoon packages are available year-round, but peak season surcharges apply during major holidays.</li><li>Non-refundable 60% deposit required to confirm honeymoon suite reservation.</li><li>Custom photography or spa packages available on request.</li><li>Early check-in and late check-out requests are subject to availability.</li></ul>'
);

INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    10,
    '3D2N Prambanan (Cultural Discovery) – Candi Garden Hotel',
    'From RM889.00',
    '3 Days, 2 Nights',
    '2',
    'Heritage, Cultural',
    'HALA-PRAM-CULT',
    '<h2>Overview</h2><p>This package offers a rich cultural immersion centered around the magnificent Prambanan Temple. Discover the temple’s historic significance, explore surrounding Javanese heritage villages, and enjoy traditional performances that showcase Indonesia’s ancient traditions.</p><h2>Included / Excluded</h2><ul><li>✅ 2 nights’ stay at Candi Garden Hotel</li><li>✅ Guided Prambanan Temple entrance & tour</li><li>✅ Traditional dance show tickets</li><li>✅ Daily breakfast, 1 lunch at a local restaurant</li><li>✅ Transport & entrance fees included</li><li>❌ Airfare not included</li><li>❌ Personal expenses</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrival in Yogyakarta, check-in, welcome dinner, stroll around Malioboro Street</li><li><strong>Day 2:</strong> Full-day Prambanan tour with guide, traditional dance show in the evening</li><li><strong>Day 3:</strong> Cultural workshop (optional), visit local market, transfer to airport</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>2-3 pax</td><td>889</td></tr><tr><td>4-6 pax</td><td>849</td></tr><tr><td>7 pax and above</td><td>819</td></tr></table><p>Note: Cultural show timings may vary. Please book in advance to ensure reserved seats.</p>',
    'Candi Garden Hotel',
    '<ul><li>Tour bookings must be made at least 10 days in advance.</li><li>Prices are subject to availability and high season surcharges.</li><li>Minimum 2 participants per booking.</li><li>Travel insurance is recommended but not included.</li></ul>'
);
INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    10,
    '3D2N Prambanan (Romantic Heritage Escape) – Svarna Heritage Lodge',
    'From RM1,099.00',
    '3 Days, 2 Nights',
    '2',
    'Honeymoon, Culture',
    'HALA-PRAM-LOVE',
    '<h2>Overview</h2><p>This romantic getaway blends history and intimacy, perfect for couples seeking cultural charm and quiet time together. Visit the ancient Prambanan Temple at sunrise, take a private horse-drawn carriage tour through heritage trails, and enjoy a candlelit dinner under the stars.</p><h2>Included / Excluded</h2><ul><li>✅ 2 nights stay at Svarna Heritage Lodge (Romantic Suite)</li><li>✅ Private Prambanan tour with sunrise view</li><li>✅ Romantic candlelit dinner for two</li><li>✅ Daily breakfast + 1 local lunch</li><li>✅ Horse-drawn carriage heritage trail tour</li><li>❌ Flights to Yogyakarta</li><li>❌ Travel insurance</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrival, hotel check-in, spa session, candlelit dinner at garden terrace</li><li><strong>Day 2:</strong> Early sunrise at Prambanan Temple, heritage carriage ride, free leisure time, lunch at romantic cafe</li><li><strong>Day 3:</strong> Visit Yogyakarta art market, check-out, airport transfer</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Couple (RM)</th></tr><tr><td>2 pax (1 couple)</td><td>1,099</td></tr><tr><td>4 pax (2 couples)</td><td>1,059</td></tr><tr><td>6 pax (3 couples)</td><td>1,029</td></tr></table><p>Note: Add-ons such as photography or spa massage are available upon request.</p>',
    'Svarna Heritage Lodge',
    '<ul><li>This package is ideal for anniversaries, honeymoons, or romantic holidays.</li><li>Early morning tours require punctual wake-up and readiness for sunrise moments.</li><li>Package includes basic transport within itinerary only.</li><li>Optional extensions available for Bali or Borobudur connection.</li></ul>'
);
INSERT INTO packages (destination_id, package_name, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks)
VALUES (
    10,
    '2D1N Prambanan (Budget Explorer) – Taman Yogyakarta Guesthouse',
    'From RM499.00',
    '2 Days, 1 Night',
    '1',
    'Backpacker, Heritage',
    'HALA-PRAM-BUDG',
    '<h2>Overview</h2><p>This compact cultural package is designed for solo travelers or students who want a cost-effective yet enriching experience. Explore the stunning Prambanan Temple complex, meet locals at traditional markets, and rest comfortably at a budget-friendly guesthouse.</p><h2>Included / Excluded</h2><ul><li>✅ 1 night stay at Taman Yogyakarta Guesthouse</li><li>✅ Entry ticket to Prambanan Temple</li><li>✅ One-way local transport to Prambanan</li><li>✅ Breakfast included</li><li>❌ Airport transfers</li><li>❌ Guided tour (available as add-on)</li><li>❌ Meals (other than breakfast)</li></ul>',
    '<ul><li><strong>Day 1:</strong> Arrival and check-in at guesthouse, explore local eateries, optional batik market walk</li><li><strong>Day 2:</strong> Visit Prambanan Temple in the morning, return and check-out before noon</li></ul>',
    '<h2>Price Breakdown</h2><table><tr><th>Category</th><th>Per Pax (RM)</th></tr><tr><td>1 pax</td><td>499</td></tr><tr><td>2-3 pax</td><td>479</td></tr><tr><td>4 pax and above</td><td>459</td></tr></table><p>Note: Add-on options include bike rental, guided tour (+RM50), or shared shuttle to additional temples (+RM30).</p>',
    'Taman Yogyakarta Guesthouse',
    '<ul><li>Package is ideal for short stays or DIY travelers.</li><li>Late check-out may be subject to additional charges.</li><li>Guests are responsible for arranging their own transport to/from guesthouse.</li><li>Optional activities available at additional cost; inquire in advance.</li></ul>'
);

SELECT * FROM destinations;

SELECT * FROM packages;

SELECT * FROM users;