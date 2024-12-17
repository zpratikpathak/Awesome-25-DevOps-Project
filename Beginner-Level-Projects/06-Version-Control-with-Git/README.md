# Version Control with Git

## Overview

In this project, you will learn the basics of version control using Git. This project is designed for beginners who want to get started with version control and Git.

## Prerequisites

- Basic knowledge of the command line
- Git installed on your machine
- A text editor (e.g., Vim, Nano, or VS Code)

## Project Structure

- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Beginner-Level-Projects/06-Version-Control-with-Git
   ```

2. Initialize a new Git repository:
   ```bash
   git init
   ```

3. Create a new file (e.g., `example.txt`) and add some content to it:
   ```bash
   echo "Hello, Git!" > example.txt
   ```

4. Add the file to the staging area:
   ```bash
   git add example.txt
   ```

5. Commit the changes:
   ```bash
   git commit -m "Initial commit"
   ```

## Example Git Commands

### 1. Check the Status

This command shows the current status of the working directory and staging area.

```bash
git status
```

### 2. View the Commit History

This command displays the commit history of the repository.

```bash
git log
```

### 3. Create a New Branch

This command creates a new branch in the repository.

```bash
git branch new-branch
```

### 4. Switch to a Branch

This command switches to the specified branch.

```bash
git checkout new-branch
```

### 5. Merge Branches

This command merges the specified branch into the current branch.

```bash
git merge new-branch
```

### 6. Resolve Merge Conflicts

If there are merge conflicts, Git will prompt you to resolve them. Open the conflicting files in your text editor and resolve the conflicts. Then, add the resolved files to the staging area and commit the changes.

```bash
git add resolved-file.txt
git commit -m "Resolved merge conflicts"
```

## Conclusion

By completing this project, you will have gained a solid understanding of version control using Git. Feel free to explore more advanced Git features and workflows to further enhance your skills.
