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

export { getAllCategories };
