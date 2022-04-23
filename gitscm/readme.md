# Configurations

```bash
> git config --list --show-origin
> git config push.followTags true
```

Showing remote info
```bash
> git remote -v
  origin    https://github.com/YOUR_USERNAME/YOUR_FORK.git (fetch)
  origin    https://github.com/YOUR_USERNAME/YOUR_FORK.git (push)
  upstream  https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git (fetch)
  upstream  https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git (push)
```

Syncing a fork
```bash
> git remote add upstream https://github.com/octocat/Spoon-Knife.git
> git checkout main
> git merge upstream/main
```

Git log
```bash
> git log
> git log --oneline
> git log --oneline --graph
> git log --oneline --graph --decorate
> git log --oneline --graph --decorate --all
> git log --stat
> git log --patch
```

# Push Empty Commit

```bash
git commit --allow-empty -m "Trigger Build"
git push
```

# Git Commands to Find Build Failure (git bisect)

- http://lifuzu.com/blog/2015/06/02/using-git-command-to-find-build-failure-very-quickly/

# Other Notes

- https://github.com/github/platform-samples/tree/master/scripts
- https://docs.github.com/en/enterprise-server@2.22/admin/policies/creating-a-pre-receive-hook-script
