-- ========================================
-- Table: organization
-- ========================================
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

-- ========================================
-- Insert sample data: Organizations (15)
-- ========================================
INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png'),
('Clean Rivers Alliance', 'An environmental group dedicated to restoring and protecting local waterways.', 'info@cleanrivers.org', 'cleanrivers-logo.png'),
('Youth Literacy Network', 'A tutoring and mentorship organization focused on improving childhood literacy rates.', 'contact@youthliteracy.org', 'youthliteracy-logo.png'),
('Helping Hands Shelter', 'A shelter and outreach program providing housing assistance to families in need.', 'info@helpinghands.org', 'helpinghands-logo.png'),
('Animal Rescue Coalition', 'A network of volunteers who rescue, foster, and rehome abandoned animals.', 'contact@animalrescue.org', 'animalrescue-logo.png'),
('Senior Companion Circle', 'A volunteer group offering companionship and support services to elderly community members.', 'hello@seniorcompanion.org', 'seniorcompanion-logo.png'),
('Bike Safety Coalition', 'An organization promoting safe cycling infrastructure and bike education for students.', 'info@bikesafety.org', 'bikesafety-logo.png'),
('Community Health Partners', 'A group of volunteers providing free health screenings and wellness education.', 'contact@communityhealth.org', 'communityhealth-logo.png'),
('Habitat Restoration Crew', 'A conservation organization focused on restoring native habitats and wildlife corridors.', 'info@habitatrestoration.org', 'habitatrestoration-logo.png'),
('Tech for Seniors', 'A volunteer initiative teaching older adults how to use technology safely and confidently.', 'contact@techforseniors.org', 'techforseniors-logo.png'),
('Neighborhood Arts Collective', 'An arts organization bringing free creative workshops and murals to underserved neighborhoods.', 'hello@neighborhoodarts.org', 'neighborhoodarts-logo.png'),
('Veterans Support Network', 'A nonprofit connecting volunteers with local veterans for mentorship and assistance programs.', 'info@veteranssupport.org', 'veteranssupport-logo.png'),
('Clean Energy Advocates', 'An organization educating communities about renewable energy and sustainable living practices.', 'contact@cleanenergy.org', 'cleanenergy-logo.png');

-- ========================================
-- Table: project
-- ========================================
CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL REFERENCES organization(organization_id) ON DELETE CASCADE,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255),
    date DATE
);

-- ========================================
-- Insert sample data: Projects (5 per organization = 75 total)
-- ========================================
INSERT INTO project (organization_id, title, description, location, date)
VALUES
-- BrightFuture Builders
((SELECT organization_id FROM organization WHERE name = 'BrightFuture Builders'), 'Park Cleanup', 'Join us to clean up local parks and make them beautiful!', 'Central Park', '2026-10-12'),
((SELECT organization_id FROM organization WHERE name = 'BrightFuture Builders'), 'Playground Rebuild', 'Help rebuild an aging playground with new, safer equipment.', 'Oakwood Elementary', '2026-11-07'),
((SELECT organization_id FROM organization WHERE name = 'BrightFuture Builders'), 'Accessibility Ramp Build', 'Construct wheelchair ramps for community members in need.', 'Maple Street Community Center', '2026-12-03'),
((SELECT organization_id FROM organization WHERE name = 'BrightFuture Builders'), 'Sidewalk Repair Day', 'Repair cracked and uneven sidewalks throughout downtown.', 'Downtown District', '2027-01-15'),
((SELECT organization_id FROM organization WHERE name = 'BrightFuture Builders'), 'Community Garden Fence Build', 'Build a fence to protect the community garden from wildlife.', 'Riverside Community Garden', '2027-02-06'),

