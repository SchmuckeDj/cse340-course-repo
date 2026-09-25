import db from './db.js';

const getAllProjects = async () => {
    try {
        const query = 'SELECT * FROM project';
        const result = await db.query(query);
        return result.rows;
    } catch (error) {
        console.error('Error in getAllProjects:', error.message);
        throw error;
    }
};

const getProjectsByOrganizationId = async (organizationId) => {
    try {
        const query = `
            SELECT
                project_id,
                organization_id,
                title,
                description,
                location,
                date
            FROM project
            WHERE organization_id = $1
            ORDER BY date;
        `;

        const queryParams = [organizationId];
        const result = await db.query(query, queryParams);

        return result.rows;
    } catch (error) {
        console.error('Error in getProjectsByOrganizationId:', error.message);
        throw error;
    }
};

const getUpcomingProjects = async (numberOfProjects) => {
    try {
        const query = `
            SELECT
                project.project_id,
                project.title,
                project.description,
                project.date,
                project.location,
                project.organization_id,
                organization.name AS organization_name
            FROM project
            JOIN organization ON project.organization_id = organization.organization_id
            WHERE project.date >= CURRENT_DATE
            ORDER BY project.date ASC
            LIMIT $1;
        `;

        const queryParams = [numberOfProjects];
        const result = await db.query(query, queryParams);

        return result.rows;
    } catch (error) {
        console.error('Error in getUpcomingProjects:', error.message);
        throw error;
    }
};

const getProjectDetails = async (projectId) => {
    try {
        const query = `
            SELECT
                project.project_id,
                project.title,
                project.description,
                project.date,
                project.location,
                project.organization_id,
                organization.name AS organization_name
            FROM project
            JOIN organization ON project.organization_id = organization.organization_id
            WHERE project.project_id = $1;
        `;

        const queryParams = [projectId];
        const result = await db.query(query, queryParams);

        return result.rows.length > 0 ? result.rows[0] : null;
    } catch (error) {
        console.error('Error in getProjectDetails:', error.message);
        throw error;
    }
};

const getCategoriesByProjectId = async (projectId) => {
    try {
        const query = `
            SELECT
                category.category_id,
                category.name
            FROM category
            JOIN project_category ON category.category_id = project_category.category_id
            WHERE project_category.project_id = $1
            ORDER BY category.name;
        `;

        const queryParams = [projectId];
        const result = await db.query(query, queryParams);

        return result.rows;
    } catch (error) {
        console.error('Error in getCategoriesByProjectId:', error.message);
        throw error;
    }
};

/**
 * Creates a new service project in the database.
 * @param {string} title - The title of the project.
 * @param {string} description - A description of the project.
 * @param {string} location - The location of the project.
 * @param {string} date - The date of the project.
 * @param {string} organizationId - The id of the organization the project belongs to.
 * @returns {string} The id of the newly created project record.
 */
const createProject = async (title, description, location, date, organizationId) => {
    const query = `
      INSERT INTO project (title, description, location, date, organization_id)
      VALUES ($1, $2, $3, $4, $5)
      RETURNING project_id;
    `;

    const queryParams = [title, description, location, date, organizationId];
    const result = await db.query(query, queryParams);

    if (result.rows.length === 0) {
        throw new Error('Failed to create project');
    }

    if (process.env.ENABLE_SQL_LOGGING === 'true') {
        console.log('Created new project with ID:', result.rows[0].project_id);
    }

    return result.rows[0].project_id;
};

export { getAllProjects, getProjectsByOrganizationId, getUpcomingProjects, getProjectDetails, getCategoriesByProjectId, createProject };
