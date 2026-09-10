import db from './db.js';

const getAllOrganizations = async () => {
    try {
        const query = 'SELECT * FROM organization';
        const result = await db.query(query);
        return result.rows;
    } catch (error) {
        console.error('Error in getAllOrganizations:', error.message);
        throw error;
    }
};

export { getAllOrganizations };
