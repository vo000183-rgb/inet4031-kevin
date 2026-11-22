# Week 11 Capstone Notes

## Business Problem

Harborlight Logistics needs to prove that its systems are secure before renewing a contract with one of its customers. Even though the company already has security measures in place, there isn't enough documentation or evidence to show that everything is working properly. This could be an issue when an external auditor comes in to review the company's security.

For this project, I want to look at the security of the current system and see if there are any risks or areas that need improvement. I'll be using different free security tools to scan the system, check its configurations, and collect evidence of the security measures already in place. I also want to document any problems I find and explain what could be done to fix them. This way, the company will have a better understanding of its security and have the evidence needed for the audit.

## Week 11 - Commands That Worked

### Environment Checkpoint

Before starting my security scans, I checked to make sure my Kubernetes cluster and application were still working properly. I checked the nodes, pods, and NetworkPolicies to make sure everything was running as expected.

Commands:
- `kubectl get nodes`
- `kubectl get pods -A`
- `kubectl get networkpolicies -A`

I saved the results in `evidence/environment-checkpoint.txt`.

### Security Tools

I installed and checked the security tools I would be using for this project, including Trivy, Gitleaks, Checkov, kube-score, and Lynis. I recorded the versions in `TOOL-VERSIONS.txt` and saved the Python dependencies in `requirements.txt`.

### Trivy Image Scan

I used Trivy to scan my `week-4-web:v2` Docker image to see if there were any known security vulnerabilities.

The scan found 285 vulnerabilities in the Debian packages and 7 vulnerabilities in the Python packages. There were no critical vulnerabilities reported, but there were still several high and medium findings that I will need to review.

I saved the results in `evidence/trivy-image-baseline.txt`.

### Gitleaks Secrets Scan

I used Gitleaks to check my Git history to see if any passwords, tokens, or other sensitive information were accidentally committed.

Command:
`gitleaks git --redact --report-format json --report-path capstone/cybersecurity-governance/evidence/gitleaks-report.json .`

The scan checked 38 commits and did not find any leaked secrets.

I saved the results in `evidence/gitleaks-report.json`.

### Checkov Configuration Scan

I used Checkov to scan my Week 5 OpenTofu configuration files and check for possible security issues.

The scan showed 65 passed checks and 24 failed checks. This gives me an idea of which configurations might need to be improved as I continue working on the project.

I saved the results in `evidence/checkov-report.txt`.

### Trivy Configuration Scan

I also used Trivy to check my Week 5 infrastructure configuration for security misconfigurations.

The scan did not detect any misconfigurations, but it did give a warning about missing variable values. I will need to keep that in mind when reviewing the results.

I saved the results in `evidence/trivy-config-baseline.txt`.

### GitHub Issues and Project Board

I created five GitHub issues based on the success criteria for the Cybersecurity and Governance track. I also created a project board and added all five issues so I can keep track of what I have completed and what still needs to be done.

The issues are #26, #27, #28, #29, and #30.


## Week 11 - Additional Commands

These are the commands I used to run my security scans and save the results. I wanted to keep track of them so I could run the same scans again later and compare the results.

### Check Tool Versions

```bash
trivy --version
gitleaks version
kube-score version
~/cybersecurity-governance-venv/bin/checkov --version
lynis show version
```

I checked that the tools were installed and working before running the scans.

### Trivy Image Scan

```bash
trivy image --scanners vuln --format table --output capstone/cybersecurity-governance/evidence/trivy-image-baseline.txt week-4-web:v2
```

This scanned my Docker image and saved the results so I could review the vulnerabilities.

### Gitleaks Scan

```bash
gitleaks git --redact --report-format json --report-path capstone/cybersecurity-governance/evidence/gitleaks-report.json .
```

This checked my Git history for any exposed secrets.

### Checkov Scan

```bash
~/cybersecurity-governance-venv/bin/checkov -d week-5 --framework terraform --output cli --output-file-path capstone/cybersecurity-governance/evidence/checkov-baseline.txt
```

I used this to check my OpenTofu configuration for security issues.

I also moved the generated report into my evidence folder:

```bash
mv capstone/cybersecurity-governance/evidence/checkov-baseline.txt/results_cli.txt capstone/cybersecurity-governance/evidence/checkov-report.txt
rmdir capstone/cybersecurity-governance/evidence/checkov-baseline.txt
```

### Trivy Configuration Scan

```bash
trivy config \
  --skip-files "week-5/terraform.tfvars" \
  --skip-files "week-5/terraform.tfstate" \
  --skip-files "week-5/terraform.tfstate.backup" \
  --skip-dirs "week-5/.terraform" \
  --format table \
  --output capstone/cybersecurity-governance/evidence/trivy-config-baseline.txt \
  week-5
```

This checked my infrastructure configuration while excluding local state files and sensitive variable files.


## Application Changes

For this capstone, I decided to keep my existing Flask incident tracker instead of adding new features. Since I'm doing the Cybersecurity and Governance track, I want to focus more on checking the security of my application and finding areas that could be improved.

Based on my first scans, there are already some vulnerabilities and configuration issues that I can look into. I plan to review those findings and make security improvements while keeping the application working the same way.

I'm also keeping the five original success criteria, so I won't be replacing any of them.
