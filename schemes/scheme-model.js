const db = require('../db-config.js');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
}

function find() {
    return db('schemes');
}

function findById(id) {
    return db('schemes').where({ id });
}

function findSteps(id) {
    return db('steps')
        .join(
            'schemes',
            'steps.scheme_id', '=', 'schemes.id'
        )
        .select(
            'steps.id',
            'steps.instructions',
            'schemes.scheme_name',
            'steps.step_number'
        )
        .where({
            scheme_id: id
        });
}

function add(scheme) {
    return db('schemes').insert(scheme);
}

function update(changes, id) {
    return db('schemes')
        .where({ id })
        .update(changes);
}

function remove(id) {
    return db('schemes')
        .where({id})
        .del()
}