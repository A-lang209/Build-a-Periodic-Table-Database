# Periodic Table Database

A Bash script and PostgreSQL database that provides detailed information about chemical elements. This project was developed as part of the FreeCodeCamp Relational Database Curriculum, focusing on schema design, data normalization, and automation.

🚀 Features:

1) Custom Bash Script: element.sh allows users to query the database using an atomic number, symbol, or element name.

2) Normalized Database: Utilizes three tables (elements, properties, and types) with proper foreign key relationships and constraints.

3) Data Integrity: Implements UNIQUE and NOT NULL constraints, alongside custom PostgreSQL data types for scientific accuracy.

4) Git Workflow: Adheres to professional commit message conventions (feat:, fix:, refactor:, etc.).

🛠 Tech Stack:

1) Database: PostgreSQL

2) Scripting: Bash (Shell Scripting)

3) Version Control: Git

📋 Database Schema:

The database consists of three primary tables:

1) elements: Stores the atomic_number, symbol, and name.

2) types: Stores the distinct categories of elements (e.g., nonmetal, metal, metalloid).

3) properties: Stores physical attributes like atomic_mass, melting_point_celsius, and boiling_point_celsius, linked via foreign keys to the other tables.

💻 Usage:

To run the script, ensure you have PostgreSQL installed and the database populated. Make the script executable and pass an argument:

Bash
# Set permissions
chmod +x element.sh

# Search by Atomic Number
./element.sh 1

# Search by Symbol
./element.sh He

# Search by Name
./element.sh Lithium
#####

Example Output:

The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.

⚙️ Requirements & Logic:

1) The script handles non-existent elements with a friendly error message: I could not find that element in the database.

2) The script requires exactly one argument to run.

3) The database has been cleaned of unnecessary placeholder data (atomic number 1000) and formatted to match scientific standards (removing trailing zeros).
