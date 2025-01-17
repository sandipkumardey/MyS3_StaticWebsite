# Deploy Static Website on AWS S3 with Terraform

## Overview
This guide shows how to deploy a simple static website on **AWS S3** using **Terraform**. The setup includes:
- `index.html` (main page)
- `error.html` (error page)
- `profile.png` (image file)

---

## Steps to Deploy

1. **Prepare Files**  
   Ensure the following files are in the same folder as the Terraform config (`main.tf`):
   - `index.html`
   - `error.html`
   - `profile.png`

2. **Update Terraform Config**  
   Verify that the paths to your files are correct in the `source` attribute (e.g., `source = "index.html"`).

3. **Run Terraform**  
   - Initialize Terraform:  
     ```bash
     terraform init
     ```
   - Generate the execution plan:  
     ```bash
     terraform plan
     ```
   - Apply the configuration to deploy the resources:  
     ```bash
     terraform apply
     ```

4. **Verify**  
   After deployment, visit the S3 bucket URL to see your live website.  
   Format: `http://<your-bucket-name>.s3-website-<region>.amazonaws.com`

---

## Troubleshooting
- Ensure `index.html` and `error.html` are properly uploaded.
- Confirm the correct file paths in Terraform.

---

### Screenshots
<img width="1470" alt="Image" src="https://github.com/user-attachments/assets/a6b3ad44-c3bd-465e-a21a-80f6d700a660" />

<img width="1082" alt="Image" src="https://github.com/user-attachments/assets/c6d91b15-190f-4feb-9185-aac8e2df1b0c" />
<img width="1386" alt="Image" src="https://github.com/user-attachments/assets/c8beb50e-27c4-42b9-a5d4-2dddac923ea9" />
<img width="1174" alt="Image" src="https://github.com/user-attachments/assets/54dd0502-94f3-43d5-b677-ea14bd256a72" />

<img width="895" alt="Image" src="https://github.com/user-attachments/assets/f0c752ae-8fb0-4f34-9b1f-6e53f2bb41ff" />
<img width="1176" alt="Image" src="https://github.com/user-attachments/assets/8083bc87-480c-4096-91f5-813c0800ae0c" />

---

This concise guide should provide a quick overview of the setup and steps, backed by visuals for clarity.