-- GreenHarvest Growers
((SELECT organization_id FROM organization WHERE name = 'GreenHarvest Growers'), 'Food Drive', 'Help collect and distribute food to those in need.', 'Community Center', '2026-11-03'),
((SELECT organization_id FROM organization WHERE name = 'GreenHarvest Growers'), 'Community Garden Planting Day', 'Plant vegetables and herbs in the neighborhood community garden.', 'Elm Street Garden', '2026-10-19'),
((SELECT organization_id FROM organization WHERE name = 'GreenHarvest Growers'), 'Farmers Market Volunteer Day', 'Help set up and run the weekly farmers market booth.', 'Town Square Market', '2026-11-21'),
((SELECT organization_id FROM organization WHERE name = 'GreenHarvest Growers'), 'Composting Workshop', 'Learn how to compost food scraps to reduce waste.', 'GreenHarvest Farm', '2026-12-10'),
((SELECT organization_id FROM organization WHERE name = 'GreenHarvest Growers'), 'Seed Swap Event', 'Trade seeds with fellow gardeners for next season''s planting.', 'Community Hall', '2027-01-24'),

-- UnityServe Volunteers
((SELECT organization_id FROM organization WHERE name = 'UnityServe Volunteers'), 'Community Tutoring', 'Volunteer to tutor students in various subjects.', 'Public Library', '2026-11-20'),
((SELECT organization_id FROM organization WHERE name = 'UnityServe Volunteers'), 'Neighborhood Cleanup Day', 'Pick up litter and beautify neighborhood streets.', 'Maple Heights', '2026-10-26'),
((SELECT organization_id FROM organization WHERE name = 'UnityServe Volunteers'), 'Holiday Meal Packing', 'Pack holiday meal boxes for local families in need.', 'UnityServe Warehouse', '2026-12-18'),
((SELECT organization_id FROM organization WHERE name = 'UnityServe Volunteers'), 'Volunteer Fair', 'Connect community members with local volunteer opportunities.', 'City Hall Plaza', '2027-01-09'),
((SELECT organization_id FROM organization WHERE name = 'UnityServe Volunteers'), 'Blood Donation Drive', 'Help organize and staff a community blood donation event.', 'Community Center', '2027-02-13'),

-- Clean Rivers Alliance
((SELECT organization_id FROM organization WHERE name = 'Clean Rivers Alliance'), 'River Cleanup Day', 'Help remove trash and debris from the local riverbanks.', 'Riverside Trail', '2026-10-18'),
((SELECT organization_id FROM organization WHERE name = 'Clean Rivers Alliance'), 'Storm Drain Stenciling', 'Stencil storm drains to remind residents not to dump pollutants.', 'Downtown Storm Drains', '2026-11-14'),
((SELECT organization_id FROM organization WHERE name = 'Clean Rivers Alliance'), 'Water Quality Testing Day', 'Assist volunteers in testing local stream water quality.', 'Willow Creek', '2026-12-05'),
((SELECT organization_id FROM organization WHERE name = 'Clean Rivers Alliance'), 'Riverbank Tree Planting', 'Plant trees along the riverbank to reduce erosion.', 'Eastside Riverbank', '2027-01-16'),
((SELECT organization_id FROM organization WHERE name = 'Clean Rivers Alliance'), 'Watershed Education Fair', 'Teach the community about protecting the local watershed.', 'River Park Pavilion', '2027-02-20'),

-- Youth Literacy Network
((SELECT organization_id FROM organization WHERE name = 'Youth Literacy Network'), 'After-School Reading Program', 'Read with elementary students to help build their literacy skills.', 'Lincoln Elementary School', '2026-10-25'),
((SELECT organization_id FROM organization WHERE name = 'Youth Literacy Network'), 'Book Drive', 'Collect gently used books to donate to local schools.', 'Public Library', '2026-11-15'),
((SELECT organization_id FROM organization WHERE name = 'Youth Literacy Network'), 'Summer Reading Kickoff', 'Help launch the summer reading program for local children.', 'Community Center', '2026-12-06'),
((SELECT organization_id FROM organization WHERE name = 'Youth Literacy Network'), 'Literacy Night for Families', 'Host an evening of reading activities for families.', 'Jefferson Middle School', '2027-01-22'),
((SELECT organization_id FROM organization WHERE name = 'Youth Literacy Network'), 'Storytime Volunteer Day', 'Read stories aloud to young children at the library.', 'Downtown Library Branch', '2027-02-05'),

