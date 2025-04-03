import os
import zipfile

def compress_eps_images(folder_paths, output_zip):
    with zipfile.ZipFile(output_zip, 'w') as zipf:
        for folder_path in folder_paths:
            for root, dirs, files in os.walk(folder_path):
                for file in files:
                    if file.lower().endswith('.eps'):
                        file_path = os.path.join(root, file)
                        zipf.write(file_path, os.path.relpath(file_path, folder_path))

if __name__ == "__main__":
    folder_paths = ["/home/fenghua/Desktop/CUBIT-dev/eva_output/eva_range_25_01_22_11_06_39/graphs", 
                    "/home/fenghua/Desktop/CUBIT-dev/eva_output/eva_diff-cardinality_25_03_04_19_47_53/graphs"]
    output_zip = "/media/sf_ubuntu22/graph.zip" 
    compress_eps_images(folder_paths, output_zip)
    print(f"已将 {folder_paths} 中的所有 .eps 文件压缩为 {output_zip}")