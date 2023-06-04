# Server Actions Demonstration
This project demonstrates  Get and Post methods to a PostgreSQL database using Next.js 13's server actions, using Prisma as an ORM.

## Installation Setup

- _**Installing Next.js 13.4:**_
    - In your terminal, run ```npx create-next-app@latest``` to install the latest version of Next.js
       - TypeScript: yes
        - Tailwind CSS: yes
        - ES Lint: yes
        - SRC Directory: yes
        - App Router: yes

- _**Installing Prisma:**_
    - In your terminal run ```npm install typescript ts-node @types/node --save-dev```
    - Run ```npm install prisma --save-dev```
    - Run ```npm i @prisma/client```
    - Finally, install the Prisma CLI as a development dependency in the project. ```npx prisma init```

    - After those commands are completed, you should have a "prisma" folder at the root level of the directory.  Inside of the "prisma" folder you will have a file named "schema.prisma"
        - An .env file should have also been created when prisma was installed.

- _**Provisioning PostgreSQL through Railway:**_
    - Go to https://railway.app/ and create an account for free.  (You get up to 500 hours of DB run time per month for free).  
    - Click on "Dashboard" once signed in and then "+ new project." Select "provision PostgreSQL Database" and then go to "connect" to get your DATABASE_URL.
    - Now copy and paste your secret DATABASE_URL into your .env file as ```DATABASE_URL="YOUR SECRET EXAMPLE_DB_URL"```
**Go into your your "gitignore" file and scroll own to "# LOCAL env files" and add ".env" to avoid posting your DATABASE_URL to your own public repository.**
```
# local env files
.env*.local
.env
```

_Run "prisma db pull" to turn your database scheme into a Prisma schema_
 
## Prisma Schema Setup
_schema.prisma file_
 - We are adding the TODO model to have all of our information about the Todo items.
```
model Todo {
  id String @id @default(uuid())
  title String
  complete Boolean
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
}
```
- To push the Todo model to the database, in the CLI run ```npx prisma migrate```

**Using Prisma inside of your project:**
- _Create a file inside of the src directory called **"db.ts"** and add the following code._
```
import { PrismaClient } from '@prisma/client'

const globalForPrisma = global as unknown as {
  prisma: PrismaClient | undefined
}

export const prisma =
  globalForPrisma.prisma ??
  new PrismaClient({
    log: ['query'],
  })

if (process.env.NODE_ENV !== 'production') globalForPrisma.prisma = prisma
```

## Creating a Route
- Inside of the "app" directory, create a folder called "new".  This will be our first route for our todo list for us to create a new Todo. Inside of the "new" folder, create a **_page.tsx_** file.  Everything added the page.tsx file will route to the /new route.  We will be creating a new Todo inside of this route.
 _example: http://localhost:3000/new_
![App Screenshot](/Users/lawrencemarkel/route-tracker/screenshots/newRoute.png)

