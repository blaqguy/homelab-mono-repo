#!/bin/bash

WORK_DIR="../../../terraform"

# Loop through all subdirectories of WORK_DIR
for dir in "$WORK_DIR"/*; do
    # Check if it's a directory
    if [ -d "$dir" ]; then
        echo "Processing $dir"
        cd "$dir" || exit

        # Run Terraform commands
        terraform init
        terraform validate

        # Run terraform plan
        terraform plan

        # Run terraform apply
        terraform apply -auto-approve
    fi
done
