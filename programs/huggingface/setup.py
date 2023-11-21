

# python embedded script functionality f
from huggingface_hub import hf_hub_download
hf_hub_download(repo_id="google/pegasus-xsum", filename="config.json")

# logging  in
from huggingface_hub import login
login()

# creating a repository
from huggingface_hub import HfApi
api = HfApi()
api.create_repo(repo_id="super-cool-model")

# uploading
from huggingface_hub import HfApi
api = HfApi()
api.upload_file(
    path_or_fileobj="/home/lysandre/dummy-test/README.md",
    path_in_repo="README.md",
    repo_id="lysandre/test-model",
)
