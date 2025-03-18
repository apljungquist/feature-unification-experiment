#!/usr/bin/env sh
set -eux

rm -r target/ ||:

# If target selection is used to control what is built, features are unified and the cache shared:
cargo build --workspace --bin my-crate # Compiles baz, bar, foo, my-crate
cargo build --workspace --bin your-crate # Compiles your-crate
cargo build --workspace # Compiles nothing

# Note that `--workspace` can usually be omitted if the working directory is the workspace root:
cargo build

# Note also that lib targets cannot be selected individually

# If package selection to control what is built
cargo build --package my-crate # Compiles baz, bar, foo, my-crate
cargo build --package your-crate # Compiles baz, your-crate

# Note that `--package` can usually be omitted if the working direcotry is the package root:
cd my-crate && cargo build; cd ..
cd your-crate && cargo build; cd ..

# Building with one package selection does not invalidate the cache of another:
cargo build --workspace # Compiles nothing
cargo build --package my-crate # Compiles nothing
cargo build --package your-crate # Compiles nothing
