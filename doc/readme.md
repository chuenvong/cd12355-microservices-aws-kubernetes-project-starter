Deploy process:
1. Fork entire source into github repository.
2. Create ECR repository for both app & db docker image.
3. Build docker image for postgresql db with Dockerfile under db folder.
4. Tag & push db docker image onto ECR.
5. Update database.yaml with new image uri from ECR.
6. Create CodeBuild project that reference source from github repository for building app docker image.
7. Start CodeBuild and push app docker image onto ECR.
8. Update coworking.yaml with new image uri from ECR.
9. Create EKS cluster.
10. Run "kubectl apply -f deployment" to deploy both app & db deployment & services.

App changes to deploy:
1. Check in changes into github repository.
2. Start CodeBuild and push new app docker image with new build number onto ECR.
3. Update coworking.yaml with new image uri from ECR.
4. Rerun "kubectl apply -f deployment" to deploy updated app.
