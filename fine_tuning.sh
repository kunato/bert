export STORAGE_BUCKET=gs://ink-ml-1
export TPU_NAME=demo-tpu
export BPE_DIR=$STORAGE_BUCKET/bpe
export XNLI_DIR=$STORAGE_BUCKET/xnli
export OUTPUT_DIR=$STORAGE_BUCKET/xnli_out
export BERT_BASE_DIR=$STORAGE_BUCKET/bert_out

python run_classifier.py \
  --task_name=XNLI \
  --do_train=true \
  --do_eval=true \
  --use_tpu=True \
  --data_dir=$XNLI_DIR \
  --vocab_file=$BPE_DIR/9000.vocab \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/model.ckpt \
  --max_seq_length=128 \
  --train_batch_size=32 \
  --learning_rate=5e-5 \
  --num_train_epochs=2.0 \
  --output_dir=$OUTPUT_DIR \
  --xnli_language=th \
  --spm_file=$BPE_DIR/9000.model