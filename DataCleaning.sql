-- Capitalize Symbols (First letter only)
UPDATE elements SET symbol = INITCAP(symbol);

-- Remove trailing zeros and set type to DECIMAL
ALTER TABLE properties ALTER COLUMN atomic_mass SET DATA TYPE DECIMAL;
UPDATE properties SET atomic_mass = atomic_mass::REAL;

-- Delete non-existent element 1000
DELETE FROM properties WHERE atomic_number = 1000;
DELETE FROM elements WHERE atomic_number = 1000;

-- Add Fluorine (9) and Neon (10)
-- Note: Check your type_id for 'nonmetal' first. Usually, it's 3 or 2.
INSERT INTO elements(atomic_number, symbol, name) VALUES(9, 'F', 'Fluorine'), (10, 'Ne', 'Neon');
INSERT INTO properties(atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) 
VALUES(9, 18.998, -220, -188.1, (SELECT type_id FROM types WHERE type='nonmetal')),
      (10, 20.18, -248.6, -246.1, (SELECT type_id FROM types WHERE type='nonmetal'));