-- Helping Hands Shelter
((SELECT organization_id FROM organization WHERE name = 'Helping Hands Shelter'), 'Winter Coat Drive', 'Collect and distribute winter coats to families experiencing homelessness.', 'Downtown Shelter', '2026-12-05'),
((SELECT organization_id FROM organization WHERE name = 'Helping Hands Shelter'), 'Shelter Meal Service', 'Help prepare and serve meals to shelter residents.', 'Helping Hands Kitchen', '2026-10-30'),
((SELECT organization_id FROM organization WHERE name = 'Helping Hands Shelter'), 'Hygiene Kit Assembly', 'Assemble hygiene kits for individuals experiencing homelessness.', 'Community Center', '2026-11-19'),
((SELECT organization_id FROM organization WHERE name = 'Helping Hands Shelter'), 'Job Readiness Workshop', 'Help lead a workshop on resumes and interview skills.', 'Helping Hands Shelter', '2027-01-14'),
((SELECT organization_id FROM organization WHERE name = 'Helping Hands Shelter'), 'Family Housing Fundraiser', 'Support a fundraiser to help families find stable housing.', 'Grand Hall', '2027-02-11'),

-- Animal Rescue Coalition
((SELECT organization_id FROM organization WHERE name = 'Animal Rescue Coalition'), 'Shelter Volunteer Day', 'Help walk, feed, and socialize animals waiting for adoption.', 'City Animal Shelter', '2026-10-30'),
((SELECT organization_id FROM organization WHERE name = 'Animal Rescue Coalition'), 'Adoption Event', 'Help host a pet adoption event to find animals loving homes.', 'Town Square', '2026-11-22'),
((SELECT organization_id FROM organization WHERE name = 'Animal Rescue Coalition'), 'Foster Training Workshop', 'Learn how to become a foster caregiver for rescue animals.', 'Animal Rescue Coalition HQ', '2026-12-13'),
((SELECT organization_id FROM organization WHERE name = 'Animal Rescue Coalition'), 'Pet Supply Drive', 'Collect pet food and supplies for shelter animals.', 'Community Center', '2027-01-17'),
((SELECT organization_id FROM organization WHERE name = 'Animal Rescue Coalition'), 'Spay and Neuter Awareness Day', 'Promote low-cost spay and neuter services in the community.', 'Veterinary Clinic', '2027-02-07'),

-- Senior Companion Circle
((SELECT organization_id FROM organization WHERE name = 'Senior Companion Circle'), 'Weekly Visit Program', 'Spend time visiting and assisting seniors at the community care home.', 'Sunrise Senior Living', '2026-11-08'),
((SELECT organization_id FROM organization WHERE name = 'Senior Companion Circle'), 'Holiday Card Making Day', 'Make holiday cards with seniors to send to loved ones.', 'Senior Center', '2026-12-12'),
((SELECT organization_id FROM organization WHERE name = 'Senior Companion Circle'), 'Game Afternoon', 'Play board games and cards with residents for an afternoon.', 'Sunrise Senior Living', '2026-10-24'),
((SELECT organization_id FROM organization WHERE name = 'Senior Companion Circle'), 'Music Therapy Session', 'Assist with a music therapy session for memory care residents.', 'Golden Years Care Home', '2027-01-20'),
((SELECT organization_id FROM organization WHERE name = 'Senior Companion Circle'), 'Companion Walk Program', 'Accompany seniors on short, guided walks outdoors.', 'Riverside Senior Home', '2027-02-14'),

-- Bike Safety Coalition
((SELECT organization_id FROM organization WHERE name = 'Bike Safety Coalition'), 'Bike Safety Workshop', 'Teach elementary students the basics of safe cycling and bike maintenance.', 'Roosevelt Middle School', '2026-11-15'),
((SELECT organization_id FROM organization WHERE name = 'Bike Safety Coalition'), 'Helmet Giveaway Day', 'Distribute free helmets to children in the community.', 'City Park', '2026-10-31'),
((SELECT organization_id FROM organization WHERE name = 'Bike Safety Coalition'), 'Bike Repair Clinic', 'Help teach basic bike repair skills to community members.', 'Community Bike Shop', '2026-12-19'),
((SELECT organization_id FROM organization WHERE name = 'Bike Safety Coalition'), 'Safe Routes to School Walk', 'Promote safe walking and biking routes to school.', 'Jefferson Elementary', '2027-01-23'),
((SELECT organization_id FROM organization WHERE name = 'Bike Safety Coalition'), 'Cycling Safety Fair', 'Host an interactive fair teaching cycling safety rules.', 'Town Square', '2027-02-19'),

