class Pokemon
    attr_accessor :id, :name, :type, :hp, :db

    def initialize(props={})
        self.id = props['id']
        self.name = props['name']
        self.type = props['type']
        self.hp = props['healthp']
        self.db = props['db']
    end
    def self.save(name, type, database_connection)
        database_connection.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)",name, type) 
    end
    def self.find(id, db)
        db.results_as_hash = true
        result = db.execute("SELECT * FROM pokemon WHERE id=?",id)
        # create new instance of self class to return correct format to pass the damn test
        Pokemon.new(result[0])
    end

    def alter_hp(health, db)
        db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", health, self.id)
    end
end
