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
-- Insert sample data: Projects (one or more per organization)
-- ========================================
INSERT INTO project (organization_id, title, description, location, date)
VALUES
((SELECT organization_id FROM organization WHERE name = 'BrightFuture Builders'), 'Park Cleanup', 'Join us to clean up local parks and make them beautiful!', 'Central Park', '2026-10-12'),
((SELECT organization_id FROM organization WHERE name = 'GreenHarvest Growers'), 'Food Drive', 'Help collect and distribute food to those in need.', 'Community Center', '2026-11-03'),
((SELECT organization_id FROM organization WHERE name = 'UnityServe Volunteers'), 'Community Tutoring', 'Volunteer to tutor students in various subjects.', 'Public Library', '2026-11-20'),
((SELECT organization_id FROM organization WHERE name = 'Clean Rivers Alliance'), 'River Cleanup Day', 'Help remove trash and debris from the local riverbanks.', 'Riverside Trail', '2026-10-18'),
((SELECT organization_id FROM organization WHERE name = 'Youth Literacy Network'), 'After-School Reading Program', 'Read with elementary students to help build their literacy skills.', 'Lincoln Elementary School', '2026-10-25'),
((SELECT organization_id FROM organization WHERE name = 'Helping Hands Shelter'), 'Winter Coat Drive', 'Collect and distribute winter coats to families experiencing homelessness.', 'Downtown Shelter', '2026-12-05'),
((SELECT organization_id FROM organization WHERE name = 'Animal Rescue Coalition'), 'Shelter Volunteer Day', 'Help walk, feed, and socialize animals waiting for adoption.', 'City Animal Shelter', '2026-10-30'),
((SELECT organization_id FROM organization WHERE name = 'Senior Companion Circle'), 'Weekly Visit Program', 'Spend time visiting and assisting seniors at the community care home.', 'Sunrise Senior Living', '2026-11-08'),
((SELECT organization_id FROM organization WHERE name = 'Bike Safety Coalition'), 'Bike Safety Workshop', 'Teach elementary students the basics of safe cycling and bike maintenance.', 'Roosevelt Middle School', '2026-11-15'),
((SELECT organization_id FROM organization WHERE name = 'Community Health Partners'), 'Free Health Screening Day', 'Assist medical volunteers with free blood pressure and wellness checks.', 'Community Health Clinic', '2026-12-01'),
((SELECT organization_id FROM organization WHERE name = 'Habitat Restoration Crew'), 'Native Plant Restoration', 'Help plant native species to restore a local wildlife habitat.', 'Willow Creek Preserve', '2026-10-22'),
((SELECT organization_id FROM organization WHERE name = 'Tech for Seniors'), 'Tech Help Day', 'Assist seniors with smartphones, video calls, and online safety basics.', 'Senior Center', '2026-11-12'),
((SELECT organization_id FROM organization WHERE name = 'Neighborhood Arts Collective'), 'Community Mural Painting', 'Help paint a community mural celebrating local culture and history.', 'Fifth Street Plaza', '2026-11-29'),
((SELECT organization_id FROM organization WHERE name = 'Veterans Support Network'), 'Veterans Mentorship Meetup', 'Support local veterans through mentorship and resource navigation.', 'Veterans Hall', '2026-12-10'),
((SELECT organization_id FROM organization WHERE name = 'Clean Energy Advocates'), 'Solar Awareness Fair', 'Help staff an educational booth about renewable energy options for homeowners.', 'Town Square', '2026-12-15');

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
((SELECT project_id FROM project WHERE title = 'Park Cleanup'), (SELECT category_id FROM category WHERE name = 'Environmental')),
((SELECT project_id FROM project WHERE title = 'Food Drive'), (SELECT category_id FROM category WHERE name = 'Community Service')),
((SELECT project_id FROM project WHERE title = 'Food Drive'), (SELECT category_id FROM category WHERE name = 'Health and Wellness')),
((SELECT project_id FROM project WHERE title = 'Community Tutoring'), (SELECT category_id FROM category WHERE name = 'Educational')),
((SELECT project_id FROM project WHERE title = 'River Cleanup Day'), (SELECT category_id FROM category WHERE name = 'Environmental')),
((SELECT project_id FROM project WHERE title = 'After-School Reading Program'), (SELECT category_id FROM category WHERE name = 'Educational')),
((SELECT project_id FROM project WHERE title = 'Winter Coat Drive'), (SELECT category_id FROM category WHERE name = 'Community Service')),
((SELECT project_id FROM project WHERE title = 'Shelter Volunteer Day'), (SELECT category_id FROM category WHERE name = 'Animal Welfare')),
((SELECT project_id FROM project WHERE title = 'Weekly Visit Program'), (SELECT category_id FROM category WHERE name = 'Community Service')),
((SELECT project_id FROM project WHERE title = 'Weekly Visit Program'), (SELECT category_id FROM category WHERE name = 'Health and Wellness')),
((SELECT project_id FROM project WHERE title = 'Bike Safety Workshop'), (SELECT category_id FROM category WHERE name = 'Educational')),
((SELECT project_id FROM project WHERE title = 'Bike Safety Workshop'), (SELECT category_id FROM category WHERE name = 'Health and Wellness')),
((SELECT project_id FROM project WHERE title = 'Free Health Screening Day'), (SELECT category_id FROM category WHERE name = 'Health and Wellness')),
((SELECT project_id FROM project WHERE title = 'Native Plant Restoration'), (SELECT category_id FROM category WHERE name = 'Environmental')),
((SELECT project_id FROM project WHERE title = 'Tech Help Day'), (SELECT category_id FROM category WHERE name = 'Technology')),
((SELECT project_id FROM project WHERE title = 'Tech Help Day'), (SELECT category_id FROM category WHERE name = 'Community Service')),
((SELECT project_id FROM project WHERE title = 'Community Mural Painting'), (SELECT category_id FROM category WHERE name = 'Arts and Culture')),
((SELECT project_id FROM project WHERE title = 'Veterans Mentorship Meetup'), (SELECT category_id FROM category WHERE name = 'Community Service')),
((SELECT project_id FROM project WHERE title = 'Solar Awareness Fair'), (SELECT category_id FROM category WHERE name = 'Environmental')),
((SELECT project_id FROM project WHERE title = 'Solar Awareness Fair'), (SELECT category_id FROM category WHERE name = 'Technology'));
