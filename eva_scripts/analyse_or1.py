import os
import sys

RAW_DATA_DIR = "raw_data"
DISTILLED_DATA_DIR = "distilled_data"
GRAPHS_DIR = "graphs"

ROWS = (100*1000*1000)
CARDINALITY = 1000
WORKERS = 16
ALGORITHMS = ["rabit", "cubit-lk", "ub"]

UDI_RATIO_RE = ["0.0", "0.02", "0.05", "0.1", "0.2", "0.3", "0.4", "0.5"]
UDI_RATIO_NORMAL = ["0.0", "0.1", "0.2", "0.3", "0.4", "0.5"]

RQ_RANGE_FIX = 0.15

RQ_RANGE = [0.05, 0.15, 0.25, 0.35, 0.45]
UDI_RATIO_FIX = 0.2

GE_GROUP_SIZE = [50, 100, 200]

global distilled_data_directory
global graphs_directory

def check_rawdata_directory_exist(path):
    if os.path.isdir(path):
        data_path = os.path.join(path, RAW_DATA_DIR)
        if os.path.isdir(data_path):
            print(f"Processing the raw data in  '{path}'.")
            return True

    print(f"The directory '{path}' is not valid.")
    sys.exit(1)


def create_directory(directory_path):
    if not os.path.exists(directory_path):
        os.makedirs(directory_path)
        print(f"Output directory '{directory_path}' has been created.")
    else:
        print(f"WARNING: Output directory '{directory_path}' already exists. \nSkip building the directory and overwrite the existing files.")

def latency_analysis(filename):
    f = open(filename)
    ret = 0.0
    for line in f:
        a = line.split()
        if len(a) != 3 or a[0] != 'Throughput':
            continue
        ret += float(a[1])
    f.close()
    return ret






def draw_or1(directory_path):
    # invoke gnuplot script
    gnu_command = "gnuplot -e 'directory_path=\"" + directory_path + "\"' eva_scripts/gnuplot_scripts/or1.gnu" 
    print("Generating graph using command \n\t" + gnu_command)
    os.system(gnu_command)
    print("\tGraphs are generated in the directory : " + os.path.join(directory_path, GRAPHS_DIR) + "\n")




def convert_eps_to_pdf(directory_path):
    # if epstopdf is not installed, return
    if os.system("which epstopdf") != 0:
        print("epstopdf is not installed. Skip converting eps files to pdf files.")
        return    

    eps_files = os.listdir(os.path.join(directory_path, GRAPHS_DIR))
    print (f"Convert eps files in {eps_files} to pdf files.")
    for eps_file in eps_files:
        if eps_file.endswith(".eps"):
            pdf_file = eps_file.replace(".eps", ".pdf")
            eps_file_path = os.path.join(directory_path, GRAPHS_DIR, eps_file)
            pdf_file_path = os.path.join(directory_path, GRAPHS_DIR, pdf_file)
            os.system(f"epstopdf {eps_file_path} --outfile={pdf_file_path}")
            print(f"Converted {eps_file_path} to {pdf_file_path}")


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python analyse_range.py <directory_path> (clean|analyse)")
        sys.exit(1)
    directory_path = sys.argv[1]
    command = sys.argv[2]

    if command == "clean":
        os.system("rm -rf " + os.path.join(directory_path, DISTILLED_DATA_DIR))
        os.system("rm -rf " + os.path.join(directory_path, GRAPHS_DIR))
        sys.exit(0)

    #check_rawdata_directory_exist(directory_path)

    ### Analyse the raw data ###
    #create_directory(os.path.join(directory_path, DISTILLED_DATA_DIR))

    
    ### Draw figures ###    
    create_directory(os.path.join(directory_path, GRAPHS_DIR))

    draw_or1(directory_path)

    convert_eps_to_pdf(directory_path)

    print("All analyses are done.")