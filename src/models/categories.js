import db from './db.js';

const getAllCategories = async () => {
    try {
        const query = 'SELECT * FROM category';
        const result = await db.query(query);
        return result.rows;
    } catch (error) {
        console.error('Error in getAllCategories:', error.message);
        throw error;
    }
};

const getCategoryDetails = async (categoryId) => {
    try {
        const query = `
            SELECT category_id, name
            FROM category
            WHERE category_id = $1;
        `;

        const queryParams = [categoryId];
        const result = await db.query(query, queryParams);

        return result.rows.length > 0 ? result.rows[0] : null;
    } catch (error) {
        console.error('Error in getCategoryDetails:', error.message);
        throw error;
    }
};

const getProjectsByCategoryId = async (categoryId) => {
    try {
        const query = `
            SELECT
                project.project_id,
                project.title
            FROM project
            JOIN project_category ON project.project_id = project_category.project_id
            WHERE project_category.category_id = $1
            ORDER BY project.title;
        `;

        const queryParams = [categoryId];
        const result = await db.query(query, queryParams);

        return result.rows;
    } catch (error) {
        console.error('Error in getProjectsByCategoryId:', error.message);
        throw error;
    }
};

/**
 * Assigns a single category to a project in the many-to-many relationship table.
 * @param {string} categoryId - The id of the category to assign.
 * @param {string} projectId - The id of the project to assign the category to.
 */
const assignCategoryToProject = async (categoryId, projectId) => {
    const query = `
        INSERT INTO project_category (category_id, project_id)
        VALUES ($1, $2);
    `;

    await db.query(query, [categoryId, projectId]);
};

/**
 * Updates the categories assigned to a project, replacing any previous assignments.
 * @param {string} projectId - The id of the project whose categories are being updated.
 * @param {string[]} categoryIds - The array of category ids that should be assigned to the project.
 */
const updateCategoryAssignments = async (projectId, categoryIds) => {
    // First, remove existing category assignments for the project
    const deleteQuery = `
        DELETE FROM project_category
        WHERE project_id = $1;
    `;
    await db.query(deleteQuery, [projectId]);

    // Next, add the new category assignments
    for (const categoryId of categoryIds) {
        await assignCategoryToProject(categoryId, projectId);
    }
};

export { getAllCategories, getCategoryDetails, getProjectsByCategoryId, updateCategoryAssignments };
