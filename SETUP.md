# 🚀 Claude Flow Chatbox - Complete Setup Guide

**Date**: May 4, 2026  
**Version**: 1.0.0  
**Status**: Production Ready

---

## 📋 Table of Contents

1. [Prerequisites](#prerequisites)
2. [Local Development Setup](#local-development-setup)
3. [Project Structure](#project-structure)
4. [Environment Configuration](#environment-configuration)
5. [Running Locally](#running-locally)
6. [Testing Setup](#testing-setup)
7. [Production Deployment](#production-deployment)
8. [Troubleshooting](#troubleshooting)

---

## ✅ Prerequisites

Before starting, ensure you have:

### Required Software
- **Node.js** >= 18.0.0 ([Download](https://nodejs.org/))
- **Python** >= 3.10 ([Download](https://python.org/))
- **Git** ([Download](https://git-scm.com/))
- **Docker** (optional, for containerization) ([Download](https://docker.com/))
- **MongoDB** (local or Atlas cloud)

### Required Accounts
- **GitHub** account ([Sign up](https://github.com/))
- **Vercel** account ([Sign up](https://vercel.com/))
- **Railway** account ([Sign up](https://railway.app/))
- **MongoDB Atlas** account ([Sign up](https://mongodb.com/cloud/atlas/))
- **Anthropic API Key** ([Get here](https://console.anthropic.com/))

### Verify Installation

```bash
# Check Node.js
node --version
# Expected: v18.0.0 or higher

# Check Python
python --version
# Expected: Python 3.10 or higher

# Check Git
git --version
# Expected: git version 2.x or higher

# Check Docker (optional)
docker --version
# Expected: Docker version 20.x or higher
```

---

## 🏗️ Local Development Setup

### Step 1: Clone Repository

```bash
# Clone the repository
git clone https://github.com/harisariefkamisjelaskan/claude-flow-chatbox.git

# Navigate to project
cd claude-flow-chatbox

# Verify structure
ls -la
# Output should show: frontend/, backend/, docker/, docs/, etc.
```

### Step 2: Setup Environment Variables

```bash
# Copy environment template
cp .env.example .env

# Edit .env with your values
nano .env  # or use your favorite editor

# Required variables:
# - MONGODB_URI=mongodb+srv://user:pass@cluster.mongodb.net/claude-flow
# - ANTHROPIC_API_KEY=sk-ant-...
# - JWT_SECRET=your-super-secret-key
# - NODE_ENV=development
# - FRONTEND_URL=http://localhost:3000
```

### Step 3: Install Frontend Dependencies

```bash
# Navigate to frontend
cd frontend

# Install dependencies
npm install

# Verify installation
npm list react react-dom

# Expected output shows React 18.x installed
```

### Step 4: Install Backend Dependencies

```bash
# Navigate to backend
cd ../backend

# Install Node.js dependencies
npm install

# Install Python dependencies
cd python
pip install -r requirements.txt

# Verify installation
pip list | grep anthropic

cd ../..
```

### Step 5: Verify MongoDB Connection

```bash
# Test MongoDB connection
npm run db:test

# Expected output:
# ✅ Connected to MongoDB
# ✅ Database: claude-flow
# ✅ Collections: users, chats, messages
```

---

## 📁 Project Structure

```
claude-flow-chatbox/
│
├── frontend/                          # React App (Port 3000)
│   ├── public/
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   ├── services/
│   │   ├── hooks/
│   │   ├── styles/
│   │   └── App.tsx
│   ├── package.json
│   ├── tsconfig.json
│   ├── vite.config.ts
│   └── .env.local
│
├── backend/                           # Express + Python (Port 5000)
│   ├── src/
│   │   ├── api/
│   │   ├── services/
│   │   ├── models/
│   │   ├── agents/
│   │   ├── websocket/
│   │   ├── config/
│   │   └── app.ts
│   │
│   ├── python/                        # Python Agents
│   │   ├── agents/
│   │   ├── swarm/
│   │   ├── requirements.txt
│   │   └── main.py
│   │
│   ├── tests/
│   ├── package.json
│   ├── tsconfig.json
│   └── server.ts
│
├── mobile/                            # React Native App
│   ├── src/
│   ├── android/
│   ├── ios/
│   ├── package.json
│   └── app.json
│
├── docker/                            # Docker Configuration
│   ├── Dockerfile.frontend
│   ├── Dockerfile.backend
│   ├── docker-compose.yml
│   └── .dockerignore
│
├── deployment/                        # Deployment Config
│   ├── vercel.json                    # Vercel frontend
│   ├── railway.json                   # Railway backend
│   └── github/
│       └── workflows/
│           ├── test.yml
│           ├── deploy.yml
│           └── release.yml
│
├── docs/                              # Documentation
│   ├── README.md
│   ├── SETUP.md                       # ← You are here
│   ├── API.md
│   ├── ARCHITECTURE.md
│   ├── DEPLOYMENT.md
│   └── TROUBLESHOOTING.md
│
├── tests/                             # Testing
│   ├── unit/
│   ├── integration/
│   └── e2e/
│
├── scripts/                           # Utility Scripts
│   ├── setup.sh
│   ├── dev.sh
│   ├── build.sh
│   ├── test.sh
│   └── deploy.sh
│
├── .env.example
├── .gitignore
├── docker-compose.yml
├── package.json                       # Root package.json
└── README.md
```

---

## ⚙️ Environment Configuration

### .env.example Template

```bash
# ============================================
# FRONTEND CONFIGURATION
# ============================================
REACT_APP_API_URL=http://localhost:5000
REACT_APP_WEBSOCKET_URL=ws://localhost:5000
REACT_APP_NAME=Claude Flow Chatbox
REACT_APP_VERSION=1.0.0

# ============================================
# BACKEND CONFIGURATION
# ============================================
NODE_ENV=development
PORT=5000
DEBUG=*

# ============================================
# DATABASE CONFIGURATION
# ============================================
MONGODB_URI=mongodb+srv://user:password@cluster.mongodb.net/claude-flow
MONGODB_DB_NAME=claude-flow

# ============================================
# AUTHENTICATION
# ============================================
JWT_SECRET=your-super-secret-jwt-key-change-this-in-production
JWT_EXPIRES_IN=7d
REFRESH_TOKEN_EXPIRES_IN=30d

# ============================================
# AI & AGENTS
# ============================================
ANTHROPIC_API_KEY=sk-ant-YOUR-API-KEY-HERE
ANTHROPIC_MODEL=claude-3-sonnet-20240229
MAX_AGENTS=5
AGENT_TIMEOUT=30000

# ============================================
# SECURITY
# ============================================
CORS_ORIGIN=http://localhost:3000
RATE_LIMIT_WINDOW=15
RATE_LIMIT_MAX_REQUESTS=100

# ============================================
# LOGGING
# ============================================
LOG_LEVEL=debug
LOG_FORMAT=json

# ============================================
# EMAIL (Optional)
# ============================================
SENDGRID_API_KEY=sg-YOUR-KEY-HERE
SENDGRID_FROM_EMAIL=noreply@claude-flow.app

# ============================================
# HOSTING (For Production)
# ============================================
VERCEL_PROJECT_NAME=claude-flow-chatbox
RAILWAY_SERVICE_NAME=claude-flow-backend
```

---

## 🚀 Running Locally

### Option 1: Using npm (Recommended for Development)

```bash
# Terminal 1 - Backend
cd backend
npm install
npm run dev

# Expected output:
# ✅ Backend running on http://localhost:5000
# ✅ WebSocket server ready
# ✅ Connected to MongoDB

# Terminal 2 - Frontend
cd frontend
npm install
npm run dev

# Expected output:
# ✅ Frontend running on http://localhost:3000
# ✅ Hot reload enabled

# Terminal 3 - Python Agents (Optional)
cd backend/python
python -m pip install -r requirements.txt
python main.py

# Expected output:
# ✅ Python agents started
# ✅ Available agents: analyzer, coder, tester, reviewer, executor
```

### Option 2: Using Docker (Recommended for Production-like Environment)

```bash
# Build and start all services
docker-compose up -d

# Expected output:
# Creating claude-flow-mongo ... done
# Creating claude-flow-backend ... done
# Creating claude-flow-frontend ... done
# Creating claude-flow-python-agents ... done

# Check running containers
docker ps

# View logs
docker-compose logs -f backend

# Stop services
docker-compose down
```

### Option 3: Using Provided Scripts

```bash
# Give execute permission
chmod +x scripts/*.sh

# Run everything
./scripts/dev.sh

# Expected output:
# 🚀 Starting Claude Flow development environment...
# ✅ Frontend: http://localhost:3000
# ✅ Backend: http://localhost:5000
# ✅ Python agents: Ready
```

---

## Access the Application

After setup is complete:

1. **Frontend**: Open browser and go to `http://localhost:3000`
2. **API**: Access backend at `http://localhost:5000`
3. **API Docs**: Go to `http://localhost:5000/api/docs` (Swagger UI)

### Test the Chatbox

```bash
# Test health check
curl http://localhost:5000/health

# Expected output:
# {"status":"ok","timestamp":"2026-05-04T...","uptime":"1234s"}

# Test chat endpoint (requires authentication)
curl -X POST http://localhost:5000/api/chat/send \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -d '{"message":"Hello, Claude Flow!"}'

# Expected output:
# {
#   "reply": "Hello! I am Claude Flow Chatbox...",
#   "agentsUsed": ["analyzer"],
#   "processingTime": 2.3
# }
```

---

## 🧪 Testing Setup

### Run All Tests

```bash
# Backend tests
cd backend
npm run test

# Frontend tests
cd ../frontend
npm run test

# Python agent tests
cd ../backend/python
pytest tests/

# Integration tests
cd ../..
npm run test:integration

# E2E tests
npm run test:e2e
```

### Test Coverage Report

```bash
# Generate coverage report
npm run test:coverage

# View coverage in browser
open coverage/index.html

# Expected: >80% code coverage
```

---

## 🌐 Production Deployment

### Step 1: Deploy Frontend to Vercel

```bash
# Install Vercel CLI
npm install -g vercel

# Login to Vercel
vercel login

# Deploy
cd frontend
vercel

# Follow prompts:
# - Project name: claude-flow-frontend
# - Framework: Vite
# - Build command: npm run build
# - Output directory: dist

# Expected output:
# ✅ Production: https://claude-flow-frontend.vercel.app
```

### Step 2: Deploy Backend to Railway

```bash
# Install Railway CLI
npm install -g @railway/cli

# Login to Railway
railway login

# Initialize project
railway init

# Set environment variables in Railway dashboard:
# - MONGODB_URI
# - ANTHROPIC_API_KEY
# - JWT_SECRET
# - NODE_ENV=production

# Deploy
railway up

# Expected output:
# ✅ Backend deployed to Railway
# ✅ URL: https://claude-flow-backend.railway.app
```

### Step 3: Configure Environment Variables

```bash
# Update frontend .env for production
# backend/src/config/env.ts
REACT_APP_API_URL=https://claude-flow-backend.railway.app
REACT_APP_WEBSOCKET_URL=wss://claude-flow-backend.railway.app

# Redeploy frontend
vercel --prod
```

### Step 4: Verify Deployment

```bash
# Test production endpoints
curl https://claude-flow-backend.railway.app/health

# Should respond:
# {"status":"ok","environment":"production"}

# Test HTTPS/SSL
curl -I https://claude-flow-frontend.vercel.app
# Should show: HTTP/2 200
```

---

## 📱 Mobile App Setup

### React Native Installation

```bash
# Install Expo CLI (easiest way)
npm install -g expo-cli

# Create new project
expo init claude-flow-mobile

# Install dependencies
cd claude-flow-mobile
npm install

# Link to backend
# Update src/services/api.ts with production URL

# Run on iOS simulator
npm run ios

# Run on Android emulator
npm run android

# Build for production
eas build --platform all
```

---

## ✅ Verification Checklist

- [ ] Node.js and Python installed
- [ ] MongoDB connected (local or Atlas)
- [ ] Environment variables configured
- [ ] Frontend runs at http://localhost:3000
- [ ] Backend runs at http://localhost:5000
- [ ] Python agents start successfully
- [ ] Docker containers build without errors
- [ ] All tests pass (>80% coverage)
- [ ] Frontend deployed to Vercel
- [ ] Backend deployed to Railway
- [ ] Production URLs accessible
- [ ] HTTPS working on both deployments
- [ ] WebSocket connection established
- [ ] Mobile app builds successfully

---

## 🆘 Troubleshooting

### Common Issues & Solutions

#### Issue: Port 3000 or 5000 already in use

```bash
# Find process using port 3000
lsof -i :3000

# Kill process
kill -9 <PID>

# Or use different port
PORT=3001 npm run dev
```

#### Issue: MongoDB connection failed

```bash
# Check connection string
echo $MONGODB_URI

# Test connection
mongosh "mongodb+srv://user:pass@cluster.mongodb.net/claude-flow"

# If using local MongoDB:
brew services start mongodb-community
```

#### Issue: Python agents not starting

```bash
# Check Python version
python --version  # Should be 3.10+

# Reinstall dependencies
cd backend/python
pip install --upgrade -r requirements.txt

# Test agents
python -c "from agents.analyzer import AnalyzerAgent; print('OK')"
```

#### Issue: Docker build fails

```bash
# Clear Docker cache
docker system prune -a

# Rebuild
docker-compose build --no-cache

# Check logs
docker-compose logs backend
```

#### Issue: Tests failing

```bash
# Update dependencies
npm install

# Clear Jest cache
npm run test -- --clearCache

# Run tests in verbose mode
npm run test -- --verbose
```

---

## 📞 Support

For more help:
- 📖 Check [README.md](README.md)
- 📚 Read [API.md](API.md)
- 🏗️ Review [ARCHITECTURE.md](ARCHITECTURE.md)
- 🚀 See [DEPLOYMENT.md](DEPLOYMENT.md)
- 💬 Open issue on GitHub

---

**Version**: 1.0.0  
**Last Updated**: May 4, 2026  
**Maintained by**: harisariefkamisjelaskan
