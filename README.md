# postgres-database-migration

A migration process related scripts

You will find a various of SQL scripts regarding to create a sample database, define the defaul values like PK and FK notations. Finally the most common `view`, `function`, `procedure` samples.

The source code includes a `/data-correction` folder which has test-case sctipts for each table. The scripts has been inspired by [pgTAB project](https://pgtap.org/). The `pgTAB` project provides TDD (test driven development) approch to the PostgreSQL.

The `/testing-helpers` folder (within `/data-correction`) will include a test-case template to make easy adapation to provide test case for any other table.

#### Database info
- Target Server: PostgreSQL
- Server Version: 10

#### Project structure
- /data-correction: Includes test cases for each tablet to be run during migration process. 
    - /testing-helpers: Required testing-helper functions, etc. 
- /functions: Includes all functiones within the database.
- /procedures: Includes all procedures within the database.
- /table: Includes all tables within the database.
- /view: Includes all viewss within the database.

---

#### ![Diagram](media/db_ER_diagram.png) 
<sub><sup>[Diagram credit](https://www.postgresqltutorial.com/postgresql-sample-database/)</sup></sub>