-- Community Health Partners
((SELECT organization_id FROM organization WHERE name = 'Community Health Partners'), 'Free Health Screening Day', 'Assist medical volunteers with free blood pressure and wellness checks.', 'Community Health Clinic', '2026-12-01'),
((SELECT organization_id FROM organization WHERE name = 'Community Health Partners'), 'Flu Shot Clinic', 'Help staff a free flu vaccination clinic for the community.', 'Community Center', '2026-11-06'),
((SELECT organization_id FROM organization WHERE name = 'Community Health Partners'), 'Nutrition Workshop', 'Assist with a workshop teaching healthy eating habits.', 'Public Library', '2026-10-27'),
((SELECT organization_id FROM organization WHERE name = 'Community Health Partners'), 'Mental Health Awareness Fair', 'Help raise awareness about mental health resources.', 'City Hall Plaza', '2027-01-12'),
((SELECT organization_id FROM organization WHERE name = 'Community Health Partners'), 'Blood Pressure Check Day', 'Provide free blood pressure screenings for seniors.', 'Senior Center', '2027-02-04'),

-- Habitat Restoration Crew
((SELECT organization_id FROM organization WHERE name = 'Habitat Restoration Crew'), 'Native Plant Restoration', 'Help plant native species to restore a local wildlife habitat.', 'Willow Creek Preserve', '2026-10-22'),
((SELECT organization_id FROM organization WHERE name = 'Habitat Restoration Crew'), 'Invasive Species Removal Day', 'Remove invasive plants threatening local ecosystems.', 'Cedar Ridge Preserve', '2026-11-12'),
((SELECT organization_id FROM organization WHERE name = 'Habitat Restoration Crew'), 'Wetland Cleanup', 'Help clean up and restore a local wetland area.', 'Marshview Nature Area', '2026-12-08'),
((SELECT organization_id FROM organization WHERE name = 'Habitat Restoration Crew'), 'Trail Restoration Project', 'Repair and maintain hiking trails damaged by erosion.', 'Pinecrest Trailhead', '2027-01-18'),
((SELECT organization_id FROM organization WHERE name = 'Habitat Restoration Crew'), 'Wildlife Habitat Build Day', 'Build nesting boxes and habitats for local wildlife.', 'Sunset Meadows Reserve', '2027-02-08'),

-- Tech for Seniors
((SELECT organization_id FROM organization WHERE name = 'Tech for Seniors'), 'Tech Help Day', 'Assist seniors with smartphones, video calls, and online safety basics.', 'Senior Center', '2026-11-12'),
((SELECT organization_id FROM organization WHERE name = 'Tech for Seniors'), 'Smartphone Basics Class', 'Teach seniors the fundamentals of using a smartphone.', 'Sunrise Senior Living', '2026-10-29'),
((SELECT organization_id FROM organization WHERE name = 'Tech for Seniors'), 'Online Safety Workshop', 'Help seniors learn to recognize and avoid online scams.', 'Community Center', '2026-12-17'),
((SELECT organization_id FROM organization WHERE name = 'Tech for Seniors'), 'Video Call Setup Day', 'Help seniors set up video calling apps to connect with family.', 'Golden Years Care Home', '2027-01-21'),
((SELECT organization_id FROM organization WHERE name = 'Tech for Seniors'), 'Tech Q&A Drop-In', 'Answer general tech questions in an informal drop-in session.', 'Public Library', '2027-02-12'),

