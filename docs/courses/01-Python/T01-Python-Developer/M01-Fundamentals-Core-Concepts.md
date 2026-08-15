# Python → Python Developer → Module 01: Fundamentals & Core Concepts

## 🎯 Specialized for: Python Developer

| Property | Value |
|----------|-------|
| **Certification** | PCEP (Python Institute) |
| **Recommended Book** | Fluent Python - Luciano Ramalho |
| **Starter Project** | 🌱 API REST de tareas JWT |
| **Estimated Time** | 20 hours |

---

## 1️⃣ Introduction

**Fundamentals & Core Concepts** are the foundation for all Python developers. Understanding variables, data types, control flow, and functions is essential before building production applications.

### Why This Matters
- Real LinkedIn job postings require Python fundamentals
- PCEP certification exam tests these core concepts
- Interviews always include Python basics questions

---

## 2️⃣ Key Concepts

### 2.1 Variables & Data Types
- Dynamic typing in Python
- Immutable vs mutable types (str, int, list, dict)
- Type annotations and hints
- Memory management and garbage collection

### 2.2 Python Execution Model
- Python interpreter and bytecode
- GIL (Global Interpreter Lock)
- Scope and namespaces
- LEGB rule (Local, Enclosing, Global, Built-in)

### 2.3 Industry Application
Python developers in production environments need deep understanding of:
- How Python stores data
- Performance implications of different data types
- Memory-efficient coding patterns

---

## 3️⃣ Example Básico 🌱

For complete beginners:

```python
# Python Fundamentals - Beginner Example
# Time: 5 minutes
# Difficulty: Easy

# Variables and basic data types
name = "Alice"
age = 25
height = 5.8
is_student = True

# Lists and dictionaries
skills = ["Python", "JavaScript", "SQL"]
user_info = {
    "name": "Alice",
    "age": 25,
    "skills": skills
}

# Print results
print(f"Name: {user_info['name']}")
print(f"Skills: {', '.join(user_info['skills'])}")
```

**Key Takeaways:**
- Python uses dynamic typing
- Strings, numbers, lists, and dictionaries are core types
- F-strings make formatting easy

**Output:**
```
Name: Alice
Skills: Python, JavaScript, SQL
```

---

## 4️⃣ Example Intermedio ⚡

Real production patterns from top companies:

```python
# Python Fundamentals - Production Pattern
# Time: 15 minutes
# Difficulty: Intermediate
# Used by: Google, Spotify, Netflix

from typing import List, Dict, Optional
from dataclasses import dataclass
from enum import Enum

# Type-safe classes
class SkillLevel(Enum):
    BEGINNER = 1
    INTERMEDIATE = 2
    ADVANCED = 3

@dataclass
class Skill:
    name: str
    level: SkillLevel
    years_experience: float

@dataclass
class Developer:
    name: str
    email: str
    skills: List[Skill]
    certifications: Optional[List[str]] = None

# Usage
python_skill = Skill("Python", SkillLevel.ADVANCED, 5.0)
developer = Developer(
    name="Alice",
    email="alice@example.com",
    skills=[python_skill],
    certifications=["PCEP", "AWS"]
)

print(f"{developer.name} is {python_skill.level.name} in Python")
```

**Patterns Demonstrated:**
- Type annotations for clarity
- Dataclasses for cleaner code
- Enums for constants
- Optional types for nullable values

**When to Use:**
- Production code that multiple developers work on
- APIs and libraries
- Systems where type safety matters

---

## 5️⃣ Example Avanzado 🔥

LinkedIn job posting requirement - master this:

```python
# Production-ready fundamentals implementation
# Time: 30 minutes
# Difficulty: Advanced
# From: Real Python Developer LinkedIn postings 2026

from typing import Protocol, TypeVar, Generic, Callable
from abc import ABC, abstractmethod
import json
from pathlib import Path

# Generic protocol for data storage
T = TypeVar('T')

class Repository(Protocol[T]):
    def save(self, item: T) -> None: ...
    def load(self, id: str) -> T: ...
    def list_all(self) -> list[T]: ...

class JsonRepository(Generic[T]):
    def __init__(self, filename: str, model_class: type[T]):
        self.filename = Path(filename)
        self.model_class = model_class
        self.data: dict[str, T] = {}
        self._load_all()

    def _load_all(self):
        if self.filename.exists():
            data = json.loads(self.filename.read_text())
            self.data = {k: self.model_class(**v) for k, v in data.items()}

    def save(self, item: T) -> None:
        self.data[item.id] = item
        self._persist()

    def _persist(self):
        data = {k: vars(v) for k, v in self.data.items()}
        self.filename.write_text(json.dumps(data, indent=2))

    def list_all(self) -> list[T]:
        return list(self.data.values())

# Implementation
class User:
    def __init__(self, id: str, name: str, email: str):
        self.id = id
        self.name = name
        self.email = email

repo = JsonRepository[User]("users.json", User)
user = User("1", "Alice", "alice@example.com")
repo.save(user)
```

