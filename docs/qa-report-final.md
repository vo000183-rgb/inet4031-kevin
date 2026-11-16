# Cybersecurity and Governance QA Report

## Week 11 Test Plan

For this capstone, I'll be checking the security of our current system to see if there are any problems that need to be fixed. I'll be using different security tools to scan our container image, GitHub repository, OpenTofu files, and Kubernetes configurations. I also want to make sure that permissions and network restrictions are set up correctly.

Since Harborlight Logistics needs to prepare for an external audit, these tests will help us see what security measures are already working and what areas might need improvement.

## Planned Tests

### Test 1: Container Image Security

**Tool:** Trivy

I'll use Trivy to scan our web application's container image and check if there are any known vulnerabilities.

**Expected Result:** The scan should show whether there are any vulnerabilities in the image and which ones might need to be addressed.

**Status:** Not tested yet.

### Test 2: Exposed Secrets

**Tool:** Gitleaks

I'll use Gitleaks to check our Git repository history and see if any passwords, API keys, or other sensitive information were accidentally committed.

**Expected Result:** The scan should tell me if there are any possible exposed secrets in our repository history.

**Status:** Not tested yet.

### Test 3: Infrastructure Configuration

**Tools:** Checkov and Trivy

I'll use Checkov and Trivy to scan the OpenTofu files in our `week-5` folder. I want to see if there are any security issues or settings that could be improved.

**Expected Result:** Both tools should give me results showing which configurations passed and which ones might have security concerns.

**Status:** Not tested yet.

### Test 4: Kubernetes Configuration

**Tool:** kube-score

I'll use kube-score to check our Kubernetes deployments and see if there are any problems with how they're configured.

**Expected Result:** The results should show if there are any configuration issues or recommendations that we should look into.

**Status:** Not tested yet.

### Test 5: Access Permissions

**Tool:** kubectl

I'll use kubectl to check what permissions different Kubernetes accounts have. I want to make sure that accounts aren't able to access or change things they shouldn't have permission to.

**Expected Result:** The permission checks should help me see what each account is allowed to do and whether anything needs to be restricted.

**Status:** Not tested yet.

### Test 6: Network Restrictions

**Tool:** kubectl

I'll check our existing NetworkPolicy to see how traffic to the database is being controlled. Since we already worked on restricting database access in previous labs, I want to make sure those restrictions are still in place.

**Expected Result:** The NetworkPolicy should show that only approved workloads are allowed to connect to the database.

**Status:** Not tested yet.

## Week 11 Notes

For Week 11, I'm starting by writing down the tests I plan to run before making any changes to the system. As I continue working on the capstone, I'll update this report with the results, any problems I find, and the evidence I collect. This will also help me keep track of what I've tested and what still needs to be done before the final audit.