-- Neighborhood Arts Collective
((SELECT organization_id FROM organization WHERE name = 'Neighborhood Arts Collective'), 'Community Mural Painting', 'Help paint a community mural celebrating local culture and history.', 'Fifth Street Plaza', '2026-11-29'),
((SELECT organization_id FROM organization WHERE name = 'Neighborhood Arts Collective'), 'Youth Art Workshop', 'Lead a creative art workshop for neighborhood children.', 'Neighborhood Arts Studio', '2026-10-17'),
((SELECT organization_id FROM organization WHERE name = 'Neighborhood Arts Collective'), 'Pop-Up Gallery Night', 'Help set up a pop-up gallery featuring local artists.', 'Downtown Gallery Space', '2026-12-20'),
((SELECT organization_id FROM organization WHERE name = 'Neighborhood Arts Collective'), 'Sidewalk Chalk Festival', 'Join a community sidewalk chalk art festival.', 'Main Street', '2027-01-10'),
((SELECT organization_id FROM organization WHERE name = 'Neighborhood Arts Collective'), 'Community Sculpture Build', 'Help design and build a collaborative community sculpture.', 'Riverside Park', '2027-02-21'),

-- Veterans Support Network
((SELECT organization_id FROM organization WHERE name = 'Veterans Support Network'), 'Veterans Mentorship Meetup', 'Support local veterans through mentorship and resource navigation.', 'Veterans Hall', '2026-12-10'),
((SELECT organization_id FROM organization WHERE name = 'Veterans Support Network'), 'Veterans Resource Fair', 'Connect veterans with housing, health, and career resources.', 'Community Center', '2026-11-11'),
((SELECT organization_id FROM organization WHERE name = 'Veterans Support Network'), 'Holiday Care Package Assembly', 'Assemble care packages for veterans during the holidays.', 'Veterans Hall', '2026-12-22'),
((SELECT organization_id FROM organization WHERE name = 'Veterans Support Network'), 'Job Fair for Veterans', 'Help organize a job fair connecting veterans with employers.', 'City Convention Center', '2027-01-27'),
((SELECT organization_id FROM organization WHERE name = 'Veterans Support Network'), 'Veterans Appreciation Breakfast', 'Help host a breakfast honoring local veterans.', 'VFW Post', '2027-02-15'),

-- Clean Energy Advocates
((SELECT organization_id FROM organization WHERE name = 'Clean Energy Advocates'), 'Solar Awareness Fair', 'Help staff an educational booth about renewable energy options for homeowners.', 'Town Square', '2026-12-15'),
((SELECT organization_id FROM organization WHERE name = 'Clean Energy Advocates'), 'Home Energy Audit Workshop', 'Teach residents how to reduce energy use at home.', 'Community Center', '2026-11-05'),
((SELECT organization_id FROM organization WHERE name = 'Clean Energy Advocates'), 'Renewable Energy Expo', 'Help showcase renewable energy technologies to the public.', 'Convention Hall', '2026-10-28'),
((SELECT organization_id FROM organization WHERE name = 'Clean Energy Advocates'), 'Energy Saving Tips Fair', 'Share practical tips for reducing household energy costs.', 'Public Library', '2027-01-19'),
((SELECT organization_id FROM organization WHERE name = 'Clean Energy Advocates'), 'Electric Vehicle Showcase', 'Help host a showcase of electric vehicles for the community.', 'Town Square', '2027-02-18');

-- ========================================
-- Table: category
-- ========================================
CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- ========================================
-- Insert sample data: Categories
-- ========================================
INSERT INTO category (name)
VALUES
('Environmental'),
('Educational'),
('Community Service'),
('Health and Wellness'),
('Animal Welfare'),
('Arts and Culture'),
('Technology');

-- ========================================
-- Table: project_category (join table for many-to-many)
-- ========================================
CREATE TABLE project_category (
    project_id INTEGER NOT NULL REFERENCES project(project_id) ON DELETE CASCADE,
    category_id INTEGER NOT NULL REFERENCES category(category_id) ON DELETE CASCADE,
    PRIMARY KEY (project_id, category_id)
);