**Advanced Topics:**
- Generic types (TypeVar, Generic)
- Protocols for type hinting
- Decorators and metaclasses
- Context managers

**Performance Notes:**
- Type hints add no runtime overhead in Python 3.7+
- Use slots for memory optimization in data classes
- Profile before premature optimization

---

## 6️⃣ Real-world Scenario

### Situation
Your company needs to build a user management system in Python where:
- Multiple developers will work on the code
- Data must be validated
- Performance is critical
- Code must be maintainable

### Challenge
- Without proper type hints, code becomes error-prone
- Without data validation, bad data enters the system
- Without proper structure, code becomes unmaintainable

### Solution
Use Python fundamentals correctly:
1. Strong type annotations
2. Data validation with pydantic or dataclasses
3. Clear separation of concerns
4. Proper naming conventions

### Trade-offs
- **Solution A: No type hints** → Pros: Fast to write, Cons: Hard to maintain
- **Solution B: Full type hints** → Pros: Self-documenting, Cons: More verbose
- **Recommended: Pragmatic typing** → Use types where they matter (APIs, data models)

---

## 7️⃣ Best Practices

✅ **DO:**
- Use type hints for all public APIs
- Use `typing` module for complex types
- Validate user input immediately
- Use meaningful variable names (30 chars max)
- Keep functions small and focused

❌ **DON'T:**
- Use single-letter variables except in comprehensions
- Ignore type hints in production code
- Modify global state from functions
- Use mutable default arguments
- Catch bare `except:` clauses

---

## 8️⃣ Interview Questions for Python Developer

### Question 1: Type System
**Q:** What's the difference between `==` and `is` in Python?

**Expected Answer:** 
- `==` compares values
- `is` compares object identity
- Always use `==` for value comparison
- Only use `is` for None/True/False

**Why:** Tests understanding of Python's object model

---

### Question 2: Memory & GC
**Q:** Why does modifying a list in a function affect the original list, but modifying an int doesn't?

**Expected Answer:** Lists are mutable and passed by reference; ints are immutable

**Evaluation:** Shows understanding of mutable vs immutable types

---

### Question 3: Production Thinking
**Q:** How would you design a type-safe configuration system in Python?

**Expected Answer:** Use dataclasses or Pydantic with validation

---

## 9️⃣ Real LinkedIn Task

**From actual job posting:**
> Build a type-safe data validation layer that can:
> - Accept JSON input
> - Validate against a schema
> - Convert to Python objects
> - Raise clear validation errors

### Your Task
1. Create a validator class
2. Handle nested data structures
3. Provide helpful error messages
4. Support custom validation rules

### Success Criteria
- ✅ Validates JSON correctly
- ✅ Provides clear error messages
- ✅ Handles nested objects
- ✅ Type-safe throughout

---

## 🔟 Resources & References

### Official Documentation
- [Python Docs - Data Model](https://docs.python.org/3/reference/datamodel.html)
- [PEP 484 - Type Hints](https://www.python.org/dev/peps/pep-0484/)

### Recommended Readings
- Fluent Python by Luciano Ramalho
- Python Crash Course by Eric Matthes

### Code Examples
- [Real production repos on GitHub]()

---

## 1️⃣1️⃣ Practice Exercises

### Exercise 1: Type Annotations
Add type hints to a Python function and verify with mypy

### Exercise 2: Dataclass Design
Create a dataclass for a real-world entity with validation

### Exercise 3: Memory Profile
Use `memory_profiler` to understand memory usage

---

## 1️⃣2️⃣ PCEP Certification Preparation

### Topics Covered in This Module
- ✅ Variables and data types
- ✅ Operators and expressions
- ✅ Control flow
- ✅ Functions basics

**Study Resources:**
- [PCEP Official Exam Guide](https://www.python.org/dev/peps/pep-0401/)
- Practice tests on Examtopics

---

## ✨ Summary

### What You Learned
- Python's type system
- How to use type hints
- Best practices for production code
- Real-world patterns used by top companies

### Next Steps
- ✅ Complete Module 02: Best Practices & Architecture
- ✅ Build a small API project
- ✅ Review PCEP exam guide
- ✅ Practice type annotations

---

**Progress:** Module 01/12 ✅
**Time to Complete:** ~20 hours total for all modules
**Difficulty:** Beginner to Intermediate

**🎓 Status:** Ready for PCEP prep + interviews
