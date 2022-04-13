const knex = require('../database/knex');
const PARKING_LOT_TABLE = 'parking_lot';

const fetchAllStadiumSpots = async(stadium_name) => {
    const query = knex(PARKING_LOT_TABLE).where({ stadium_name });
    const result = await query;
    return result;
}

const fetchAllLots = async() => {
    const query = knex(PARKING_LOT_TABLE);
    const result = await query;
    return result;
}

module.exports = {
    fetchAllStadiumSpots,
    fetchAllLots
}