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

export { getAllProjects };