-- ========================================
-- Associate each project with at least one category
-- ========================================
INSERT INTO project_category (project_id, category_id)
VALUES
-- BrightFuture Builders
((SELECT project_id FROM project WHERE title = 'Park Cleanup'), (SELECT category_id FROM category WHERE name = 'Environmental')),
((SELECT project_id FROM project WHERE title = 'Playground Rebuild'), (SELECT category_id FROM category WHERE name = 'Community Service')),
((SELECT project_id FROM project WHERE title = 'Accessibility Ramp Build'), (SELECT category_id FROM category WHERE name = 'Community Service')),
((SELECT project_id FROM project WHERE title = 'Sidewalk Repair Day'), (SELECT category_id FROM category WHERE name = 'Environmental')),
((SELECT project_id FROM project WHERE title = 'Community Garden Fence Build'), (SELECT category_id FROM category WHERE name = 'Environmental')),

-- GreenHarvest Growers
((SELECT project_id FROM project WHERE title = 'Food Drive'), (SELECT category_id FROM category WHERE name = 'Community Service')),
((SELECT project_id FROM project WHERE title = 'Food Drive'), (SELECT category_id FROM category WHERE name = 'Health and Wellness')),
((SELECT project_id FROM project WHERE title = 'Community Garden Planting Day'), (SELECT category_id FROM category WHERE name = 'Environmental')),
((SELECT project_id FROM project WHERE title = 'Farmers Market Volunteer Day'), (SELECT category_id FROM category WHERE name = 'Community Service')),
((SELECT project_id FROM project WHERE title = 'Composting Workshop'), (SELECT category_id FROM category WHERE name = 'Educational')),
((SELECT project_id FROM project WHERE title = 'Seed Swap Event'), (SELECT category_id FROM category WHERE name = 'Environmental')),

-- UnityServe Volunteers
((SELECT project_id FROM project WHERE title = 'Community Tutoring'), (SELECT category_id FROM category WHERE name = 'Educational')),
((SELECT project_id FROM project WHERE title = 'Neighborhood Cleanup Day'), (SELECT category_id FROM category WHERE name = 'Environmental')),
((SELECT project_id FROM project WHERE title = 'Holiday Meal Packing'), (SELECT category_id FROM category WHERE name = 'Community Service')),
((SELECT project_id FROM project WHERE title = 'Volunteer Fair'), (SELECT category_id FROM category WHERE name = 'Community Service')),
((SELECT project_id FROM project WHERE title = 'Blood Donation Drive'), (SELECT category_id FROM category WHERE name = 'Health and Wellness')),

-- Clean Rivers Alliance
((SELECT project_id FROM project WHERE title = 'River Cleanup Day'), (SELECT category_id FROM category WHERE name = 'Environmental')),
((SELECT project_id FROM project WHERE title = 'Storm Drain Stenciling'), (SELECT category_id FROM category WHERE name = 'Environmental')),
((SELECT project_id FROM project WHERE title = 'Water Quality Testing Day'), (SELECT category_id FROM category WHERE name = 'Environmental')),
((SELECT project_id FROM project WHERE title = 'Riverbank Tree Planting'), (SELECT category_id FROM category WHERE name = 'Environmental')),
((SELECT project_id FROM project WHERE title = 'Watershed Education Fair'), (SELECT category_id FROM category WHERE name = 'Educational')),

-- Youth Literacy Network
((SELECT project_id FROM project WHERE title = 'After-School Reading Program'), (SELECT category_id FROM category WHERE name = 'Educational')),
((SELECT project_id FROM project WHERE title = 'Book Drive'), (SELECT category_id FROM category WHERE name = 'Educational')),
((SELECT project_id FROM project WHERE title = 'Summer Reading Kickoff'), (SELECT category_id FROM category WHERE name = 'Educational')),
((SELECT project_id FROM project WHERE title = 'Literacy Night for Families'), (SELECT category_id FROM category WHERE name = 'Educational')),
((SELECT project_id FROM project WHERE title = 'Storytime Volunteer Day'), (SELECT category_id FROM category WHERE name = 'Educational')),

