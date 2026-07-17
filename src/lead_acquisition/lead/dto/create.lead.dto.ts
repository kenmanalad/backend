import {
  IsBoolean,
  IsEmail,
  IsInt,
  IsNotEmpty,
  IsOptional,
  IsString,
} from 'class-validator';

export class CreateLeadDto {
  // Lead

  @IsOptional()
  @IsString()
  projectManagerName?: string;

  @IsOptional()
  @IsInt()
  projectManagerId?: number;

  // Client

  @IsString()
  @IsNotEmpty()
  fullName!: string;

  @IsString()
  @IsNotEmpty()
  mobileNumber!: string;

  @IsString()
  @IsNotEmpty()
  preferredContact!: string;

  @IsEmail()
  @IsOptional()
  emailAddress?: string;

  // Initial Project

  @IsString()
  @IsNotEmpty()
  projectTitle!: string;

  @IsString()
  @IsNotEmpty()
  projectType!: string;

  @IsString()
  @IsNotEmpty()
  briefProjectDescription!: string;

  @IsString()
  @IsNotEmpty()
  priority!: string;

  @IsString()
  @IsNotEmpty()
  siteAddress!: string;

  @IsBoolean()
  existingStructure!: boolean;
}