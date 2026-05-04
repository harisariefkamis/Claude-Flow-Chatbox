#!/bin/bash

set -e

echo "🚀 Claude Flow Chatbox - Initial Setup"
echo "========================================"
echo ""

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Step 1: Check prerequisites
echo -e "${BLUE}Step 1: Checking prerequisites...${NC}"
node_version=$(node -v)
python_version=$(python --version 2>&1)

if command -v node &> /dev/null; then
    echo -e "${GREEN}✅ Node.js: $node_version${NC}"
else
    echo "❌ Node.js not found. Please install Node.js >= 18.0.0"
    exit 1
fi

if command -v python &> /dev/null; then
    echo -e "${GREEN}✅ Python: $python_version${NC}"
else
    echo "❌ Python not found. Please install Python >= 3.10"
    exit 1
fi

echo ""

# Step 2: Setup environment
echo -e "${BLUE}Step 2: Setting up environment variables...${NC}"
if [ ! -f .env ]; then
    cp .env.example .env
    echo -e "${GREEN}✅ Created .env file${NC}"
    echo "⚠️  Please edit .env with your values"
else
    echo -e "${GREEN}✅ .env already exists${NC}"
fi

echo ""

# Step 3: Install frontend dependencies
echo -e "${BLUE}Step 3: Installing frontend dependencies...${NC}"
cd frontend
npm install
echo -e "${GREEN}✅ Frontend dependencies installed${NC}"
cd ..

echo ""

# Step 4: Install backend dependencies
echo -e "${BLUE}Step 4: Installing backend dependencies...${NC}"
cd backend
npm install
echo -e "${GREEN}✅ Backend dependencies installed${NC}"

cd python
pip install -r requirements.txt
echo -e "${GREEN}✅ Python dependencies installed${NC}"
cd ../..

echo ""

# Step 5: Create necessary directories
echo -e "${BLUE}Step 5: Creating directories...${NC}"
mkdir -p logs
mkdir -p data
mkdir -p uploads
echo -e "${GREEN}✅ Directories created${NC}"

echo ""
echo -e "${GREEN}✅ Setup complete!${NC}"
echo ""
echo "Next steps:"
echo "1. Edit .env with your configuration"
echo "2. Run: npm run dev"
echo "3. Visit: http://localhost:3000"
echo ""