-- Helping Hands Shelter
((SELECT project_id FROM project WHERE title = 'Winter Coat Drive'), (SELECT category_id FROM category WHERE name = 'Community Service')),
((SELECT project_id FROM project WHERE title = 'Shelter Meal Service'), (SELECT category_id FROM category WHERE name = 'Community Service')),
((SELECT project_id FROM project WHERE title = 'Hygiene Kit Assembly'), (SELECT category_id FROM category WHERE name = 'Health and Wellness')),
((SELECT project_id FROM project WHERE title = 'Job Readiness Workshop'), (SELECT category_id FROM category WHERE name = 'Community Service')),
((SELECT project_id FROM project WHERE title = 'Family Housing Fundraiser'), (SELECT category_id FROM category WHERE name = 'Community Service')),

-- Animal Rescue Coalition
((SELECT project_id FROM project WHERE title = 'Shelter Volunteer Day'), (SELECT category_id FROM category WHERE name = 'Animal Welfare')),
((SELECT project_id FROM project WHERE title = 'Adoption Event'), (SELECT category_id FROM category WHERE name = 'Animal Welfare')),
((SELECT project_id FROM project WHERE title = 'Foster Training Workshop'), (SELECT category_id FROM category WHERE name = 'Animal Welfare')),
((SELECT project_id FROM project WHERE title = 'Pet Supply Drive'), (SELECT category_id FROM category WHERE name = 'Animal Welfare')),
((SELECT project_id FROM project WHERE title = 'Spay and Neuter Awareness Day'), (SELECT category_id FROM category WHERE name = 'Health and Wellness')),

-- Senior Companion Circle
((SELECT project_id FROM project WHERE title = 'Weekly Visit Program'), (SELECT category_id FROM category WHERE name = 'Community Service')),
((SELECT project_id FROM project WHERE title = 'Weekly Visit Program'), (SELECT category_id FROM category WHERE name = 'Health and Wellness')),
((SELECT project_id FROM project WHERE title = 'Holiday Card Making Day'), (SELECT category_id FROM category WHERE name = 'Arts and Culture')),
((SELECT project_id FROM project WHERE title = 'Game Afternoon'), (SELECT category_id FROM category WHERE name = 'Community Service')),
((SELECT project_id FROM project WHERE title = 'Music Therapy Session'), (SELECT category_id FROM category WHERE name = 'Health and Wellness')),
((SELECT project_id FROM project WHERE title = 'Companion Walk Program'), (SELECT category_id FROM category WHERE name = 'Health and Wellness')),

-- Bike Safety Coalition
((SELECT project_id FROM project WHERE title = 'Bike Safety Workshop'), (SELECT category_id FROM category WHERE name = 'Educational')),
((SELECT project_id FROM project WHERE title = 'Bike Safety Workshop'), (SELECT category_id FROM category WHERE name = 'Health and Wellness')),
((SELECT project_id FROM project WHERE title = 'Helmet Giveaway Day'), (SELECT category_id FROM category WHERE name = 'Health and Wellness')),
((SELECT project_id FROM project WHERE title = 'Bike Repair Clinic'), (SELECT category_id FROM category WHERE name = 'Educational')),
((SELECT project_id FROM project WHERE title = 'Safe Routes to School Walk'), (SELECT category_id FROM category WHERE name = 'Health and Wellness')),
((SELECT project_id FROM project WHERE title = 'Cycling Safety Fair'), (SELECT category_id FROM category WHERE name = 'Educational')),

-- Community Health Partners
((SELECT project_id FROM project WHERE title = 'Free Health Screening Day'), (SELECT category_id FROM category WHERE name = 'Health and Wellness')),
((SELECT project_id FROM project WHERE title = 'Flu Shot Clinic'), (SELECT category_id FROM category WHERE name = 'Health and Wellness')),
((SELECT project_id FROM project WHERE title = 'Nutrition Workshop'), (SELECT category_id FROM category WHERE name = 'Health and Wellness')),
((SELECT project_id FROM project WHERE title = 'Mental Health Awareness Fair'), (SELECT category_id FROM category WHERE name = 'Health and Wellness')),
((SELECT project_id FROM project WHERE title = 'Blood Pressure Check Day'), (SELECT category_id FROM category WHERE name = 'Health and Wellness')),

