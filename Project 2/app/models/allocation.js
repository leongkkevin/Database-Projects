const knex = require('../database/knex');
const ALLOCATION_TABLE = 'allocation';

const fetchAllAllocations = async() => {
    const query = knex(ALLOCATION_TABLE);
    const result = await query;
    return result;
}

const checkCar = async(body) => {
    const query = knex('car').where('license_plate', body.car);
    const result = await query;
    return result;
}

const addCar = async(body) => {
    const query = knex('car').insert({license_plate: body.car});
    const result = await query;
    return result;
}

const postAllocation = async(body) => {

    const ans = await checkCar(body);

    if(ans.length == 0){
        const insertCar = await addCar(body);
    } 

    const query = knex(ALLOCATION_TABLE).insert({parking_space: body.parking_space, car: body.car})
    const result = await query;
    return result;
}

const deleteAllocation = async(allocation_id) => {
    const query = knex(ALLOCATION_TABLE).where('id', allocation_id).del()
    const result = await query;
    return result;
}

const putAllocation = async(allocation_id, body) => {

    const ans = await checkCar(body);

    if(ans.length == 0){
        const insertCar = await addCar(body);
    } 
    
    const query = knex(ALLOCATION_TABLE).where('id', allocation_id).update({parking_space: body.parking_space, car: body.car})
    const result = await query;
    return result;
}

module.exports = {
    fetchAllAllocations,
    postAllocation,
    deleteAllocation,
    putAllocation
}