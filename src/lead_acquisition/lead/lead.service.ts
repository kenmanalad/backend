import {
    ConflictException,
  Injectable,
  InternalServerErrorException,
} from '@nestjs/common';

import { PrismaService } from '../../infrastructure/prisma/prisma.service';
import { CreateLeadDto } from './dto/create.lead.dto';
import { timestamp } from 'rxjs';

@Injectable()
export class LeadAcquisitionService {
  constructor(private readonly prisma: PrismaService) {}

  async createLead(dto: CreateLeadDto) {
    try {
      return await this.prisma.$transaction(async (tx) => {
        // Create Lead

        const existingClient = await tx.client.findFirst({
            where:{
                mobileNumber: dto.mobileNumber,
            }
        });

        let clientId = existingClient?.id;

        if (!existingClient) {
            const client = await tx.client.create({
                data: {
                    fullName: dto.fullName,
                    mobileNumber: dto.mobileNumber,
                    preferredContact: dto.preferredContact,
                    emailAddress: dto.emailAddress ?? '',
                },
            });
            
            clientId = client.id;
        }

        const lead = await tx.lead.create({
          data: {
            projectManagerName: dto.projectManagerName,
            projectManagerId: dto.projectManagerId,
            clientId: clientId!
          },
        });


        const sameProject = await tx.initialProject.findFirst({
            where:{
                projectTitle: dto.projectTitle,
                siteAddress: dto.siteAddress
            }
        });

        if(sameProject){;
            throw new ConflictException("A project with the same title and site address already exists.");
        }
        
        const initialProject = await tx.initialProject.create({
          data: {
            projectTitle: dto.projectTitle,
            projectType: dto.projectType,
            briefProjectDescription:
              dto.briefProjectDescription,
            priority: dto.priority,
            siteAddress: dto.siteAddress,
            existingStructure: dto.existingStructure,
            leadId: lead.id,
          },
        });



        return {
            status: 'success',
            message: "Lead created successfully.",
            statusCode: 201,
            data: {},
            timestamp: new Date().toISOString(),
            path: 'lead/create-lead'
        };
      });
    } catch (error: any) {
      console.error(error);

      return {
            status: 'failed',
            message: error?.message ?? "Error in creating lead",
            statusCode: 500,
            data: null,
            timestamp: new Date().toISOString(),
            path: 'lead/create-lead'
        };
    }
  }
}