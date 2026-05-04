import pytest
from agents.analyzer import AnalyzerAgent
from agents.coder import CoderAgent
from swarm.orchestrator import SwarmOrchestrator

@pytest.fixture
def analyzer():
    return AnalyzerAgent()

@pytest.fixture
def coder():
    return CoderAgent()

@pytest.mark.asyncio
async def test_analyzer_agent(analyzer):
    """Test analyzer agent execution"""
    result = await analyzer.execute("What is the impact of AI?")
    
    assert result is not None
    assert 'output' in result
    assert result['role'] == 'analyzer'
    assert 'tokens_used' in result

@pytest.mark.asyncio
async def test_coder_agent(coder):
    """Test coder agent execution"""
    result = await coder.execute("Generate a Hello World function in Python")
    
    assert result is not None
    assert 'output' in result
    assert 'def ' in result['output']
    assert result['role'] == 'coder'

@pytest.mark.asyncio
async def test_swarm_orchestration():
    """Test swarm orchestration"""
    agents = [AnalyzerAgent(), CoderAgent()]
    orchestrator = SwarmOrchestrator(agents)
    
    result = await orchestrator.execute_parallel("Build a REST API")
    
    assert result is not None
    assert 'results' in result
    assert 'consensus' in result
    assert len(result['results']) == len(agents)
