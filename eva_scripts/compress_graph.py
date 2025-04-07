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
    folder_paths = ["/home/gaofei/data_gf/gnu/eva_output/test_25_03_30/graphs"
                    ]
    output_zip = "/home/gaofei/data_gf/gnu/eva_output/test_25_03_30/graphs.zip" 
    compress_eps_images(folder_paths, output_zip)
    print(f"已将 {folder_paths} 中的所有 .eps 文件压缩为 {output_zip}")