-- Habitat Restoration Crew
((SELECT project_id FROM project WHERE title = 'Native Plant Restoration'), (SELECT category_id FROM category WHERE name = 'Environmental')),
((SELECT project_id FROM project WHERE title = 'Invasive Species Removal Day'), (SELECT category_id FROM category WHERE name = 'Environmental')),
((SELECT project_id FROM project WHERE title = 'Wetland Cleanup'), (SELECT category_id FROM category WHERE name = 'Environmental')),
((SELECT project_id FROM project WHERE title = 'Trail Restoration Project'), (SELECT category_id FROM category WHERE name = 'Environmental')),
((SELECT project_id FROM project WHERE title = 'Wildlife Habitat Build Day'), (SELECT category_id FROM category WHERE name = 'Environmental')),

-- Tech for Seniors
((SELECT project_id FROM project WHERE title = 'Tech Help Day'), (SELECT category_id FROM category WHERE name = 'Technology')),
((SELECT project_id FROM project WHERE title = 'Tech Help Day'), (SELECT category_id FROM category WHERE name = 'Community Service')),
((SELECT project_id FROM project WHERE title = 'Smartphone Basics Class'), (SELECT category_id FROM category WHERE name = 'Technology')),
((SELECT project_id FROM project WHERE title = 'Online Safety Workshop'), (SELECT category_id FROM category WHERE name = 'Technology')),
((SELECT project_id FROM project WHERE title = 'Video Call Setup Day'), (SELECT category_id FROM category WHERE name = 'Technology')),
((SELECT project_id FROM project WHERE title = 'Tech Q&A Drop-In'), (SELECT category_id FROM category WHERE name = 'Technology')),

-- Neighborhood Arts Collective
((SELECT project_id FROM project WHERE title = 'Community Mural Painting'), (SELECT category_id FROM category WHERE name = 'Arts and Culture')),
((SELECT project_id FROM project WHERE title = 'Youth Art Workshop'), (SELECT category_id FROM category WHERE name = 'Arts and Culture')),
((SELECT project_id FROM project WHERE title = 'Pop-Up Gallery Night'), (SELECT category_id FROM category WHERE name = 'Arts and Culture')),
((SELECT project_id FROM project WHERE title = 'Sidewalk Chalk Festival'), (SELECT category_id FROM category WHERE name = 'Arts and Culture')),
((SELECT project_id FROM project WHERE title = 'Community Sculpture Build'), (SELECT category_id FROM category WHERE name = 'Arts and Culture')),

-- Veterans Support Network
((SELECT project_id FROM project WHERE title = 'Veterans Mentorship Meetup'), (SELECT category_id FROM category WHERE name = 'Community Service')),
((SELECT project_id FROM project WHERE title = 'Veterans Resource Fair'), (SELECT category_id FROM category WHERE name = 'Community Service')),
((SELECT project_id FROM project WHERE title = 'Holiday Care Package Assembly'), (SELECT category_id FROM category WHERE name = 'Community Service')),
((SELECT project_id FROM project WHERE title = 'Job Fair for Veterans'), (SELECT category_id FROM category WHERE name = 'Community Service')),
((SELECT project_id FROM project WHERE title = 'Veterans Appreciation Breakfast'), (SELECT category_id FROM category WHERE name = 'Community Service')),

-- Clean Energy Advocates
((SELECT project_id FROM project WHERE title = 'Solar Awareness Fair'), (SELECT category_id FROM category WHERE name = 'Environmental')),
((SELECT project_id FROM project WHERE title = 'Solar Awareness Fair'), (SELECT category_id FROM category WHERE name = 'Technology')),
((SELECT project_id FROM project WHERE title = 'Home Energy Audit Workshop'), (SELECT category_id FROM category WHERE name = 'Technology')),
((SELECT project_id FROM project WHERE title = 'Renewable Energy Expo'), (SELECT category_id FROM category WHERE name = 'Technology')),
((SELECT project_id FROM project WHERE title = 'Energy Saving Tips Fair'), (SELECT category_id FROM category WHERE name = 'Environmental')),
((SELECT project_id FROM project WHERE title = 'Electric Vehicle Showcase'), (SELECT category_id FROM category WHERE name = 'Technology'));
