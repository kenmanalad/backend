import {
  Body,
  Controller,
  HttpCode,
  HttpStatus,
  Post,
} from '@nestjs/common';

import { CreateLeadDto } from './dto/create.lead.dto';
import { LeadAcquisitionService } from './lead.service';

@Controller('lead-acquisition')
export class LeadAcquisitionController {
  constructor(
    private readonly leadAcquisitionService: LeadAcquisitionService,
  ) {}

  @Post('leads/add-lead')
  @HttpCode(HttpStatus.CREATED)
  async createLead(
    @Body() createLeadDto: CreateLeadDto,
  ) {
    return this.leadAcquisitionService.createLead(createLeadDto);
  }
}