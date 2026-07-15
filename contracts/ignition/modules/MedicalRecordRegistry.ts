import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("MedicalRecordRegistryModule", (m) => {
  const medicalRecordRegistry = m.contract("MedicalRecordRegistry");

  return { medicalRecordRegistry };
});