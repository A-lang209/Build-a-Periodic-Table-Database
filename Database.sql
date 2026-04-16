-- Rename columns in properties
ALTER TABLE properties RENAME COLUMN weight TO atomic_mass;
ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;
ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;

-- Add NOT NULL and UNIQUE constraints
ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;
ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;
ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;
ALTER TABLE elements ALTER COLUMN name SET NOT NULL;
ALTER TABLE elements ADD UNIQUE(symbol);
ALTER TABLE elements ADD UNIQUE(name);

-- Set up Foreign Key for atomic_number
ALTER TABLE properties ADD FOREIGN KEY (atomic_number) REFERENCES elements(atomic_number);

-- Create types table and populate it
CREATE TABLE types(type_id SERIAL PRIMARY KEY, type VARCHAR NOT NULL);
INSERT INTO types(type) SELECT DISTINCT(type) FROM properties;

-- Link properties to types
ALTER TABLE properties ADD COLUMN type_id INT;
UPDATE properties SET type_id = (SELECT type_id FROM types WHERE types.type = properties.type);
ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;
ALTER TABLE properties ADD FOREIGN KEY (type_id) REFERENCES types(type_id);

-- Final cleanup: remove old type column
ALTER TABLE properties DROP COLUMN type;
