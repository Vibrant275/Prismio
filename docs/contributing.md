# Prismio Contributing Guide

Hello!, I am very excited that you are interested in contributing with Prismio. However, before submitting your contribution, be sure to take a moment and read the following guidelines.

- [Code of Conduct](../CODE_OF_CONDUCT.md)
- [Pull request guidelines](#pull-request-guidelines)
- [Development Setup](#development-setup)
- [Documentation](#documentation)
- [Breaking Changes](#breaking-changes)
- [Becoming a maintainer](#becoming-a-maintainer)

### Commit Convention

Before you create a Pull Request, please check whether your commits comply with
the commit conventions used in this repository.

When you create a commit we kindly ask you to follow the convention
`category(scope or module): message` in your commit message while using one of
the following categories:

- `feat / feature`: all changes that introduce completely new code or new
  features
- `fix`: changes that fix a bug (ideally you will additionally reference an
  issue if present)
- `refactor`: any code related change that is not a fix nor a feature
- `docs`: changing existing or creating new documentation (i.e. README, docs for
  usage of a lib or cli usage)
- `build`: all changes regarding the build of the software, changes to
  dependencies or the addition of new dependencies
- `test`: all changes regarding tests (adding new tests or changing existing
  ones)
- `chore`: all changes to the repository that do not fit into any of the above
  categories

  e.g. `feat(components): add new prop to the avatar component`


If you are interested in the detailed specification you can visit
[Conventional Commits](https://www.conventionalcommits.org/ )
## Pull Request Guidelines

- The `master` branch is basically the main branch. All development must be done in dedicated branches and will be merged to `canary` branch.

[//]: # (- Make sure that Github Actions are green)

[//]: # (- It is good to have multiple small commits while working on the PR. We'll let GitHub squash it automatically before the merge.)
- If you add a new feature:
    - Add the test case that accompanies it.
    - Provide a reason to add this feature.

- If you correct an error:
    - If you are solving a special problem, add (fix #xxxx [, # xxx]) (# xxxx is the problem identification) in your PR title for a better launch record, for example update entities encoding / decoding (fix # 3899).
    - Provide a detailed description of the error in the PR.
    - Add the appropriate test coverage, if applicable.


### Steps to PR

1. Fork the Prismio repository and clone your fork

2. Create a new branch out of the `canary` branch. We follow the convention
   `[type/scope]`. For example `fix/dropdown-hook` or `docs/menu-typo`. `type`
   can be either `docs`, `fix`, `feat`, `build`, or any other conventional
   commit type. `scope` is just a short id that describes the scope of work.

3. Make and commit your changes following the
   [commit convention](#commit-convention).


## Development Setup

To contribute to **Prismio**, you'll need to set up your development environment and build the source code. Follow the steps below to get started.

### Prerequisites

Before setting up the development environment, ensure you have the following tools installed:

- **Visual Studio**: Make sure you have the latest version of Visual Studio installed with the C++ development workload.
- **CMake**: Used to build the project.
- **Git**: For version control.


### Steps to Build Prismio

1. **Clone the Repository**  
   First, clone the Prismio repository to your local machine:
   ```bash
   git clone https://github.com/Vibrant275/Prismio.git
   cd Prismio
   
2. We primarily use CLion by JetBrains, but you can use any IDE as per your choice
####

3. **Build the Project**
   Inside Visual Studio, select the appropriate configuration (Debug or Release) and build the project.
4. **Run Prismio**
   Once the project is built, you can run the prismio executable from the command prompt:

```bash
./out/build/x64-debug/Prismio.exe <source-file>
```
For the Release build, use:

```bash
./out/build/x64-release/Prismio.exe <source-file>
```

**Note:** Your IDE can impact the build location of executable, so please verify the executable location in your environment.

### Final Steps
- Send your pull request to the `canary` branch
- Your pull request will be reviewed by the maintainers and the maintainers will decide if it is accepted or not
- Once the pull request is accepted, the maintainers will merge it to the `canary` branch

## Documentation

Please update the [documentation](https://github.com/Vibrant275/Website-Prismio/tree/master/docs) in case you have added a new FileSupport or syntax changes or have implemented new methods. This language and its documentation should always be in sync.

## Breaking changes

Breaking changes should be accompanied with deprecations of removed functionality. The deprecated APIs themselves should not be removed until the minor release after that.

## Becoming a maintainer

If you are interested in becoming a Prismio maintainer, start by
reviewing issues and pull requests. Answer questions for those in need of
troubleshooting. 
Once we see you helping, either we will reach out and ask you if you want to
join or you can ask one of the current maintainers to add you. We will try our
best to be proactive in reaching out to those that are already helping out.

Being a maintainer is not an obligation. You can help when you have time and be
less active when you don't. If you get a new job and get busy, that's alright.