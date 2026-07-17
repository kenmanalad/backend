import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config'
import { PrismaModule } from './infrastructure/prisma/prisma.module';
import { LeadAcquisitionModule } from './lead_acquisition/lead/lead.module';

@Module({
  imports: [
    PrismaModule,
    LeadAcquisitionModule,
    ConfigModule.forRoot({
        isGlobal: true,
    }),
  ],
})
export class AppModule {}
