export STORAGE_BUCKET=gs://ink-ml-1
export TPU_NAME=demo-tpu
export DATA_DIR=$STORAGE_BUCKET/bert_in
export BERT_BASE_DIR=$STORAGE_BUCKET/bert_out


python run_pretraining.py \
  --input_file=$DATA_DIR/tf_examples.tfrecord \
  --output_dir=$BERT_BASE_DIR \
  --use_tpu=True \
  --tpu_name=$TPU_NAME \
  --do_train=True \
  --do_eval=True \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --train_batch_size=32 \
  --max_seq_length=128 \
  --max_predictions_per_seq=20 \
  --num_train_steps=1000000 \
  --num_warmup_steps=100000 \
  --learning_rate=1e-4 \
  --save_checkpoints_steps=200000