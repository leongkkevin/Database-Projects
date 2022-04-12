class allocation {
    constructor(_DBQuery, _disconnect) {
        this.DBQuery = _DBQuery;
        this.disconnect = _disconnect;
    }

    close () {
        this.disconnect();
    }

    async fetchAllAllocations () {
        const results = await this.DBQuery('SELECT * FROM allocation');
        return results;
    }
}

module.exports = allocation;