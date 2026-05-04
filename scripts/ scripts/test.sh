#!/bin/bash

echo "🧪 Running all tests"
echo "===================="
echo ""

# Backend tests
echo "📡 Running backend tests..."
cd backend
npm run test -- --coverage
BACKEND_EXIT=$?

# Frontend tests
echo ""
echo "🎨 Running frontend tests..."
cd ../frontend
npm run test -- --coverage
FRONTEND_EXIT=$?

# Python tests
echo ""
echo "🤖 Running Python tests..."
cd ../backend/python
pytest tests/ --cov=agents --cov-report=html
PYTHON_EXIT=$?

# Summary
echo ""
echo "✅ Test Summary"
echo "==============="
echo "Backend:  $([ $BACKEND_EXIT -eq 0 ] && echo '✅ PASSED' || echo '❌ FAILED')"
echo "Frontend: $([ $FRONTEND_EXIT -eq 0 ] && echo '✅ PASSED' || echo '❌ FAILED')"
echo "Python:   $([ $PYTHON_EXIT -eq 0 ] && echo '✅ PASSED' || echo '❌ FAILED')"

if [ $BACKEND_EXIT -eq 0 ] && [ $FRONTEND_EXIT -eq 0 ] && [ $PYTHON_EXIT -eq 0 ]; then
    echo ""
    echo "🎉 All tests passed!"
    exit 0
else
    echo ""
    echo "⚠️  Some tests failed"
    exit 1
fi
