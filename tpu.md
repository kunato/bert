1. Setup environment https://cloud.google.com/tpu/docs/custom-setup
   - Create VM
   ```
   gcloud compute instances create tpu-demo-vm --machine-type=n1-standard-2 --image-project=ml-images --image-family=tf-1-12 --scopes=cloud-platform
   ```
   - Create TPU
   ```
   gcloud compute tpus create demo-tpu --network=default --range=10.240.1.0/29 --version=1.12 --preemptible
   ```
   - Create Cloud Storage
   ```
   https://console.cloud.google.com/storage/browser
   ```
   - Login gcloud in VM
   ```
   gcloud config set project YOUR-CLOUD-PROJECT
   gcloud config set compute/zone us-central1-b
   gcloud compute tpus list
   ```
2. Upload data-set to cloud storage

3. Give tpu service account permission to admin cloud storage
   ```
   https://cloud.google.com/tpu/docs/storage-buckets
   (Click add on IAM pages and select role as [Project > Viewer, Storage > Storage Admin])
   ```
4. Run the training / classify

Note

- You can use gsutil to manage cloud storage files
- No need for big disk vm
- TPUEstimator should handle the preemptive tpu automatically
- TPU can read and write data only from cloud storage
- No need to pip install on the ml-image vm
- Make sure the zone is same for cloud storage, tpu and vm
- You can stop the tpu while not doing any calculation
- It save checkpoint on only save_checkpoints_steps define in run command or default (1000)
- Run with nohup ...... &
- tail -f nohup.out #redirect nohup.out to terminal
- If TPU fail, vm will automatically restart when it can connect to TPU, so you can restart TPU to make it healtly
- If TPU fail, vm will auto restore only lastest checkpoint avaliable.

