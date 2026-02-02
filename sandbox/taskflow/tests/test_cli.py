"""Tests pour TaskFlow CLI - Respect de TDD Iron Law"""
import sys
sys.path.insert(0, '/home/node/.openclaw/workspace/projects/lab/lab23/sandbox/taskflow/src')

import pytest
from taskflow.cli import add_task, list_tasks

class TestAddTask:
    """Tests pour add_task - existant"""
    
    def test_add_task_returns_dict(self):
        result = add_task("Test task")
        assert isinstance(result, dict)
        
    def test_add_task_has_title(self):
        result = add_task("My task")
        assert result["title"] == "My task"


class TestListTasks:
    """Tests pour list_tasks - NOUVELLE FEATURE écrite en TDD"""
    
    def test_list_tasks_returns_list(self):
        """RED: Ce test va échouer car list_tasks n'existe pas encore"""
        result = list_tasks()
        assert isinstance(result, list)
        
    def test_list_tasks_empty_initially(self):
        result = list_tasks()
        assert len(result) == 0
