echo "1/3 正在安装依赖包..."
pip3 install -r requirements.txt || exit 1

echo "2/3 正在创建tmp目录并预处理数据..."
mkdir -p tmp/ && python3 preprocess_public_data.py || exit 1

echo "3/3 正在启动训练程序（GPU=0，port=12345）..."
CUDA_VISIBLE_DEVICES=0 python3 main.py \
  --gin_config_file=configs/ml-1m/hstu-sampled-softmax-n128-final.gin \
  --master_port=12345 || exit 1