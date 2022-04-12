class stadium {
    constructor(_DBQuery, _disconnect) {
        this.DBQuery = _DBQuery;
        this.disconnect = _disconnect;
    }

    close () {
        this.disconnect();
    }

    async fetchAllStadiums () {
        const results = await this.DBQuery('SELECT * FROM stadium');
        return results;
    }
}

module.exports = stadium;