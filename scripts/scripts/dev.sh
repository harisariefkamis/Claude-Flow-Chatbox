#!/bin/bash

echo "🚀 Starting Claude Flow development environment"
echo "==============================================="
echo ""

# Kill any previous processes
pkill -f "node.*backend" || true
pkill -f "python.*main.py" || true

# Start backend
echo "📡 Starting backend on port 5000..."
cd backend
npm run dev &
BACKEND_PID=$!

# Start frontend
echo "🎨 Starting frontend on port 3000..."
cd ../frontend
npm run dev &
FRONTEND_PID=$!

# Start Python agents
echo "🤖 Starting Python agents..."
cd ../backend/python
python main.py &
PYTHON_PID=$!

echo ""
echo "✅ All services started!"
echo ""
echo "Services running:"
echo "  Frontend:   http://localhost:3000"
echo "  Backend:    http://localhost:5000"
echo "  API Docs:   http://localhost:5000/api/docs"
echo ""
echo "Press Ctrl+C to stop all services"
echo ""

# Wait for interrupt
trap "kill $BACKEND_PID $FRONTEND_PID $PYTHON_PID; echo ''; echo '👋 All services stopped'; exit" INT
wait
