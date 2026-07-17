import { Module } from '@nestjs/common';

import { PrismaModule } from '../../infrastructure/prisma/prisma.module';
import { LeadAcquisitionService } from './lead.service';
import { LeadAcquisitionController } from './lead.controller';

@Module({
  imports: [PrismaModule],
  controllers: [LeadAcquisitionController],
  providers: [LeadAcquisitionService],
  exports: [LeadAcquisitionService],
})
export class LeadAcquisitionModule {}