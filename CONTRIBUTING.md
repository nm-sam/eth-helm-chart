# Contributing

The Nethermind infrastructure team is responsible for maintaining the Nethermind Helm charts. We welcome contributions from the community and are happy to review and merge pull requests. This document outlines the process for contributing to the Nethermind Helm charts.

## Before you begin

When contributing to this repository, please first discuss the change you wish to make via issue, email, or any other method with the owners of this repository before making a change.

## Pre-requisites

- Helm
- Pre-commit - <https://pre-commit.com/>
- Docker

## Pull Request Process

1. Create a new branch from `main`.
2. Make changes to a single chart in the `charts/` directory only (CI will fail if you try to update more than one chart).
3. Update the chart version in the `Chart.yaml` file, along with any other changes you want to make. Mind the [semantic versioning](https://semver.org/) rules.
4. Run `make pre-commit` to run the pre-commit hooks.
5. Push your changes and create a pull request. The pull request should include a description of the changes made and the reason for the changes. The pull request title must follow the `[<chart-name>] <short-description>` format.
6. The pull request will be reviewed by the maintainers. If the pull request is approved, it will be merged into the `main` branch and new chart version will be released with tag `<chart-name>-<chart-version>`.

> [!NOTE]
> Documentation is automatically generated and pushed to the Pull Request head branch.

## Branch Naming

Branch names must follow `kebab-case` pattern. Follow the pattern `feature/<name>` or `fix/<name>` `(folder/<name>)` when it is possible and add issue reference if applicable.

## Commit Naming

Commits must follow the `<type>(<scope>): <subject>` pattern, as stated in the [Conventional Commits specification](https://www.conventionalcommits.org/en/v1.0.0/). The `scope` should be the chart name.

The following is the list of types that can be used:

- `feat:` for new features
- `fix:` for bugfixes
- `improvement:` for enhancements
- `docs:` for documentation and examples
- `refactor:` for code refactoring
- `test:` for tests
- `ci:` for CI purpose
- `chore:` for chores stuff

### Pre-commit hooks

Before making any commits, we strongly recommend running our **pre-commit hooks** over your code. This will run linters and static checks to ensure your code is formatted correctly and you have no syntax errors. To install pre-commit hooks, run the following command:

```bash
make install-pre-commit
```

To run pre-commit hooks after you have installed them, and without making any commits, run the following command:

```bash
make pre-commit
```

The same pre-commit hooks will be run over your code after you push your commits; it is not mandatory to run them locally. However, relying on the CI for the pre-commit check could be an ineffective process, requiring you to push more commits than intended for any likely fix.
