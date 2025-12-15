# grimreach_api

The shared schema and contract library for Grimreach.

See also: [Grimreach Design & Architecture](../grimreach_docs/README.md)

## Core Responsibilities
- Defines public API surface for external agents
- Exposes deterministic endpoints for client and census
- Enforces contract boundaries and serialization
- Contains no simulation or rendering

## Architectural Role
Provides the common language (Types, Models, Messages, Protocols) spoken by all other components. It represents the "Contract" of the system. Any change here propagates to Server, Client, and Census.

## Deterministic Contract Surface
- `Protocol`: Constants for message types.
- `Message`: Generic message envelope.
- `WorldState`: Snapshot of the world.
- `Entity` / `Player`: Core data models.

## Explicit Non-Responsibilities
- No simulation logic
- No network transport implementation
- No rendering

## Folder/Layout Summary
- `lib/`: Dart source files.
  - `protocol.dart`
  - `messages.dart`
  - `world_state.dart`
  - `entity.dart`
  - `player.dart`

## Development Notes
This is a pure Dart package. It should have no dependencies on Flutter or `dart:io` if possible (though `dart:convert` is essential). Used as a local path dependency.
