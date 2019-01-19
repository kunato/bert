export BPE_DIR=~/ML/bpe
export TEXT_DIR=~/ML/text
export DATA_DIR=~/ML/bert

python create_pretraining_data.py   --input_file=$TEXT_DIR/edit.txt   --output_file=$DATA_DIR/test_examples.tfrecord   --vocab_file=$BPE_DIR/9000.vocab   --max_seq_length=128   --max_predictions_per_seq=20   --masked_lm_prob=0.15   --random_seed=12345   --dupe_factor=5   --thai_text=True   --spm_file=$BPE_DIR/9000.model