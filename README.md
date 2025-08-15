# mod_helloworld

A simple demonstration module for the Microservice framework that showcases basic module development patterns. This HelloWorld module provides a single example handler that demonstrates the fundamental aspects of the framework.

## Features

### Handler Endpoint

- **`helloworld_handler`** - Returns a simple "Hello, World!" JSON response

### Framework Demonstrations

- ✅ JSON response formatting using framework templates
- ✅ HTTP header management
- ✅ APR memory pool usage for memory safety
- ✅ Basic handler implementation patterns

## Module Structure

```
mod_helloworld/
├── README.md          # This documentation
├── Makefile           # Module build configuration
├── mod_helloworld.h   # Header with function declarations
└── mod_helloworld.c   # Implementation
```

## Installation

### Prerequisites

- Working Microservice framework installation
- Container environment (Docker) for building

### Step 1: Clone Module

If you haven't already cloned this module to your `modules/` directory:

```bash
cd modules/
git clone [your-repo-url] mod_helloworld
```

### Step 2: Auto-detect and Activate Module

The framework automatically detects all modules in the `modules/` directory. Run the load-modules command to scan and activate all available modules:

```bash
# From project root directory
make load-modules
```

This command will:
- Scan all modules in the `modules/` directory
- Automatically update the `ACTIVE_MODULES` setting in `.env`
- Regenerate the main project header (`include/[project_name].h`) with module includes

### Step 3: Build the Module

Build the module as a static library:

```bash
# Build all modules (including mod_helloworld)
make build-modules

# Or build just this module directly
cd modules/mod_helloworld
make
```

### Step 4: Integrate Handler

To use the module's handler, you need to register it in your main application file (typically `src/[project_name].c`):

```c
// In your route registration function (usually m_mg_routes())
// Add this handler registration:

// Basic hello world endpoint
m_mg_route_add("GET", "/api/helloworld", helloworld_handler);
```

### Step 5: Build and Test

Build your complete application:

```bash
# From project root
make
```

Test the endpoint:

```bash
# Test basic handler
curl http://localhost:2310/api/helloworld
```

## Expected Response

### Basic Handler (`/api/helloworld`)
```json
{
  "success": true,
  "data": "Hello, World!",
  "timestamp": "2025-01-15T10:30:00Z"
}
```

## Quick Start Summary

```bash
# 1. Place module in modules/ directory
cd modules/
git clone [repo] mod_helloworld

# 2. Auto-detect and activate module
cd ..
make load-modules

# 3. Add route handler to src/[project_name].c (see Step 4 above)

# 4. Build and run
make
make start
```