const knex = require('../database/knex');
const PARKING_SPACE_TABLE = 'parking_space';

const fetchAllSpots = async() => {
    const query = knex(PARKING_SPACE_TABLE);
    const result = await query;
    return result;
}

const fetchSpots = async(stadium_id, lot_id, available) => {
    const query = knex(PARKING_SPACE_TABLE).where('available', available);
    const result = await query;
    return result;
}

module.exports = {
    fetchAllSpots,
    fetchSpots
}
