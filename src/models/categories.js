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

export { getAllCategories, getCategoryDetails, getProjectsByCategoryId };
