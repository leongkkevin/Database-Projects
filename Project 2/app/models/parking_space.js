const knex = require('../database/knex');
const PARKING_SPACE_TABLE = 'parking_space';

const fetchAllSpots = async() => {
    const query = knex(PARKING_SPACE_TABLE);
    const result = await query;
    return result;
}

const fetchSpots = async(stadium_id, lot_id, available) => {
    const query = knex(PARKING_SPACE_TABLE)
    if(stadium_id != null){
        query
        .join('parking_lot', 'parking_space.lot', '=', 'parking_lot.name')
        .where(parking_lot.stadium, stadium_id);
    }
    if(lot_id != null){
        query
        .where('lot', lot_id);
    }
    if(available != null){
        query
        .where('available', available);
    }
    const result = await query;
    return result;
}

module.exports = {
    fetchAllSpots,
    fetchSpots
}
