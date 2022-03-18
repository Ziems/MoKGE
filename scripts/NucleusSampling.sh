########################
#### Run experiment
########################

DATASET=${}
INPUT_DIR=${}
OUTPUT_DIR=${}
P=${} # Nucleus Prob: 0.5 / 0.75 / 0.95 ...

option="
    --data_dir ${INPUT_DIR}/${DATASET}
    --model_name_or_path facebook/bart-base  
    --model_type sampling
    --output_dir ${OUTPUT_DIR}/NucleusSampling_Output
    --max_source_length 40
    --max_target_length 60 
    --val_max_target_length 60
    --test_max_target_length 60
    --num_train_epochs 30
    --learning_rate 3e-5 
    --fp16 
    --do_train 
    --do_eval 
    --do_predict
    --eval_beams 3 
    --do_sample 
    --top_p ${P}
    --per_device_train_batch_size 100
    --per_device_eval_batch_size 100
    --predict_with_generate 
    --load_best_model_at_end 
    --overwrite_output_dir 
    --evaluate_during_training
"

cmd="python3 main.py ${option}"

echo $cmd
eval $cmd