const knex = require('../database/knex');
const ALLOCATION_TABLE = 'allocation';

const fetchAllAllocations = async() => {
    const query = knex(ALLOCATION_TABLE);
    const result = await query;
    return result;
}

const postAllocation = async(body) => {

    // const checkCar = knex('car').where('license_plate', body.car).count('license_plate').then(function(carCount){
    //     carCnt = carCount[0].CNT
    // });

    // if(checkCar == 0){
    //     const addCar = knex('car').insert({license_plate: body.car})
    //     const resultCar = await addCar;
    //     console.log("DSDF" + addCar)
    // } 

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