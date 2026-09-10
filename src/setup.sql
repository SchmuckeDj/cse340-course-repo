CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

-- ========================================
-- Insert sample data: Organizations
-- ========================================
INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

-- ========================================
-- Table: project
-- ========================================
CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL
);

-- ========================================
-- Insert sample data: Projects
-- ========================================
INSERT INTO project (name, description)
VALUES
('Park Cleanup', 'Join us to clean up local parks and make them beautiful!'),
('Food Drive', 'Help collect and distribute food to those in need.'),
('Community Tutoring', 'Volunteer to tutor students in various subjects.');

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
('Health and Wellness');

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
((SELECT project_id FROM project WHERE name = 'Park Cleanup'), (SELECT category_id FROM category WHERE name = 'Environmental')),
((SELECT project_id FROM project WHERE name = 'Food Drive'), (SELECT category_id FROM category WHERE name = 'Community Service')),
((SELECT project_id FROM project WHERE name = 'Food Drive'), (SELECT category_id FROM category WHERE name = 'Health and Wellness')),
((SELECT project_id FROM project WHERE name = 'Community Tutoring'), (SELECT category_id FROM category WHERE name = 'Educational'));