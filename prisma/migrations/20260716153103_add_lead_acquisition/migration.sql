-- CreateTable
CREATE TABLE "Lead" (
    "id" SERIAL NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" TEXT NOT NULL DEFAULT 'New',
    "projectManagerName" TEXT,
    "projectManagerId" INTEGER,

    CONSTRAINT "Lead_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Client" (
    "id" SERIAL NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "fullName" TEXT NOT NULL,
    "mobileNumber" TEXT NOT NULL,
    "preferredContact" TEXT NOT NULL,
    "emailAddress" TEXT,
    "leadId" INTEGER NOT NULL,

    CONSTRAINT "Client_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InitialProject" (
    "id" SERIAL NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "projectTitle" TEXT NOT NULL,
    "projectType" TEXT NOT NULL,
    "briefProjectDescription" TEXT NOT NULL,
    "priority" TEXT NOT NULL,
    "siteAddress" TEXT NOT NULL,
    "existingStructure" BOOLEAN NOT NULL,
    "leadId" INTEGER NOT NULL,

    CONSTRAINT "InitialProject_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ContactLog" (
    "id" SERIAL NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "salesAgentName" TEXT NOT NULL,
    "salesAgentId" INTEGER NOT NULL,
    "method" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "leadId" INTEGER NOT NULL,

    CONSTRAINT "ContactLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SiteInspection" (
    "id" SERIAL NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "engineerId" INTEGER,
    "engineerName" TEXT,
    "inspectionDate" TIMESTAMP(3),
    "scheduledTime" TIMESTAMP(3),
    "leadId" INTEGER NOT NULL,

    CONSTRAINT "SiteInspection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SiteInspectionReport" (
    "id" SERIAL NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" TEXT NOT NULL,
    "arrivalTime" TIMESTAMP(3),
    "completionTime" TIMESTAMP(3),
    "siteDescription" TEXT,
    "addressConfirmation" BOOLEAN NOT NULL,
    "siteInspectionId" INTEGER NOT NULL,

    CONSTRAINT "SiteInspectionReport_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SitePhotograph" (
    "id" SERIAL NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "name" TEXT NOT NULL,
    "photoLocation" TEXT NOT NULL,
    "siteInspectionReportId" INTEGER NOT NULL,

    CONSTRAINT "SitePhotograph_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Quotation" (
    "id" SERIAL NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "estimatorName" TEXT,
    "estimatorId" INTEGER,
    "warrantyPeriod" TEXT,
    "projectDuration" TEXT,
    "quotationValidity" TEXT,
    "leadId" INTEGER NOT NULL,

    CONSTRAINT "Quotation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "QuotationReport" (
    "id" SERIAL NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "version" INTEGER NOT NULL,
    "status" TEXT NOT NULL,
    "vat" INTEGER NOT NULL,
    "contingency" INTEGER NOT NULL,
    "markup" INTEGER NOT NULL,
    "overhead" INTEGER NOT NULL,
    "directCost" DOUBLE PRECISION,
    "totalLaborCost" DOUBLE PRECISION,
    "totalEquipmentCost" DOUBLE PRECISION,
    "totalMaterialCost" DOUBLE PRECISION,
    "totalSubContractorCost" DOUBLE PRECISION,
    "grandTotal" DOUBLE PRECISION,
    "quotationId" INTEGER NOT NULL,

    CONSTRAINT "QuotationReport_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProgressBillingSchedule" (
    "id" SERIAL NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "name" TEXT NOT NULL,
    "milestone" TEXT NOT NULL,
    "method" TEXT NOT NULL,
    "value" DOUBLE PRECISION NOT NULL,
    "remarks" TEXT,
    "quotationReportId" INTEGER NOT NULL,

    CONSTRAINT "ProgressBillingSchedule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LaborCost" (
    "id" SERIAL NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "trade" TEXT NOT NULL,
    "laborBasis" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "rate" DOUBLE PRECISION NOT NULL,
    "total" DOUBLE PRECISION NOT NULL,
    "quotationReportId" INTEGER NOT NULL,

    CONSTRAINT "LaborCost_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MaterialCost" (
    "id" SERIAL NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "materialName" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "unit" INTEGER NOT NULL,
    "unitPrice" DOUBLE PRECISION NOT NULL,
    "supplier" TEXT,
    "total" DOUBLE PRECISION NOT NULL,
    "quotationReportId" INTEGER NOT NULL,

    CONSTRAINT "MaterialCost_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EquipmentCost" (
    "id" SERIAL NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "equipmentName" TEXT NOT NULL,
    "duration" TEXT NOT NULL,
    "rate" DOUBLE PRECISION NOT NULL,
    "fuelAllowance" DOUBLE PRECISION NOT NULL,
    "isRent" BOOLEAN NOT NULL,
    "total" DOUBLE PRECISION NOT NULL,
    "quotationReportId" INTEGER NOT NULL,

    CONSTRAINT "EquipmentCost_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SubcontractorCost" (
    "id" SERIAL NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "name" TEXT NOT NULL,
    "scope" TEXT NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "total" DOUBLE PRECISION NOT NULL,
    "quotationReportId" INTEGER NOT NULL,

    CONSTRAINT "SubcontractorCost_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Scope" (
    "id" SERIAL NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "isIncluded" BOOLEAN NOT NULL,
    "remarks" TEXT,
    "quotationReportId" INTEGER NOT NULL,

    CONSTRAINT "Scope_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BillOfQuantity" (
    "id" SERIAL NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "workItem" TEXT NOT NULL,
    "workCategory" TEXT NOT NULL,
    "unit" TEXT NOT NULL,
    "unitCost" DOUBLE PRECISION NOT NULL,
    "quantity" INTEGER NOT NULL,
    "total" DOUBLE PRECISION NOT NULL,
    "quotationReportId" INTEGER NOT NULL,

    CONSTRAINT "BillOfQuantity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClientPresentationLog" (
    "id" SERIAL NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "datePresented" TIMESTAMP(3) NOT NULL,
    "salesAgentName" TEXT,
    "salesAgentId" TEXT,
    "presentationMethod" TEXT NOT NULL,
    "clientResponse" TEXT NOT NULL,
    "clientFeedback" TEXT NOT NULL,
    "leadId" INTEGER NOT NULL,

    CONSTRAINT "ClientPresentationLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Review" (
    "id" SERIAL NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "reviewStatus" TEXT NOT NULL,
    "reviewRemarks" TEXT,
    "phase" TEXT NOT NULL,
    "reportId" INTEGER NOT NULL,
    "reviewerId" INTEGER NOT NULL,
    "reviewerName" TEXT NOT NULL,
    "report_id" INTEGER NOT NULL,

    CONSTRAINT "Review_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Client_leadId_key" ON "Client"("leadId");

-- CreateIndex
CREATE UNIQUE INDEX "InitialProject_leadId_key" ON "InitialProject"("leadId");

-- CreateIndex
CREATE UNIQUE INDEX "Quotation_leadId_key" ON "Quotation"("leadId");

-- CreateIndex
CREATE UNIQUE INDEX "Review_reportId_key" ON "Review"("reportId");

-- AddForeignKey
ALTER TABLE "Client" ADD CONSTRAINT "Client_leadId_fkey" FOREIGN KEY ("leadId") REFERENCES "Lead"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InitialProject" ADD CONSTRAINT "InitialProject_leadId_fkey" FOREIGN KEY ("leadId") REFERENCES "Lead"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ContactLog" ADD CONSTRAINT "ContactLog_leadId_fkey" FOREIGN KEY ("leadId") REFERENCES "Lead"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SiteInspection" ADD CONSTRAINT "SiteInspection_leadId_fkey" FOREIGN KEY ("leadId") REFERENCES "Lead"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SiteInspectionReport" ADD CONSTRAINT "SiteInspectionReport_siteInspectionId_fkey" FOREIGN KEY ("siteInspectionId") REFERENCES "SiteInspection"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SitePhotograph" ADD CONSTRAINT "SitePhotograph_siteInspectionReportId_fkey" FOREIGN KEY ("siteInspectionReportId") REFERENCES "SiteInspectionReport"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Quotation" ADD CONSTRAINT "Quotation_leadId_fkey" FOREIGN KEY ("leadId") REFERENCES "Lead"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QuotationReport" ADD CONSTRAINT "QuotationReport_quotationId_fkey" FOREIGN KEY ("quotationId") REFERENCES "Quotation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProgressBillingSchedule" ADD CONSTRAINT "ProgressBillingSchedule_quotationReportId_fkey" FOREIGN KEY ("quotationReportId") REFERENCES "QuotationReport"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LaborCost" ADD CONSTRAINT "LaborCost_quotationReportId_fkey" FOREIGN KEY ("quotationReportId") REFERENCES "QuotationReport"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MaterialCost" ADD CONSTRAINT "MaterialCost_quotationReportId_fkey" FOREIGN KEY ("quotationReportId") REFERENCES "QuotationReport"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EquipmentCost" ADD CONSTRAINT "EquipmentCost_quotationReportId_fkey" FOREIGN KEY ("quotationReportId") REFERENCES "QuotationReport"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubcontractorCost" ADD CONSTRAINT "SubcontractorCost_quotationReportId_fkey" FOREIGN KEY ("quotationReportId") REFERENCES "QuotationReport"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Scope" ADD CONSTRAINT "Scope_quotationReportId_fkey" FOREIGN KEY ("quotationReportId") REFERENCES "QuotationReport"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BillOfQuantity" ADD CONSTRAINT "BillOfQuantity_quotationReportId_fkey" FOREIGN KEY ("quotationReportId") REFERENCES "QuotationReport"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClientPresentationLog" ADD CONSTRAINT "ClientPresentationLog_leadId_fkey" FOREIGN KEY ("leadId") REFERENCES "Lead"("id") ON DELETE CASCADE ON UPDATE CASCADE;
