const knex = require('../database/knex');
const ALLOCATION_TABLE = 'allocation';

const fetchAllAllocations = async() => {
    const query = knex(ALLOCATION_TABLE);
    const result = await query;
    return result;
}

const postAllocation = async(parking_space_id, car_lp) => {
    const query = knex(ALLOCATION_TABLE).insert({parking_space: parking_space_id, car: car_lp})
    const result = await query;
    return result;
}

module.exports = {
    fetchAllAllocations,
    postAllocation
}