const prismaModule = require('@prisma/client');

console.log(prismaModule);
console.log("PrismaClient type:", typeof prismaModule.PrismaClient);

try {
  const prisma = new prismaModule.PrismaClient();
  console.log("Created:", prisma);
} catch (e) {
  console.error(e);
}