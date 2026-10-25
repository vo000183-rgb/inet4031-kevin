# Week 7, Continuous Delivery

## What this does
- `.github/workflows/deploy-gate.yml` runs on every push to `master`, on GitHub's machines. One job checks the OpenTofu files in `week-5/`, and the other renders the Prometheus chart with `week-6/prometheus-values.yaml`.
- `week-7/deploy.sh` checks GitHub for a new commit on `master`. If the gate passed for that commit, it runs `tofu apply` for the app and `helm upgrade --install` for Prometheus.
- A cron job runs the script every two minutes. The VM connects out to GitHub, and GitHub never connects in. If the VM was off, the first run after it boots catches up.
- A guard at the start of every deploy refuses to continue if the working copy is not on `master`, has uncommitted changes to tracked files, or has commits that are not on GitHub.
- The repository is public, and no workflow in it runs on the VM.

## Requirements
- The Week 5 app and the Week 6 Prometheus running on k3s
- `tofu`, `helm`, `kubectl` and `gh` (logged in) on the VM
- The cron service running, and a cron line for `week-7/deploy.sh` (see below)

## Deploy
Merge a pull request, wait for the gate, and wait up to two minutes. To deploy right away:
\`\`\`
./week-7/deploy.sh
\`\`\`

## Roll back
Revert the merge commit, open a pull request with the revert, and merge it:
\`\`\`
git revert -m 1 <merge-commit>
\`\`\`

## Check on it
\`\`\`
crontab -l
tail -n 20 ~/deploy.log
gh run list --workflow deploy-gate.yml --limit 3
\`\`\`
