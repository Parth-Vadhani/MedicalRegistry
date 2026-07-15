# 🏥 MedVault - Privacy-Preserving Medical Record Registry

MedVault is a blockchain-based medical record registry built on **Avalanche** that enables patients to securely manage and share their medical records while maintaining complete control over who can access them.

The project leverages Avalanche's fast, low-cost infrastructure to provide a secure, transparent, and permission-based healthcare record management system.

---

## 🚀 Problem Statement

Medical records are often stored across multiple hospitals and healthcare providers, making them difficult to access, verify, and share securely.

Current systems suffer from:

- Fragmented patient data
- Lack of patient ownership
- Unauthorized data access
- Risk of record tampering
- Poor interoperability between hospitals

---

## 💡 Solution

MedVault stores only the **cryptographic hash** and metadata of medical records on the Avalanche blockchain while keeping the actual encrypted medical files off-chain.

Patients remain the owners of their medical records and can grant or revoke access to doctors whenever needed.

---

## ✨ Features

### 👤 Patient

- Register using MetaMask
- Upload medical records
- View personal medical records
- Grant doctor access
- Revoke doctor access

### 👨‍⚕️ Doctor

- Request access to patient records
- View records only after approval

### 🔐 Security

- Permission-based access control
- Immutable blockchain audit trail
- Medical files stored encrypted off-chain
- Hash verification for data integrity

---

## 🛠 Tech Stack

### Blockchain

- Avalanche Fuji Testnet
- Solidity
- Hardhat
- Ethers.js

### Frontend

- React
- TypeScript
- Vite
- Tailwind CSS

### Backend

- Node.js
- Express.js
- Multer
- Dotenv

### Wallet

- MetaMask

---

## 📂 Project Structure

```
MedVault/
│
├── frontend/
│   ├── src/
│   ├── public/
│   └── package.json
│
├── backend/
│   ├── routes/
│   ├── controllers/
│   ├── uploads/
│   ├── services/
│   └── package.json
│
├── contracts/
│   ├── contracts/
│   │   └── MedicalRecordRegistry.sol
│   ├── ignition/
│   ├── scripts/
│   └── hardhat.config.ts
│
├── docs/
├── assets/
└── README.md
```

---

## ⚙️ Installation

### Clone Repository

```bash
git clone https://github.com/yourusername/MedVault.git
```

```bash
cd MedVault
```

---

### Install Frontend

```bash
cd frontend
npm install
```

---

### Install Backend

```bash
cd backend
npm install
```

---

### Install Smart Contract Dependencies

```bash
cd contracts
npm install
```

---

## 🔨 Compile Smart Contracts

```bash
npx hardhat compile
```

---

## 🚀 Deploy Smart Contract

```bash
npx hardhat ignition deploy ignition/modules/MedicalRecordRegistry.ts --network fuji
```

---

## 🔐 Environment Variables

Create a `.env` file inside the `contracts` folder.

```
PRIVATE_KEY=YOUR_PRIVATE_KEY
FUJI_RPC_URL=https://api.avax-test.network/ext/bc/C/rpc
```

---

## 🔄 Workflow

```
Patient Connects Wallet
        │
        ▼
Registers
        │
        ▼
Uploads Medical Record
        │
        ▼
Backend Encrypts File
        │
        ▼
Generates File Hash
        │
        ▼
Hash Stored on Avalanche
        │
        ▼
Doctor Requests Access
        │
        ▼
Patient Approves
        │
        ▼
Doctor Views Record
```

---

## 📜 Smart Contract

Current smart contract functionality includes:

- Patient Registration
- Medical Record Storage
- Record Hash Verification
- Permission Management
- Grant Access
- Revoke Access

---

## 🔒 Privacy

To protect sensitive healthcare data:

- Medical records are **not stored on-chain**
- Only encrypted metadata and hashes are stored
- Patients control access permissions
- Blockchain provides immutable audit logs

---

## 🌟 Future Enhancements

- Private Avalanche L1
- eERC Integration
- IPFS Storage
- AI Medical Report Analysis
- QR Code Based Record Sharing
- Hospital Dashboard
- Insurance Integration
- Emergency Access Protocol

---

## 👨‍💻 Team

**Team Name:** Team1 India SpeedRun

### Members

- Parth Vadhani

---

## 📄 License

This project is licensed under the MIT License.

---

## 🙏 Acknowledgements

- Avalanche
- Ava Labs
- Team1 India SpeedRun Hackathon
- Hardhat
- OpenZeppelin
- MetaMask
